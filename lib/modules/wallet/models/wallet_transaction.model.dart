import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paily/modules/wallet/enums/wallet_asset.enum.dart';

part 'wallet_transaction.model.freezed.dart';
part 'wallet_transaction.model.g.dart';

@freezed
class WalletBankTransaction with _$WalletBankTransaction {
  factory WalletBankTransaction({
    required String name,
    required String bankName,
    required String accountNumber,
  }) = _WalletBankTransaction;

  factory WalletBankTransaction.fromJson(Map<String, dynamic> json) => _$WalletBankTransactionFromJson(json);
}

@freezed
class WalletTransaction with _$WalletTransaction {
  factory WalletTransaction({
    required String id,
    required EWalletAsset asset,
    required double amount,
    required double localAmount,
    required WalletBankTransaction toBank,
    required double fee,
    required double feeLocal,
    required double total,
    required double totalLocal,
  }) = _WalletTransaction;

  factory WalletTransaction.fromJson(Map<String, dynamic> json) => _$WalletTransactionFromJson(json);
}