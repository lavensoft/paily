import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';
import 'package:paily/shared/themes/app_radius.theme.dart';
import 'package:paily/shared/widgets/section_group.widget.dart';
import 'package:paily/shared/widgets/view_appbar.widget.dart';

class PaymentConfirmView extends StatefulWidget {
  const PaymentConfirmView({super.key});

  @override
  _PaymentConfirmViewState createState() => _PaymentConfirmViewState();
}

class _PaymentConfirmViewState extends State<PaymentConfirmView> {
  int _selectedCardIndex = -1;

  void _onCardSelected(int index) {
    setState(() {
      _selectedCardIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: ViewAppBar(
            title: 'Payment Confirm',
          ),
          bottomNavigationBar: Container(
            padding: AppPaddingTheme.viewPadding.copyWith(
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
                  child: ElevatedButton(
                    child: Text('Confirm Payment'),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
          body: Padding(
            padding: AppPaddingTheme.viewPadding,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 96,
                    child: SectionGroup(
                      title: 'Wallet & Card',
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return WalletCard(
                          index: index,
                          isSelected: index == _selectedCardIndex,
                          onSelect: _onCardSelected,
                          image: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Flogos%2Fmastercard_logo.png?alt=media&token=71a0ff31-9e78-4684-b4f5-3163196a187a',
                          title: 'USDT',
                          balance: '100.00',
                        );
                      },
                    ),
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
                                  'VND 20.000 (\$10.00)',
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
                                  'TRAN QUANG NHAT',
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
                                  Text('20782048',
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
                                    child: ElevatedButton(
                                      child: Text('Add a coupon'), 
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                          context: context, 
                                          builder: (context) {
                                            return Container(
                                              padding: AppPaddingTheme.viewPadding,
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
                                                      color: Colors.white,
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
                                                        SizedBox(height: 3),
                                                        Divider(
                                                          color: Colors.grey,
                                                          thickness: 1,
                                                          indent: 10,
                                                          endIndent: 10,
                                                        ),
                                                        SizedBox(height: 3),
                                                        Container(
                                                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                                          decoration: BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius: BorderRadius.circular(12),
                                                          ),
                                                          child: Text(
                                                            'Expires on: 12/12/2023',
                                                            style: theme.textTheme.bodySmall!.copyWith(
                                                              color: Colors.white,
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

class WalletCard extends StatelessWidget {
  final int index;
  final bool isSelected;
  final Function(int) onSelect;
  final String image;
  final String title;
  final String balance;

  const WalletCard({
    super.key, 
    required this.index,
    required this.isSelected,
    required this.onSelect,
    required this.image,
    required this.title,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => onSelect(index),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 9,
        ),
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primaryContainer : Colors.white,
          border: Border.all(
            color: isSelected ? theme.primaryColor : theme.colorScheme.outline,
            width: isSelected ? 2 : 1,
            strokeAlign: BorderSide.strokeAlignOutside
          ),
          borderRadius: AppRadiusTheme.childRadius,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,  
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12,
          children: [
            CachedNetworkImage(
              imageUrl: image,
              width: 30,
              height: 30,
            ),
            Column(
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600
                  )
                ),
                Text(
                  balance,
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: theme.colorScheme.onSurfaceVariant
                  )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}