import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ViewAppBar({
    super.key,
    this.leading,
    this.actions,
    this.title,
    this.hideBackButton = false
  });

  final Widget? leading;
  final List<Widget>? actions;
  final String? title;
  final bool hideBackButton;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Visibility(
        visible: !hideBackButton && leading == null,
        replacement: leading ?? Container(),
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            HugeIcons.strokeRoundedArrowLeft01
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ),
      title: Text(
        title ?? '',
        style: theme.textTheme.titleSmall,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}