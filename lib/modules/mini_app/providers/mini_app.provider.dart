import 'package:paily/modules/mini_app/models/mini_app.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mini_app.provider.g.dart';

final mockup = [
  MiniApp(
    id: '0', 
    name: 'App 1', 
    iconImageUrl: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Fmini-apps%2FCGV%20App%20Icon.png?alt=media&token=e7a676e6-80ad-4e92-a61d-dfb892262879', 
    url: 'https://lavenes.com'
  ),
  MiniApp(
    id: '0', 
    name: 'App 1', 
    iconImageUrl: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Fmini-apps%2FCGV%20App%20Icon.png?alt=media&token=e7a676e6-80ad-4e92-a61d-dfb892262879', 
    url: 'https://lavenes.com'
  ),
  MiniApp(
    id: '0', 
    name: 'App 1', 
    iconImageUrl: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Fmini-apps%2FCGV%20App%20Icon.png?alt=media&token=e7a676e6-80ad-4e92-a61d-dfb892262879', 
    url: 'https://lavenes.com'
  ),
  MiniApp(
    id: '0', 
    name: 'App 1', 
    iconImageUrl: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Fmini-apps%2FCGV%20App%20Icon.png?alt=media&token=e7a676e6-80ad-4e92-a61d-dfb892262879', 
    url: 'https://lavenes.com'
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