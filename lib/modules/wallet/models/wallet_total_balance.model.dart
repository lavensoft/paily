import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_total_balance.model.freezed.dart';
part 'wallet_total_balance.model.g.dart';

@freezed
class WalletTotalBalance with _$WalletTotalBalance {
  factory WalletTotalBalance({
    required double localBalance,
    required double foreignBalance,
    required String localCurrencySymbol,
    required String foreignCurrencySymbol,
  }) = _WalletTotalBalance;

  factory WalletTotalBalance.fromJson(Map<String, dynamic> json) => _$WalletTotalBalanceFromJson(json);
}