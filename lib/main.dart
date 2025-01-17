import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:paily/modules/home/views/home.view.dart';
import 'package:paily/shared/themes/app_theme.theme.dart';
import 'firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.debug,
  );

  //!FIXME: For MVP
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    await FirebaseAuth.instance.signInAnonymously();
  }

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
  const initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  final initializationSettingsDarwin = DarwinInitializationSettings();
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(ProviderScope(child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paily App',
      theme: AppTheme.light,
      home: const HomeView(),
    );
  }
}