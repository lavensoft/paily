import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
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
          // /// The row string scanned barcode value
          // final String? scannedValue =
          //     capture.barcodes.first.rawValue;
      
          // /// The `Uint8List` image is only available if `returnImage` is set to `true`.
          // final Uint8List? image = capture.image;
      
          // /// row data of the barcode
          // final Object? raw = capture.raw;
      
          // /// List of scanned barcodes if any
          // final List<Barcode> barcodes = capture.barcodes;
        },
        validator: (value) {
          if (value.barcodes.isEmpty) {
            return false;
          }

          if (value.barcodes.first.format != BarcodeFormat.qrCode) {
            return false;
          }

          //Validate is EMVCO QR Code
          if (value.barcodes.first.rawValue != null) {
            final RegExp regExp = RegExp(r'(?:\d{2}\d{2}[A-Za-z0-9]*)');
            if (!regExp.hasMatch(value.barcodes.first.rawValue!)) {
              return false;
            }
          }

          return true;
        },
        borderColor: Colors.transparent,
        overlayColor: Colors.white,
        appBarBuilder: (context, controller) {
          return QrScanAppBar(
            controller: controller,
          );
        },
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