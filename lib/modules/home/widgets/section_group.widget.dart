import 'package:flutter/material.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';
import 'package:paily/shared/themes/app_typography.theme.dart';

class SectionGroup extends StatelessWidget {
  final String title;
  final Widget? child;
  final Widget Function(BuildContext, int)? itemBuilder;

  const SectionGroup({super.key, required this.title, this.child, this.itemBuilder});

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
          child ?? 
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: AppPaddingTheme.viewPadding.copyWith(
                  top: 0,
                  bottom: 0,
                ),
                itemCount: 9,
                itemBuilder: itemBuilder!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}