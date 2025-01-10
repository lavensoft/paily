import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:paily/modules/payment/views/qr_scan.view.dart';
import 'package:paily/shared/widgets/view_appbar.widget.dart';

class PaymentAccountInputAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PaymentAccountInputAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewAppBar(
      title: 'Transfer to bank account',
      actions: [
        IconButton(
          icon: Icon(
            HugeIcons.strokeRoundedQrCode01,
          ),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => QRScanView()),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}