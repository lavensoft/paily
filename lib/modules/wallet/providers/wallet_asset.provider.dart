import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paily/modules/wallet/enums/wallet_asset.enum.dart';
import 'package:paily/modules/wallet/models/wallet_asset.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wallet_asset.provider.g.dart';

final mockup = [
  WalletAsset(
    id: '0',
    asset: EWalletAsset.cash, 
    amount: 0, 
    symbol: 'VND', 
    name: 'VND', 
    iconImageUrl: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Flogos%2Fmastercard_logo.png?alt=media&token=71a0ff31-9e78-4684-b4f5-3163196a187a'
  ),
  WalletAsset(
    id: '1',
    asset: EWalletAsset.usdc, 
    amount: 0, 
    symbol: 'USDC', 
    name: 'USDC', 
    iconImageUrl: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Flogos%2Fmastercard_logo.png?alt=media&token=71a0ff31-9e78-4684-b4f5-3163196a187a'
  ),
  WalletAsset(
    id: '2',
    asset: EWalletAsset.usdt, 
    amount: 0, 
    symbol: 'USDT', 
    name: 'USDT', 
    iconImageUrl: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Flogos%2Fmastercard_logo.png?alt=media&token=71a0ff31-9e78-4684-b4f5-3163196a187a'
  )
];

@riverpod
Future<List<WalletAsset>> listWalletAsset(Ref ref) async {
  await Future.delayed(Duration(seconds: 1));
  return mockup;
}