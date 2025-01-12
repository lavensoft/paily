import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MiniAppButton extends StatelessWidget {
  final String imageUrl;
  final String label;
  final VoidCallback onTap;

  const MiniAppButton({
    super.key,
    required this.imageUrl,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: 42,
              height: 42,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            label,
          ),
        ],
      ),
    );
  }
}
