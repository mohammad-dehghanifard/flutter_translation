import 'package:flutter/material.dart';
import 'package:flutter_translation_demo/screens/splash/splash_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Translation",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
