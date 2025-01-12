import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:paily/shared/assets/image.asset.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';
import 'package:paily/shared/themes/app_radius.theme.dart';
import 'package:paily/shared/widgets/view_appbar.widget.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class DepositBankTransferView extends HookConsumerWidget {
  const DepositBankTransferView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: ViewAppBar(
            actions: [
              IconButton(
                icon: Icon(
                  HugeIcons.strokeRoundedShare05
                ),
                onPressed: () {
                  Share.share('QR Code from Paily');
                },
              )
            ],
          ),
          body: Center(
            child: Padding(
              padding: AppPaddingTheme.viewPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Share QR Code to receive money',
                    style: theme.textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Image.asset(
                    ImageAssets.vietQrLogo,
                    width: 120,
                  ),
                  SizedBox(height: 24),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerLowest,
                      borderRadius: AppRadiusTheme.containerRadius,
                    ),
                    child: QrImageView(
                      data: '00020101021138520010A000000727012200069704320108207820480208QRIBFTTA53037045802VN630417A2',
                      version: QrVersions.auto,
                      size: 270,
                    ),
                  ),
                  SizedBox(height: 30),
                  ConstrainedBox( 
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
                  ),
            
                  Spacer(),
                  Text(
                    'Nhat Tran',
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 3,),
                  Text(
                    'VP Bank 20782048',
                    style: theme.textTheme.bodyMedium,
                  )
                ],
              )
            ),
          )
        ),
      ),
    );
  }
}