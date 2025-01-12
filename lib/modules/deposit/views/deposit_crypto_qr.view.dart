import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:paily/shared/assets/image.asset.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';
import 'package:paily/shared/themes/app_radius.theme.dart';
import 'package:paily/shared/widgets/view_appbar.widget.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class DepositCryptoQRView extends HookConsumerWidget {
  const DepositCryptoQRView({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Deposit by another wallet',
                    style: theme.textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 18),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerLowest,
                      borderRadius: AppRadiusTheme.childRadius,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Text(
                        '0x32f71c...06300e',
                        style: theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          HugeIcons.strokeRoundedCopy01,
                          size: 18,
                        ),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: '0x32f71cc1851ed6c0d6c112c60384d2db2b06300e'));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Address copied to clipboard')),
                          );
                        },
                      ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18),

                  Text(
                    '📝 Copy your wallet address'
                  ),
                  SizedBox(height: 6),
                  Text(
                    '✅ Paste address copied to sender wallet'
                  ),
                  SizedBox(height: 6),
                  Text(
                    '💶 Send USDC or USDT'
                  ),
                  SizedBox(height: 6),
                  Text(
                    '💰 Wait for the money to be transferred'
                  ),

                  SizedBox(height: 21),
                  Divider(),
                  SizedBox(height: 21),
                  Text(
                    'Share QR Code to receive money',
                    style: theme.textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 18),
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerLowest,
                        borderRadius: AppRadiusTheme.containerRadius,
                      ),
                      child: QrImageView(
                        data: '0x32f71cc1851ed6c0d6c112c60384d2db2b06300e',
                        version: QrVersions.auto,
                        size: 270,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: ConstrainedBox( 
                      constraints: BoxConstraints(maxWidth: 300),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 18,
                        runSpacing: 18,
                        children: [
                          ImageAssets.ethChainLogo,
                          ImageAssets.bscChainLogo,
                          ImageAssets.arbChainLogo,
                        ].map((asset) {
                          return Image.asset(
                            height: 21,
                            asset,
                          );
                        }).toList()
                      ),
                    ),
                  ),
                ],
              )
            ),
          )
        ),
      ),
    );
  }
}