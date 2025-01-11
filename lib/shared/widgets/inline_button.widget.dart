import 'package:flutter/material.dart';

class InlineButton extends StatelessWidget {
  const InlineButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.icon,
  });

  final Widget label;
  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 9, horizontal: 21),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 6,
        children: [
          icon,
          label,
        ],
      ),
    );
  }
}