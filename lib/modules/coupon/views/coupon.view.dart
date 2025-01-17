import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:paily/modules/coupon/models/coupon.model.dart';
import 'package:paily/modules/coupon/providers/coupon.provider.dart';
import 'package:paily/modules/coupon/widgets/coupon_card.widget.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';
import 'package:paily/shared/widgets/view_appbar.widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CouponView extends HookConsumerWidget {
  const CouponView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listMeCoupon = ref.watch(listMeCouponProvider);

    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: ViewAppBar(
            title: 'Coupons',
          ),
          body: Padding(
            padding: AppPaddingTheme.contentPadding,
            child: switch(listMeCoupon) {
              AsyncError(:final error) => Text(error.toString()),
              AsyncData(:final value) => ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return CouponCard(
                    coupon: value[index],
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Create a payment to use this coupon'),
                        ),
                      );
                    },
                  );
                },
              ),
              _ => Skeletonizer(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return CouponCard(
                      coupon: Coupon(
                        id: BoneMock.name,
                        shopName: BoneMock.name,
                        description: BoneMock.longParagraph,
                        expiredAt: DateTime.now(),
                        discountRate: 1,
                      ),
                      onTap: () {},
                    );
                  },
                )
              )
            },
          )
        ),
      ),
    );
  }
}