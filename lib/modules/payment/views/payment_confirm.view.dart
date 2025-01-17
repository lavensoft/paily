import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:paily/modules/coupon/providers/coupon.provider.dart';
import 'package:paily/modules/coupon/widgets/coupon_card.widget.dart';
import 'package:paily/modules/payment/providers/payment.provider.dart';
import 'package:paily/modules/payment/views/payment_result.view.dart';
import 'package:paily/modules/payment/widgets/wallet_select_card.widget.dart';
import 'package:paily/modules/wallet/providers/wallet_asset.provider.dart';
import 'package:paily/shared/helpers/formatter.helper.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';
import 'package:paily/shared/themes/app_radius.theme.dart';
import 'package:paily/shared/widgets/section_group.widget.dart';
import 'package:paily/shared/widgets/view_appbar.widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PaymentConfirmView extends HookConsumerWidget {
  const PaymentConfirmView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedWalletIndex = useState('');

    final theme = Theme.of(context);
    
    final walletAsset = ref.watch(walletAssetNotifierProvider);
    final payment = ref.watch(paymentNotifierProvider);
    final paymentNotifier = ref.watch(paymentNotifierProvider.notifier);
    final listMeCoupon = ref.watch(listMeCouponProvider);

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
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  spacing: 6,
                  children: [
                    Text(
                      'Total',
                      style: theme.textTheme.titleSmall,
                    ),
                    Spacer(),
                    Text(
                      '\$${
                        FormatHelper.formatNumber(payment.totalLocalCur ?? 0)
                      }',
                      style: theme.textTheme.bodyLarge!.copyWith(
                        decoration: TextDecoration.lineThrough
                      ),
                    ),
                    Text(
                      '\$${FormatHelper.formatNumber(payment.totalLocalCur ?? 0)}',
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
                      if (selectedWalletIndex.value.isEmpty) {
                        ScaffoldMessenger
                          .of(context)
                          .showSnackBar(
                            SnackBar(
                              content: Text('Please select a wallet to pay'),
                            ),
                          );
                        return;
                      }

                      final LocalAuthentication auth = LocalAuthentication();

                      try {
                        final bool didAuthenticate = await auth.authenticate(
                          localizedReason: 'Please authenticate to confirm payment',
                        );

                        if (didAuthenticate) {
                          if (context.mounted) {
                            await paymentNotifier.confirmPayment();

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
                          return Padding(
                            padding: EdgeInsets.only(left: 2),
                            child: WalletSelectCard(
                              isSelected: value[i].id == selectedWalletIndex.value,
                              onSelected: () {
                                selectedWalletIndex.value = value[i].id;
                                paymentNotifier.updateAsset(value[i]);
                              },
                              image: value[i].iconImageUrl,
                              title: value[i].name,
                              balance: value[i].amount,
                            ),
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
                                  'VND ${
                                    FormatHelper.formatNumber(payment.amount ?? 0, 'vi_VN')
                                  } (\$${
                                    FormatHelper.formatNumber(payment.amountLocalCur ?? 0)
                                  })',
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
                                  payment.toBank?.accountName ?? '',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Bank'),
                                Text(
                                  '${payment.toBank?.bank?.name}\n(${payment.toBank?.bank?.shortName})',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Account Number'),
                                Text(
                                  payment.toBank?.accountNumber ?? '',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Remark'),
                                Text(
                                  payment.note ?? '',
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
                                Text(
                                  '\$${
                                    FormatHelper.formatNumber(payment.feeLocalCur ?? 0)
                                  }',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              spacing: 6,
                              children: [
                                Text('Total'),
                                Spacer(),
                                Text(
                                  '\$${
                                    FormatHelper.formatNumber(payment.totalLocalCur ?? 0)
                                  }',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    decoration: TextDecoration.lineThrough
                                  ),
                                ),
                                Text(
                                  '\$${
                                    FormatHelper.formatNumber(payment.totalLocalCur ?? 0)
                                  }',
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Coupon', 
                                        style: theme.textTheme.titleSmall
                                      ),
                                      Visibility(
                                        visible: payment.discountLocalCur != 0 && payment.discountLocalCur != null,
                                        child: Badge(
                                          label: Text('Discount \$${payment.discountLocalCur}'),
                                          backgroundColor: CupertinoColors.activeGreen.withOpacity(.09),
                                          textColor: CupertinoColors.activeGreen,
                                        )
                                      )
                                    ],
                                  ),
                                  Text(
                                    'Add a coupon or enter a promo code',
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: payment.coupons?.length ?? 0,
                                    itemBuilder: (context, index) {
                                      return CouponCard(coupon: payment.coupons![index]);
                                    },
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 12),
                                    width: double.infinity,
                                    child: switch(listMeCoupon) {
                                      AsyncError(:final error) => Text(error.toString()),
                                      AsyncData(:final value) => FilledButton(
                                        child: Text('Add a coupon'), 
                                        onPressed: () async {
                                          //!HARDCODE: Limit for 1 coupon
                                          if (payment.coupons?.length == 1) {
                                            ScaffoldMessenger
                                              .of(context)
                                              .showSnackBar(
                                                SnackBar(
                                                  content: Text('You can only apply 1 coupon'),
                                                ),
                                              );
                                            return;
                                          }

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
                                                    ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: value.length,
                                                      itemBuilder: (context, index) {
                                                        return CouponCard(
                                                          coupon: value[index],
                                                          onTap: () {
                                                            ref.read(paymentNotifierProvider.notifier).applyCoupon(value[index]);
                                                            Navigator.of(context).pop();
                                                          },
                                                        );
                                                      },
                                                    )
                                                  ],
                                                ),
                                              );
                                            }
                                          );
                                        }
                                      ),
                                      _ => Skeletonizer(
                                        child: FilledButton(onPressed: () {}, child: Text('Add a coupon'))
                                      )
                                    }
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