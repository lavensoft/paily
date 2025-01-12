import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:paily/modules/home/views/home.view.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';
import 'package:paily/shared/themes/app_radius.theme.dart';
import 'package:paily/shared/widgets/view_appbar.widget.dart';
import 'package:share_plus/share_plus.dart';

class PaymentResultView extends HookConsumerWidget {
  const PaymentResultView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: ViewAppBar(
            hideBackButton: true,
            actions: [
              IconButton(
                icon: Icon(
                  HugeIcons.strokeRoundedShare05,
                ),
                onPressed: () {
                  Share.share('Paily Receipt');
                },
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: AppPaddingTheme.viewPadding.copyWith(
              top: 0,
              bottom: 0,
            ),
            child: FilledButton(
              child: Text('Done'),
              onPressed: () async {
                Navigator
                  .of(context)
                  .pushReplacement(
                    CupertinoPageRoute(
                      builder: (context) => HomeView()
                    ),
                  );
              },
            ),
          ),
          body: Padding(
            padding: AppPaddingTheme.viewPadding,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: 24),
                    child: Column(
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 72,
                          color: CupertinoColors.activeGreen,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'VND 250,000',
                          style: theme.textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          '\$ 10.00',
                          style: theme.textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: CupertinoColors.secondaryLabel
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: 24),
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
                          ],
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