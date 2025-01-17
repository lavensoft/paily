import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paily/modules/bank/models/bank_beneficiary.model.dart';
import 'package:paily/modules/bank/providers/bank.provider.dart';
import 'package:paily/modules/payment/providers/payment.provider.dart';
import 'package:paily/modules/payment/views/payment_account_input.view.dart';
import 'package:paily/modules/payment/widgets/qr_scan_appbar.widget.dart';
import 'package:paily/shared/assets/image.asset.dart';

class QRScanView extends ConsumerWidget {
  const QRScanView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
    );
    
    final paymentNotifier = ref.watch(paymentNotifierProvider.notifier);
    final listBank = ref.watch(listBankProvider.future);

    onDetect(String value) async {
      Map<String, dynamic> emv = parseEmv(value);
      final banks = await listBank;
      final bank = banks.firstWhere((element) => element.code == emv['38']['01']['00']);

      final beneficiary = BankBeneficiary(
        bank: bank,
        accountNumber: emv['38']['01']['01'],
      );

      paymentNotifier.updateToBank(beneficiary);

      if (context.mounted) {
        Navigator
        .of(context)
        .pushReplacement(
          CupertinoPageRoute(
            builder: (context) {
              return PaymentAccountInputView();
            },
          )
        );

        controller.dispose();
      }
    }

    return Scaffold(
      body: AiBarcodeScanner(
        onDispose: () {
          controller.dispose();
        },
        controller: controller,
        onDetect: (BarcodeCapture capture) {
          if (capture.barcodes.first.rawValue != null) {
            onDetect(capture.barcodes.first.rawValue!);
          }
        },
        validator: (value) {
          if (value.barcodes.isEmpty) {
            return false;
          }

          if (value.barcodes.first.format != BarcodeFormat.qrCode) {
            return false;
          }

          if (value.barcodes.first.rawValue != null) {
            Map<String, dynamic> emv = parseEmv(value.barcodes.first.rawValue!);

            if (emv['39'] != null) {
              return true;
            }
          }

          return false;
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

Map<String, dynamic> parseEmv(String data) {
  int index = 0;
  final Map<String, dynamic> obj = {};

  while (index < data.length) {
    final String code = data.substring(index, index + 2);
    final int length = int.parse(data.substring(index + 2, index + 4));
    final String value = data.substring(index + 4, index + 4 + length);
    index += 2 + 2 + length; // code + length + data

    if (code == '62' || code == '38' || code == '26') {
      int valueIndex = 0;
      final Map<String, dynamic> valueObj = {};

      while (valueIndex < value.length) {
        final String valueCode = value.substring(valueIndex, valueIndex + 2);
        final int valueLength = int.parse(value.substring(valueIndex + 2, valueIndex + 4));
        final String valueData = value.substring(valueIndex + 4, valueIndex + 4 + valueLength);
        valueIndex += 2 + 2 + valueLength; // code + length + data

        if (valueCode == '01') {
          int valueIndex2 = 0;
          final Map<String, dynamic> valueObj2 = {};

          while (valueIndex2 < valueData.length) {
            final String valueCode2 = valueData.substring(valueIndex2, valueIndex2 + 2);
            final int valueLength2 = int.parse(valueData.substring(valueIndex2 + 2, valueIndex2 + 4));
            final String valueData2 = valueData.substring(valueIndex2 + 4, valueIndex2 + 4 + valueLength2);
            valueIndex2 += 2 + 2 + valueLength2; // code + length + data

            valueObj2[valueCode2] = valueData2;
          }

          valueObj[valueCode] = valueObj2;
          continue;
        }

        valueObj[valueCode] = valueData;
      }

      obj[code] = valueObj;
      continue;
    }

    obj[code] = value;
  }

  return obj;
}