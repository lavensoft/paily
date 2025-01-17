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

  updateAmount(double amount) async {
    double fee = amount * 0.02;

    state = state.copyWith(
      amount: amount,
      amountLocalCur: amount / 25400, //!HARDCODE
      total: amount + fee,
      totalLocalCur: (amount + fee) / 25400, //!HARDCODE
      fee: fee,
      feeLocalCur: fee / 25400, //!HARDCODE
    );
  }

  updateNote(String note) async {
    state = state.copyWith(note: note);
  }

  updateToBank(BankBeneficiary beneficiary) async {
    state = state.copyWith(toBank: beneficiary);
  }

  updateAsset(WalletAsset asset) async {
    state = state.copyWith(asset: asset);
  }
}