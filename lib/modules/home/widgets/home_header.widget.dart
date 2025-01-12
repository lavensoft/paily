import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';

class HomeHeader extends StatelessWidget implements PreferredSizeWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: AppPaddingTheme.contentPadding.copyWith(
          top: 0,
          bottom: 0,
        ),
        child: _LocationSelect(),
      ),
      leadingWidth: 200,
      actions: [
        Padding(
          padding: AppPaddingTheme.contentPadding.copyWith(
            top: 0,
            bottom: 0,
          ),
          child: IconButton(
            icon: const Icon(
              HugeIcons.strokeRoundedNotification01,
              color: Colors.black,
              weight: 3,
              size: 21,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _LocationSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        spacing: 6,
        children: [
          CachedNetworkImage(
            imageUrl: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Fflags%2Fvietnamese.png?alt=media&token=5c320a53-1750-454e-8441-3e6d9b07744c',
            width: 30,
            height: 30,  
          ),
          const Text(
            'Da Nang',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Icon(
            HugeIcons.strokeRoundedArrowDown01,
            color: Color.fromRGBO(174, 174, 174, 1),
            weight: 3,
            size: 21,
          ),
        ],
      )
    );
  }

}