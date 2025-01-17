import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:paily/modules/deposit/views/deposit_method.view.dart';
import 'package:paily/modules/payment/views/payment_account_input.view.dart';
import 'package:paily/modules/payment/views/qr_scan.view.dart';
import 'package:paily/shared/helpers/formatter.helper.dart';
import 'package:paily/shared/themes/app_radius.theme.dart';
import 'package:paily/shared/widgets/action_button.widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard(
      {super.key,
      this.foreignBalance,
      this.localBalance,
      this.foreignCurrencySymbol,
      this.localCurrencySymbol,
      this.loading = false});

  final double? foreignBalance;
  final double? localBalance;
  final String? foreignCurrencySymbol;
  final String? localCurrencySymbol;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(21),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: AppRadiusTheme.containerRadius,
        image: DecorationImage(
          image: AssetImage('assets/images/cards/card.png'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.3),
            offset: Offset(0, 6),
            blurRadius: 12,
          ),
        ]
      ),
      height: 240,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Total balance',
                style: theme.textTheme.bodyLarge!
                    .copyWith(color: Color.fromRGBO(174, 174, 174, 1)),
              ),
            ],
          ),
          Skeletonizer(
              enabled: loading,
              child: Text(
                '$localCurrencySymbol ${FormatHelper.formatNumber(localBalance ?? 0)}',
                style:
                    theme.textTheme.titleMedium!.copyWith(color: Colors.white),
              )),
          Skeletonizer(
              enabled: loading,
              child: Text(
                '$foreignCurrencySymbol ${FormatHelper.formatNumber(foreignBalance ?? 0)}',
                style: theme.textTheme.bodyLarge!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
              )),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ActionButton(
                icon: HugeIcons.strokeRoundedSent,
                label: 'Send',
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => PaymentAccountInputView()));
                },
              ),
              ActionButton(
                icon: HugeIcons.strokeRoundedWallet01,
                label: 'Deposit',
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => DepositMethodView()));
                },
              ),
              ActionButton(
                icon: HugeIcons.strokeRoundedQrCode01,
                label: 'QR Scan',
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => QRScanView()));
                },
              ),
              ActionButton(
                icon: HugeIcons.strokeRoundedGift,
                label: 'Cashback',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Coming soon'),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
