import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paily/shared/themes/app_typography.theme.dart';

class ImageCard extends StatelessWidget {

  const ImageCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.width,
    this.height,
  });
  
  final String imageUrl;
  final String title;
  final String description;
  final double width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(21),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              width: width,
              height: height ?? double.infinity,
              fit: BoxFit.cover,
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
                    title,
                    style: AppTypography.headline.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: AppTypography.bodyText.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}