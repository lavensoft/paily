import 'package:flutter/material.dart';
import 'package:paily/shared/themes/app_typography.theme.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(8.0),
            backgroundColor: Color.fromRGBO(255, 255, 255, .2),
            fixedSize: Size(48, 48),
          ),
          onPressed: onPressed,
          child: Icon(
            icon,
            color: Colors.white,
            size: 21,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          label,
          style: AppTypography.subheadline1.copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}