import 'package:flutter/material.dart';
import 'package:flutter_translation_demo/core/style/text_style.dart';
import 'package:flutter_translation_demo/screens/home/home_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  HomeScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.jpg",height: 128),
            SizedBox(height: size.height * 0.03),
            Text('مترجم آنلاین صوتی',style: AppTextStyle.subTitle),
            SizedBox(height: size.height * 0.06),
            LoadingAnimationWidget.discreteCircle(color: Colors.blueAccent, size: 32)
          ],
        ),
      ),
    );
  }
}
