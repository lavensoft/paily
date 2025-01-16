import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paily/modules/bank/models/bank.model.dart';

part 'bank_transaction.model.freezed.dart';
part 'bank_transaction.model.g.dart';

@freezed
class BankTransaction with _$BankTransaction {
  factory BankTransaction({
    Bank? bank,
    String? accountName,
    String? accountNumber,
  }) = _BankTransaction;

  factory BankTransaction.fromJson(Map<String, dynamic> json) => _$BankTransactionFromJson(json);
}