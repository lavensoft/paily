import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';

class QrScanAppBar extends StatelessWidget implements PreferredSizeWidget {
  const QrScanAppBar({super.key, required this.controller});

  final MobileScannerController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddingTheme.contentPadding.copyWith(
        top: 0,
        bottom: 0,
      ),
      child: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            HugeIcons.strokeRoundedArrowLeft01
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              HugeIcons.strokeRoundedCameraRotated01
            ),
            onPressed: () async {
              await controller.switchCamera();
            },
          ),
          IconButton(
            icon: Icon(
              HugeIcons.strokeRoundedFlash
            ),
            onPressed: () async {
              await controller.toggleTorch();
            },
          ),
          IconButton(
            icon: Icon(
              HugeIcons.strokeRoundedImage01
            ),
            onPressed: () {
              final ImagePicker picker = ImagePicker();
              picker.pickImage(source: ImageSource.gallery).then((image) {
                if (image != null) {
                  controller.analyzeImage(image.path);
                }
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}