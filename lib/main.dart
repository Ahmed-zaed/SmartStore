import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:untitled2/Screens/Auth/login_Screen.dart';
import 'package:untitled2/Screens/StartScreen/open_screen.dart';
import 'package:untitled2/Screens/StartScreen/splashe_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        //AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: const [Locale('en'), Locale('ar')],
      locale: const Locale('en'),
      initialRoute: '/Splash_Screen',
      routes: {
        '/Splash_Screen': (context) => const SplashScreen(),
        '/Open_Screen': (context) => const OpenScreen(),
        '/Signup_Screen': (context) => const SignupScreen(),
      },
    );
  }
}
