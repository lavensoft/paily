import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paily/shared/themes/app_radius.theme.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    this.imageUrl,
    this.title,
    this.description,
    required this.width,
    this.height = double.infinity,
    this.onTap,
    this.loading = false,
  });
  
  final String? imageUrl;
  final String? title;
  final String? description;
  final double width;
  final double height;
  final void Function()? onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: width,
      height: height,
      child: Skeletonizer(
        enabled: loading,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: AppRadiusTheme.containerRadius,
          ),
          child: GestureDetector(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: AppRadiusTheme.containerRadius,
              child: Stack(
                children: [
                  Visibility(
                    visible: !loading && (imageUrl != null && imageUrl!.isNotEmpty),
                    replacement: Container(),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl ?? '',
                      width: width,
                      height: height,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.6),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 21,
                    left: 21,
                    right: 21,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          loading ? 'Lorem title' : title ?? '',
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          loading ? 'Lorem description title' : description ?? '',
                          style: theme.textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}