import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paily/shared/helpers/formatter.helper.dart';
import 'package:paily/shared/themes/app_radius.theme.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WalletSelectCard extends StatelessWidget {
  const WalletSelectCard({
    super.key, 
    this.isSelected = false,
    this.onSelected,
    this.image,
    this.title,
    this.balance,
    this.loading = false
  });

  final bool isSelected;
  final Function()? onSelected;
  final String? image;
  final String? title;
  final double? balance;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Skeletonizer(
      enabled: loading,
      child: GestureDetector(
        onTap: () {
          onSelected?.call();
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 9,
          ),
          decoration: BoxDecoration(
            color: isSelected ? theme.colorScheme.primaryContainer : Colors.white,
            border: Border.all(
              color: isSelected ? theme.primaryColor : theme.colorScheme.outline,
              width: isSelected ? 2 : 1,
              strokeAlign: BorderSide.strokeAlignOutside
            ),
            borderRadius: AppRadiusTheme.childRadius,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,  
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: Visibility(
                  visible: !loading && image != null,
                  replacement: Icon(
                    Icons.circle,
                    size: 30,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: image ?? '',
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loading ? 'title' : title ?? '',
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600
                    )
                  ),
                  Text(
                    loading ? 'balance' : FormatHelper.formatNumber(balance ?? 0),
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: theme.colorScheme.onSurfaceVariant
                    )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}