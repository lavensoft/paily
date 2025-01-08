import 'package:flutter/material.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';
import 'package:paily/shared/themes/app_typography.theme.dart';

class SectionGroup extends StatelessWidget {
  final String title;
  final Widget child;

  const SectionGroup({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddingTheme.viewPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTypography.title3,
          ),
          SizedBox(height: 15.0), // Add some spacing
          child,
        ],
      ),
    );
  }
}