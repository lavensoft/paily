import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paily/modules/wallet/models/wallet_total_balance.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wallet.provider.g.dart';

@riverpod
Future<WalletTotalBalance> walletTotalBalance(Ref ref) async {
  //Delay random
  await Future.delayed(Duration(seconds: 1));
  return Future.value(WalletTotalBalance(
    localBalance: 25410000,
    foreignBalance: 1000,
    localCurrencySymbol: 'VND',
    foreignCurrencySymbol: '\$',
  ));
}