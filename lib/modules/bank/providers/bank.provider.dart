import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paily/modules/bank/models/bank.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bank.provider.g.dart';

final firestore = FirebaseFirestore.instance;
final walletAssets = firestore.collection('banks');

@riverpod
Future<List<Bank>> listBank(Ref ref) async {
  var querySnapshot = await walletAssets.get();
  var data = querySnapshot.docs.map((doc) => Bank.fromJson(doc.data())).toList();

  return data;
}