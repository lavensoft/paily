import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:paily/modules/bank/models/bank_beneficiary.model.dart';
import 'package:paily/modules/coupon/models/coupon.model.dart';
import 'package:paily/modules/wallet/models/wallet_asset.model.dart';
import 'package:paily/modules/wallet/models/wallet_transaction.model.dart';
import 'package:paily/modules/wallet/providers/wallet_asset.provider.dart';
import 'package:paily/shared/helpers/formatter.helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment.provider.g.dart';

/// Lưu trữ dữ liệu tạo Giao dịch chuyển khoản
@riverpod
class PaymentNotifier extends _$PaymentNotifier {
  @override
  WalletTransaction build() => WalletTransaction();

  @override
  set state(WalletTransaction newState) => super.state = newState;

  updateAmount(double amount) {
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

  updateNote(String note) {
    state = state.copyWith(note: note);
  }

  updateToBank(BankBeneficiary beneficiary) {
    state = state.copyWith(toBank: beneficiary);
  }

  updateAsset(WalletAsset asset) {
    state = state.copyWith(asset: asset);
  }

  applyCoupon(Coupon coupon) {
    state = state.copyWith(coupons: (state.coupons ?? [])..add(coupon));

    double totalDiscountRate = state.coupons!.fold(0, (previousValue, element) => previousValue + element.discountRate!);
    double discount = state.amount! * totalDiscountRate;
    double total = state.amount! + state.fee!;

    state = state.copyWith(
      discount: discount,
      discountLocalCur: discount / 25400, //!HARDCODE
      total: total - discount,
      totalLocalCur: (total - discount) / 25400, //!HARDCODE
      totalBeforeDiscount: total,
      totalBeforeDiscountLocalCur: total / 25400, //!HARDCODE
    );
  }

  confirmPayment() async {
    final asset = await ref.watch(walletAssetNotifierProvider.notifier).decreaseBalance(state.asset!.id, state.totalLocalCur!);
    final remainingBalance = asset.amount;

    //Send local notification
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.show( 
      0, 
      'Transfer successfully!', 
      'You have successfully sent \$${
        FormatHelper.formatNumber(state.totalLocalCur)
      }, the remaining balance: \$${
        FormatHelper.formatNumber(remainingBalance)
      }', null
    );
  }
}