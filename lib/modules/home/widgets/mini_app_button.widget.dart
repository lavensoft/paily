import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MiniAppButton extends StatelessWidget {
  const MiniAppButton({
    super.key,
    this.imageUrl,
    this.label,
    this.onTap,
    this.loading = false,
  });

  final String? imageUrl;
  final String? label;
  final VoidCallback? onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: loading,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: SizedBox(
                width: 63,
                height: 63,
                child: Visibility(
                  visible: !loading && imageUrl != null,
                  replacement: Container(
                    color: Colors.grey[300],
                  ),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl ?? '',
                    placeholder: (context, url) => Container(
                      color: Colors.grey[300],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              loading ? 'Mini App' : label ?? '',
            ),
          ],
        ),
      ),
    );
  }
}
