import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paily/modules/bank/models/bank_beneficiary.model.dart';
import 'package:paily/modules/wallet/models/wallet_asset.model.dart';

part 'wallet_transaction.model.freezed.dart';
part 'wallet_transaction.model.g.dart';

@freezed
class WalletTransaction with _$WalletTransaction {
  factory WalletTransaction({
    BankBeneficiary? toBank,
    WalletAsset? asset,
    double? amount,
    double? amountLocalCur,
    double? fee,
    double? feeLocalCur,
    double? total,
    double? totalLocalCur,
    String? note,
  }) = _WalletTransaction;

  factory WalletTransaction.fromJson(Map<String, dynamic> json) => _$WalletTransactionFromJson(json);
}