import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paily/modules/payment/views/payment_account_input.view.dart';
import 'package:paily/modules/payment/widgets/qr_scan_appbar.widget.dart';
import 'package:paily/shared/assets/image.asset.dart';

class QRScanView extends StatelessWidget {
  const QRScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AiBarcodeScanner(
        onDispose: () { },
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.noDuplicates,
        ),
        onDetect: (BarcodeCapture capture) {
          Navigator
            .of(context)
            .push(
              CupertinoPageRoute(
                builder: (context) {
                  return PaymentAccountInputView();
                },
              )
            );
        },
        validator: (value) {
          if (value.barcodes.isEmpty) {
            return false;
          }

          if (value.barcodes.first.format != BarcodeFormat.qrCode) {
            return false;
          }

          //Validate is EMVCO QR Code
          // if (value.barcodes.first.rawValue != null) {
          //   final RegExp regExp = RegExp(r'(?:\d{2}\d{2}[A-Za-z0-9]*)');
          //   if (!regExp.hasMatch(value.barcodes.first.rawValue!)) {
          //     return false;
          //   }
          // }

          return true;
        },
        appBarBuilder: (context, controller) {
          return QrScanAppBar(
            controller: controller,
          );
        },
        borderColor: Colors.white,
        overlayColor: Colors.white,
        bottomSheetBuilder: (context, _) {
          return FittedBox(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 21, vertical: 48),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 300),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 18,
                    runSpacing: 18,
                    children: [
                      ImageAssets.vnpayLogo,
                      ImageAssets.vietQrLogo,
                      ImageAssets.momoLogo,
                      ImageAssets.zaloPayLogo,
                      ImageAssets.napasLogo,
                    ].map((asset) {
                      return Image.asset(
                        height: 21,
                        asset,
                      );
                    }).toList()
                  ),
                )
              ),
            ),
          );
        },
        hideGalleryButton: true,
      ),
    );
  }
}