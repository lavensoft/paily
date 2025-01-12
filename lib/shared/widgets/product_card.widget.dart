import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paily/shared/themes/app_radius.theme.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.imageUrl,
    this.title,
    this.description,
    this.width = double.infinity,
    this.height = 300, // Default height
    this.loading = false,
    this.onTap,
  });

  final String? imageUrl;
  final String? title;
  final String? description;
  final double width;
  final double height;
  final bool loading;
  final void Function()? onTap;

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
            color: Colors.white,
          ),
          child: GestureDetector(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child:
                  Visibility(
                    visible: !loading && (imageUrl != null && imageUrl!.isNotEmpty),
                    replacement: Container(
                      width: double.infinity,
                      height: 180,
                      color: Colors.grey[300],
                    ),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl ?? '',
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        loading ? 'Lorem ip sum title' : title ?? '',
                        style: theme.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        loading ? 'Lorem ip sum description' : description ?? '',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}