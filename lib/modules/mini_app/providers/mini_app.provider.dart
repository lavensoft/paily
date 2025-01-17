import 'package:paily/modules/mini_app/models/mini_app.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mini_app.provider.g.dart';

final mockup = [
  MiniApp(
    id: '0', 
    name: 'Taxi', 
    iconImageUrl: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Fmini-apps%2Ftaxi_icon.png?alt=media&token=052d866f-e11c-48c7-8204-3ba96999e417', 
    url: 'https://lavenes.com'
  ),
  MiniApp(
    id: '0', 
    name: 'Hotel', 
    iconImageUrl: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Fmini-apps%2Fhotel_icon.png?alt=media&token=ced5147b-32de-4db4-8193-ee86cf438997', 
    url: 'https://lavenes.com'
  ),
  MiniApp(
    id: '0', 
    name: 'Food', 
    iconImageUrl: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Fmini-apps%2Ffood_icon.png?alt=media&token=edb11acb-2bd3-4ca1-8fa7-cb3c3adda82a', 
    url: 'https://lavenes.com'
  ),
  MiniApp(
    id: '0', 
    name: 'More', 
    iconImageUrl: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Fmini-apps%2Fanother_icon.png?alt=media&token=df63ce94-91ef-4c6c-9562-16959442047c'
  )
];

@riverpod
class MiniAppService extends _$MiniAppService {
  @override
  Future<List<MiniApp>> build() async {
    await Future.delayed(Duration(seconds: 3));
    return mockup;
  }
}