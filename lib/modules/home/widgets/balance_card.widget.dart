import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:paily/modules/payment/views/payment_account_input.view.dart';
import 'package:paily/modules/payment/views/payment_amount_input.view.dart';
import 'package:paily/modules/payment/views/payment_confirm.view.dart';
import 'package:paily/modules/payment/views/qr_scan.view.dart';
import 'package:paily/shared/widgets/action_button.widget.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(21),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(21)
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
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: Color.fromRGBO(174, 174, 174, 1)
                ),
              ),
            ],
          ),
          Text(
            '\$ 1.000,00',
            style: theme.textTheme.titleLarge!.copyWith(
              color: Colors.white
            ),
          ),
          Text(
            'VND 23.000.000',
            style: theme.textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500
            ),
          ),
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
                    CupertinoPageRoute(builder: (context) => PaymentAccountInputView())
                  );
                },
              ),
              ActionButton(
                icon: HugeIcons.strokeRoundedWallet01,
                label: 'Deposit',
                onPressed: () {
                  Navigator.push(
                    context, 
                    CupertinoPageRoute(builder: (context) => PaymentAmountInputView())
                  );
                },
              ),
              ActionButton(
                icon: HugeIcons.strokeRoundedQrCode01,
                label: 'QR Scan',
                onPressed: () {
                  Navigator.push(
                    context, 
                    CupertinoPageRoute(builder: (context) => QRScanView())
                  );
                },
              ),
              ActionButton(
                icon: HugeIcons.strokeRoundedGift,
                label: 'Cashback',
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => PaymentConfirmView())
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