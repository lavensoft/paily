import 'package:flutter/material.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';
import 'package:paily/shared/widgets/section_group.widget.dart';

class SliverSection extends SectionGroup {
  const SliverSection({
    super.key,
    this.padding = EdgeInsets.zero,
    super.title,
    super.child,
  });
  
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: AppPaddingTheme.contentSectionPadding,
      sliver: SliverToBoxAdapter(
        child: child
      ),
    );
  }
}