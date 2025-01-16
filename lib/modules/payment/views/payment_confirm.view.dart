import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:paily/modules/payment/views/payment_result.view.dart';
import 'package:paily/modules/payment/widgets/wallet_select_card.widget.dart';
import 'package:paily/modules/wallet/providers/wallet_asset.provider.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';
import 'package:paily/shared/themes/app_radius.theme.dart';
import 'package:paily/shared/widgets/section_group.widget.dart';
import 'package:paily/shared/widgets/view_appbar.widget.dart';

class PaymentConfirmView extends HookConsumerWidget {
  const PaymentConfirmView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCardIndex = useState('');

    final theme = Theme.of(context);
    
    final walletAsset = ref.watch(listWalletAssetProvider);

    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: ViewAppBar(
            title: 'Payment Confirm',
          ),
          bottomNavigationBar: Container(
            padding: AppPaddingTheme.contentPadding.copyWith(
              top: 0,
              bottom: 0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      'Total',
                      style: theme.textTheme.titleSmall,
                    ),
                    Spacer(),
                    Text(
                      '\$10.2',
                      style: theme.textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    child: Text('Confirm Payment'),
                    onPressed: () async {
                      final LocalAuthentication auth = LocalAuthentication();

                      try {
                        final bool didAuthenticate = await auth.authenticate(
                          localizedReason: 'Please authenticate to confirm payment',
                        );

                        if (didAuthenticate) {
                          if (context.mounted) {
                            Navigator
                              .of(context)
                              .pushReplacement(
                                CupertinoPageRoute(
                                  builder: (context) => PaymentResultView(),
                                ),
                              );
                          }
                        }
                      } on PlatformException {
                        if (context.mounted) {
                          ScaffoldMessenger
                            .of(context)
                            .showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Failed to authenticate. Please try again.',
                                ),
                              ),
                            );
                        }
                      }
                    },
                  ),
                )
              ],
            ),
          ),
          body: Padding(
            padding: AppPaddingTheme.contentPadding,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 96,
                    child: switch(walletAsset) {
                      AsyncData(:final value) => SectionGroup(
                        title: 'Wallet & Card',
                        itemCount: value.length,
                        itemBuilder: (context, i) {
                          return WalletSelectCard(
                            isSelected: value[i].id == selectedCardIndex.value,
                            onSelect: () {
                              selectedCardIndex.value = value[i].id;
                            },
                            image: value[i].iconImageUrl,
                            title: value[i].name,
                            balance: value[i].amount,
                          );
                        },
                      ),
                      AsyncError(:final error) => Text(error.toString()),
                      _ => SectionGroup(
                        title: 'Wallet & Card',
                        itemCount: 3,
                        itemBuilder: (context, i) {
                          return WalletSelectCard(loading: true);
                        },
                      ),
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: 24),
                    child: SectionGroup(
                    title: 'Transaction Details',
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerLowest,
                        borderRadius: AppRadiusTheme.containerRadius,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 12,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Amount'),
                                Text(
                                  'VND 250,000 (\$10.00)',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Send to'),
                                Text(
                                  'PAILY COMPANY LIMITED',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                  Text('Bank'),
                                  Text(
                                    'Vietcombank',
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                  Text('Account Number'),
                                  Text('123456',
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                  Text('Fee (2%)'),
                                  Text('\$0.2',
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                  Text('Total'),
                                  Text('\$10.2',
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 24),
                              child: Column(
                                spacing: 6,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Coupon', 
                                    style: theme.textTheme.titleSmall
                                  ),
                                  Text(
                                    'Add a coupon or enter a promo code',
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 12),
                                    width: double.infinity,
                                    child: FilledButton(
                                      child: Text('Add a coupon'), 
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                          context: context, 
                                          builder: (context) {
                                            return Container(
                                              padding: AppPaddingTheme.contentPadding,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Add a coupon',
                                                    style: theme.textTheme.titleSmall
                                                  ),
                                                  SizedBox(height: 12),
                                                  Container(
                                                    margin: EdgeInsets.only(top: 24),
                                                    padding: EdgeInsets.all(15),
                                                    decoration: BoxDecoration(
                                                      color: theme.colorScheme.surfaceContainerLowest,
                                                      borderRadius: BorderRadius.circular(15),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Shop Name',
                                                          style: theme.textTheme.bodyMedium!.copyWith(
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                        SizedBox(height: 12),
                                                        Row(
                                                          spacing: 6,
                                                          children: [
                                                            CachedNetworkImage(
                                                              imageUrl: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Flogos%2Fmastercard_logo.png?alt=media&token=71a0ff31-9e78-4684-b4f5-3163196a187a',
                                                              width: 48,
                                                              height: 48,
                                                            ),
                                                            SizedBox(width: 12),
                                                            Text(
                                                              'Discount 10% for all products',
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 6),
                                                        Divider(),
                                                        SizedBox(height: 6),
                                                        Container(
                                                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                                          decoration: BoxDecoration(
                                                            color: theme.colorScheme.primaryContainer,
                                                            borderRadius: BorderRadius.circular(12),
                                                          ),
                                                          child: Text(
                                                            'Expires on: 12/12/2023',
                                                            style: theme.textTheme.bodySmall!.copyWith(
                                                              color: theme.colorScheme.primary,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          }
                                        );
                                      }
                                    )
                                  ),
                                ],
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
          
          // SingleChildScrollView(
          //   child: Column(
          //     children: [
                
          //       SectionGroup(
          //         title: 'Transaction Details',
          //         child: Text('A'),
          //       )
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}