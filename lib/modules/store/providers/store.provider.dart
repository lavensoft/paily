import 'package:paily/modules/store/models/store.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'store.provider.g.dart';

final mockup = [
  Store(
    id: '1',
    name: 'Store 1',
    description: 'Store 1 description',
    imageUrls: ['https://vietnamhoneymoontravel.com/wp-content/uploads/2021/09/Introduction-to-Danang-The-Most-Livable-City-in-Vietnam.jpg'],
    miniAppUrl: 'https://lavenes.com',
    website: 'https://lavenes.com',
    lat: 0.0,
    lng: 0.0,
  ),
  Store(
    id: '2',
    name: 'Store 2',
    description: 'Store 2 description',
    imageUrls: ['https://vietnamhoneymoontravel.com/wp-content/uploads/2021/09/Introduction-to-Danang-The-Most-Livable-City-in-Vietnam.jpg'],
    miniAppUrl: 'https://lavenes.com',
    website: 'https://lavenes.com',
    lat: 0.0,
    lng: 0.0,
  ),
];

@riverpod
class StoreService extends _$StoreService {
  @override
  Future<List<Store>> build() async {
    await Future.delayed(Duration(seconds: 3));
    return mockup;
  }
}