import 'package:blur/blur.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:local_auth/local_auth.dart';
import 'package:paily/core/utils/notification.util.dart';
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

  await NotificationUtil().init();

  runApp(ProviderScope(child: const App()));
}

class App extends HookWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    //!HARDCODE For MVP
    final isAuthenticated = useState(false);
    final auth = useMemoized(() => LocalAuthentication());

    useEffect(() {
      authenticate() async {
        try {
          final bool didAuthenticate = await auth.authenticate(
            localizedReason: 'Please authenticate to confirm payment',
          );

          if (didAuthenticate) {
            if (context.mounted) {
              isAuthenticated.value = true;
            }
          }
        } on PlatformException {
          if (context.mounted) {
            ScaffoldMessenger
              .of(context)
              .showSnackBar(
                SnackBar(
                  content: Text(
                    'Failed to authenticate. Please try again.',
                  ),
                ),
              );
          }
        }
      }

      authenticate();
      return null;
    }, []);

    return MaterialApp(
      title: 'Paily App',
      theme: AppTheme.light,
      home: AnimatedSwitcher(
        duration: const Duration(milliseconds: 900),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: isAuthenticated.value
        ? const HomeView()
        : Blur(
            blur: 6,
            colorOpacity: 0.1,
            child: const HomeView(),
          ),
      ),
    );
  }
}