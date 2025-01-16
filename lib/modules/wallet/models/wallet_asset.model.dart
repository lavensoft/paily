import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paily/modules/wallet/enums/wallet_asset.enum.dart';

part 'wallet_asset.model.freezed.dart';
part 'wallet_asset.model.g.dart';

@freezed
class WalletAsset with _$WalletAsset {
  factory WalletAsset({
    required String id,
    required EWalletAsset asset,
    required double amount,
    required String symbol,
    required String name,
    required String iconImageUrl,
    required String walletId,
    required bool isPrimary,
  }) = _WalletAsset;

  factory WalletAsset.fromJson(Map<String, dynamic> json) => _$WalletAssetFromJson(json);
}