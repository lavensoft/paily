import 'package:flutter/material.dart';
import 'package:paily/shared/themes/app_typography.theme.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const Button(
    this.text, 
    {
      super.key,
      required this.onPressed,
    }
  );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTypography.bodyText.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}