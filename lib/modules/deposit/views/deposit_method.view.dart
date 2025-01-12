import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:paily/modules/deposit/views/deposit_bank_qr.view.dart';
import 'package:paily/modules/deposit/views/deposit_crypto_qr.view.dart';
import 'package:paily/modules/deposit/views/deposit_hub_list.view.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';
import 'package:paily/shared/themes/app_radius.theme.dart';
import 'package:paily/shared/widgets/view_appbar.widget.dart';

class DepositMethodView extends HookConsumerWidget {
  const DepositMethodView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: ViewAppBar(
            title: 'Deposit',
          ),
          body: Padding(
            padding: AppPaddingTheme.contentPadding,
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(
                    HugeIcons.strokeRoundedBank,
                    color: theme.primaryColor,
                  ),
                  title: Text(
                    'Transfer from bank',
                    style: theme.textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    'Add money by bank transfer',
                    style: theme.textTheme.bodySmall,
                  ),
                  onTap: () {
                    Navigator
                      .of(context)
                      .push(
                        CupertinoPageRoute(
                          builder: (context) => DepositBankQRView(),
                        )
                      );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: AppRadiusTheme.childRadius,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    HugeIcons.strokeRoundedBitcoin04,
                    color: theme.primaryColor,
                  ),
                  title: Text(
                    'Transfer from crypto',
                    style: theme.textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    'Add money by USDC or USDT',
                    style: theme.textTheme.bodySmall,
                  ),
                  onTap: () {
                    Navigator
                      .of(context)
                      .push(
                        CupertinoPageRoute(
                          builder: (context) => DepositCryptoQRView(),
                        )
                      );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: AppRadiusTheme.childRadius,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    HugeIcons.strokeRoundedLocation01,
                    color: theme.primaryColor,
                  ),
                  title: Text(
                    'Deposit cash',
                    style: theme.textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    'Find the nearest loading location',
                    style: theme.textTheme.bodySmall,
                  ),
                  onTap: () {
                    Navigator
                      .of(context)
                      .push(
                        CupertinoPageRoute(
                          builder: (context) => DepositHubListView(),
                        )
                      );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: AppRadiusTheme.childRadius,
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}