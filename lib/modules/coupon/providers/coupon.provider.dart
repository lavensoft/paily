import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paily/modules/coupon/models/coupon.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coupon.provider.g.dart';

final firestore = FirebaseFirestore.instance;
final coupons = firestore.collection('coupons');

@riverpod
Future<List<Coupon>> listMeCoupon(Ref ref) async {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  var querySnapshot = await coupons.where('ownerId', isEqualTo: userId).get();
  var data = querySnapshot.docs.map((doc) => Coupon.fromJson(doc.data())).toList();

  if (data.isEmpty) {
    List<Future<void>> futures = [];

    final coupon1 = Coupon(
      id: coupons.doc().id,
      shopName: 'Paily',
      description: 'Discount 10% for all products',
      iconImageUrl: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Ficons%2Fcoupon_icon.png?alt=media&token=2db6d793-dc9b-4635-aa21-b35eda9319b6',
      expiredAt: DateTime.now().add(Duration(days: 30)),
      discountRate: 0.1,
      ownerId: userId
    );

    final coupon2 = Coupon(
      id: coupons.doc().id,
      shopName: 'Lavenes',
      description: 'Discount 20% for all products',
      iconImageUrl: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Ficons%2Fcoupon_icon.png?alt=media&token=2db6d793-dc9b-4635-aa21-b35eda9319b6',
      expiredAt: DateTime.now().add(Duration(days: 30)),
      discountRate: 0.2,
      ownerId: userId
    );

    futures.add(
      firestore
        .collection('coupons')
        .add(coupon1.toJson())
    );
    futures.add(
      firestore
        .collection('coupons')
        .add(coupon2.toJson())
    );

    data.add(coupon1);
    data.add(coupon2);

    await Future.wait(futures);
  }

  return data;
}