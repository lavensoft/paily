import 'package:flutter/material.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';

class SectionGroup extends StatelessWidget {
  const SectionGroup({
    super.key,
    this.title,
    this.child,
    this.itemBuilder,
    this.itemCount = 0,
  });

  final String? title;
  final Widget? child;
  final int itemCount;
  final Widget Function(BuildContext, int)? itemBuilder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: title != null,
          child: Container(
            margin: EdgeInsets.only(bottom: 15.0),
            child: Text(
              title ?? '',
              style: theme.textTheme.titleSmall,
            ),
          )
        ),
        child ?? 
        Flexible(
          child: Container(
            transform: Matrix4.translationValues(-15, 0, 0.0),
            child: OverflowBox(
              alignment: Alignment.topLeft,
              maxWidth: MediaQuery.of(context).size.width,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: itemCount,
                itemBuilder: itemBuilder!,
                separatorBuilder: (context, index) => SizedBox(width: 12),
                padding: AppPaddingTheme.contentPadding.copyWith(
                  top: 0,
                  bottom: 0,
                ),
              )
            ),
          )
        ),
      ],
    );
  }
}