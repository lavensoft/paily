import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paily/modules/wallet/models/wallet_total_balance.model.dart';
import 'package:paily/modules/wallet/providers/wallet_asset.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wallet.provider.g.dart';

@riverpod
Future<WalletTotalBalance> walletTotalBalance(Ref ref) async {
  final walletAsset = await ref.watch(walletAssetNotifierProvider.future);
  final primaryAsset = walletAsset.firstWhere((element) => element.isPrimary);

  //Delay random
  await Future.delayed(Duration(seconds: 1));
  return Future.value(WalletTotalBalance(
    localBalance: primaryAsset.amount,
    foreignBalance: primaryAsset.amount * 25400, //!HARDCODE
    localCurrencySymbol: '\$',
    foreignCurrencySymbol: 'VND',
  ));
}