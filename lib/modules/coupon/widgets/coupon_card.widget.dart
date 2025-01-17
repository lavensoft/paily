import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paily/modules/coupon/models/coupon.model.dart';

class CouponCard extends StatelessWidget {
  const CouponCard({
    super.key,
    required this.coupon, 
    this.onTap,
  });

  final Coupon coupon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 24),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              coupon.shopName ?? '',
              style: theme.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 12),
            Row(
              spacing: 6,
              children: [
                CachedNetworkImage(
                  imageUrl: coupon.iconImageUrl ?? '',
                  width: 48,
                  height: 48,
                ),
                SizedBox(width: 12),
                Text(
                  coupon.description ?? '',
                ),
              ],
            ),
            SizedBox(height: 6),
            Divider(),
            SizedBox(height: 6),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Visibility(
                visible: coupon.expiredAt != null,
                child: Text(
                  'Expires on: ${
                    DateFormat('dd/MM/yyyy').format(coupon.expiredAt!)
                  }',
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}