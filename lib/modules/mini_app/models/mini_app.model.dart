import 'package:freezed_annotation/freezed_annotation.dart';

part 'mini_app.model.freezed.dart';
part 'mini_app.model.g.dart';

@freezed
class MiniApp with _$MiniApp {
  factory MiniApp({
    required String id,
    required String name,
    required String iconImageUrl,
    required String url,
  }) = _MiniApp;

  factory MiniApp.fromJson(Map<String, dynamic> json) => _$MiniAppFromJson(json);
}