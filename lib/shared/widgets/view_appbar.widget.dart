import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';

class ViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ViewAppBar({super.key, this.actions, this.title});

  final List<Widget>? actions;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: AppPaddingTheme.viewPadding.copyWith(
        top: 0,
        bottom: 0,
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            HugeIcons.strokeRoundedArrowLeft01
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          title ?? '',
          style: theme.textTheme.titleSmall,
        ),
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}