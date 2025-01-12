import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.model.freezed.dart';
part 'store.model.g.dart';

@freezed
class Store with _$Store {
  factory Store({
    required String id,
    required String name,
    required String description,
    required List<String> imageUrls,
    required String miniAppUrl,
    required String website,
    required double lat,
    required double lng,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}