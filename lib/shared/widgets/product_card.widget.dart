import 'package:flutter/material.dart';
import 'package:paily/shared/themes/app_radius.theme.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double width;
  final double height;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    this.width = double.infinity,
    this.height = 300, // Default height
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: AppRadiusTheme.containerRadius,
        color: Colors.white,
      ),
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
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
                    title,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    description,
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