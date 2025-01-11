import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:paily/shared/themes/app_radius.theme.dart';
import 'package:paily/shared/widgets/rounded_button.widget.dart';

class ActionBanner extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onClose;
  final VoidCallback onTryItOut;
  final String backgroundImage;

  const ActionBanner({
    super.key,
    required this.title,
    required this.description,
    required this.onClose,
    required this.onTryItOut,
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(21.0),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(backgroundImage),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.darken,
              ),
            ),
            borderRadius: AppRadiusTheme.containerRadius,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 2.0),
              Text(
                description,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 12.0),
              RoundedButton(
                text: 'Try it out', 
                onPressed: onTryItOut,
              ),
            ],
          ),
        ),
        Positioned(
          top: 9.0,
          right: 9.0,
          child: IconButton(
            icon: Icon(
              HugeIcons.strokeRoundedCancel01, 
              color: Colors.white,
              size: 18,
            ),
            onPressed: onClose,
          ),
        ),
      ],
    );
  }
}