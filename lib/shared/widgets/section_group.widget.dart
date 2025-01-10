import 'package:flutter/material.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';
import 'package:paily/shared/themes/app_typography.theme.dart';

class SectionGroup extends StatelessWidget {
  const SectionGroup({
    super.key,
    required this.title,
    this.child,
    this.itemBuilder,
    this.itemCount = 0,
  });

  final String title;
  final Widget? child;
  final int itemCount;
  final Widget Function(BuildContext, int)? itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppTypography.title3,
        ),
        SizedBox(height: 15.0), // Add some spacing
        child ?? 
        Flexible(
          child: OverflowBox(
            maxWidth: MediaQuery.of(context).size.width,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: AppPaddingTheme.viewPadding.copyWith(
                top: 0,
                bottom: 0,
              ),
              itemCount: itemCount,
              itemBuilder: itemBuilder!,
              separatorBuilder: (context, index) => SizedBox(width: 12),
            ),
          )
        ),
      ],
    );
  }
}