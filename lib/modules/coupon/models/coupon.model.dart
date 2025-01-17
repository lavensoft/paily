import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon.model.freezed.dart';
part 'coupon.model.g.dart';

@freezed
class Coupon with _$Coupon {
  factory Coupon({
    String? id,
    String? shopName,
    String? description,
    String? iconImageUrl,
    DateTime? expiredAt,
    double? discountRate,
    String? ownerId,
  }) = _Coupon;

  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);
}