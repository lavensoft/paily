import 'package:paily/modules/bank/models/bank_beneficiary.model.dart';
import 'package:paily/modules/wallet/models/wallet_asset.model.dart';
import 'package:paily/modules/wallet/models/wallet_transaction.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment.provider.g.dart';

/// Lưu trữ dữ liệu tạo Giao dịch chuyển khoản
@riverpod
class PaymentNotifier extends _$PaymentNotifier {
  @override
  WalletTransaction build() => WalletTransaction();

  @override
  set state(WalletTransaction newState) => super.state = newState;

  Future<void> updateAmount(double amount) async {
    state = state.copyWith(amount: amount);
  }

  Future<void> updateNote(String note) async {
    state = state.copyWith(note: note);
  }

  Future<void> updateToBank(BankBeneficiary beneficiary) async {
    state = state.copyWith(toBank: beneficiary);
  }

  Future<void> updateAmountLocalCur(double amountLocalCur) async {
    state = state.copyWith(amountLocalCur: amountLocalCur);
  }

  Future<void> updateFee(double fee) async {
    state = state.copyWith(fee: fee);
  }

  Future<void> updateFeeLocalCur(double feeLocalCur) async {
    state = state.copyWith(feeLocalCur: feeLocalCur);
  }

  Future<void> updateTotal(double total) async {
    state = state.copyWith(total: total);
  }

  Future<void> updateTotalLocalCur(double totalLocalCur) async {
    state = state.copyWith(totalLocalCur: totalLocalCur);
  }

  Future<void> updateAsset(WalletAsset asset) async {
    state = state.copyWith(asset: asset);
  }
}