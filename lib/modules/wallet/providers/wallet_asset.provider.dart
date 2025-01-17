import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paily/modules/wallet/enums/wallet_asset.enum.dart';
import 'package:paily/modules/wallet/models/wallet_asset.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wallet_asset.provider.g.dart';

final firestore = FirebaseFirestore.instance;
final walletAssets = firestore.collection('wallet_assets');

@riverpod
class WalletAssetNotifier extends _$WalletAssetNotifier {
  @override
  Future<List<WalletAsset>> build() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    var querySnapshot = await walletAssets.where('walletId', isEqualTo: userId).get();
    var data = querySnapshot.docs.map((doc) => WalletAsset.fromJson(doc.data())).toList();

    if (data.isEmpty) {
      List<Future<void>> futures = [];

      for (var asset in EWalletAsset.values) {
        var newAsset = WalletAsset(
          id: walletAssets.doc().id,
          asset: asset,
          amount: 6000,
          symbol: walletAssetSymbol[asset]!,
          name: walletAssetSymbol[asset]!.toUpperCase(),
          iconImageUrl: walletAssetIcon[asset]!, // Add appropriate URL or leave empty
          walletId: userId,
          isPrimary: true
        );

        futures.add(firestore.collection('wallet_assets').add(newAsset.toJson()));
        data.add(newAsset);
      }

      await Future.wait(futures);
    }

    return data;
  }

  Future<void> decreaseBalance(String walletAssetId, double amount) async {
    final prevState = await future;
    var walletAsset = prevState.firstWhere((element) => element.id == walletAssetId);
    walletAsset = walletAsset.copyWith(amount: walletAsset.amount - amount);

    await walletAssets.doc(walletAssetId).update(walletAsset.toJson());

    ref.invalidateSelf();
  }
}