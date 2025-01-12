import 'package:paily/modules/store/models/store.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'store.provider.g.dart';

final mockup = [
  Store(
    id: '1',
    name: 'Ba Na Hills',
    description: 'Stroll and stop for selfies',
    imageUrls: ['https://vietnam.travel/sites/default/files/inline-images/shutterstock_1346056832.jpg'],
    miniAppUrl: 'https://lavenes.com',
    website: 'https://lavenes.com',
    lat: 0.0,
    lng: 0.0,
  ),
  Store(
    id: '2',
    name: 'Lady Buddha',
    description: 'Lady Buddha is the best sight in Son Tra Mountain',
    imageUrls: ['https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/14/44/78/the-lady-buddha.jpg?w=1600&h=900&s=1'],
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