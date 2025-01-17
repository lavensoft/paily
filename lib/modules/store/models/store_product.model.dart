import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_product.model.freezed.dart';
part 'store_product.model.g.dart';

@freezed
class StoreProduct with _$StoreProduct {
  factory StoreProduct({
    required String id,
    required String name,
    required double priceLocalCur,
    required String imageUrl,
  }) = _StoreService;

  factory StoreProduct.fromJson(Map<String, dynamic> json) => _$StoreProductFromJson(json);
}