import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paily/modules/bank/models/bank.model.dart';

part 'bank_beneficiary.model.freezed.dart';
part 'bank_beneficiary.model.g.dart';

@freezed
class BankBeneficiary with _$BankBeneficiary {
  factory BankBeneficiary({
    Bank? bank,
    String? accountName,
    String? accountNumber,
  }) = _BankBeneficiary;

  factory BankBeneficiary.fromJson(Map<String, dynamic> json) => _$BankBeneficiaryFromJson(json);
}