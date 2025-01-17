import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paily/modules/store/enums/store_type.enum.dart';
import 'package:paily/modules/store/models/store_product.model.dart';

part 'store.model.freezed.dart';
part 'store.model.g.dart';

@freezed
class Store with _$Store {
  factory Store({
    required String id,
    required String name,
    required String description,
    required List<String> imageUrls,
    String? miniAppUrl,
    String? website,
    required String address,
    required double lat,
    required double lng,
    double? priceFromLocalCur,
    List<StoreProduct>? services,
    required EStoreType type,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}