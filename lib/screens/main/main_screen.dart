import 'package:flutter/material.dart';
import 'package:flutter_translation_demo/screens/splash/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale("fa"),
      title: "Translation",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
