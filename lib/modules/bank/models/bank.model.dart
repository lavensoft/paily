import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank.model.freezed.dart';
part 'bank.model.g.dart';

@freezed
class Bank with _$Bank {
  factory Bank({
    required String code,
    required String name,
    required String shortName,
    required String iconImageUrl,
  }) = _Bank;

  factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);
}