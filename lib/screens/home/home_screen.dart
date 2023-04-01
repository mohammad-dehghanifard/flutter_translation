import 'package:flutter/material.dart';
import 'package:flutter_translation_demo/core/style/text_style.dart';
import 'package:flutter_translation_demo/core/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter_translation_demo/screens/translation/translation_screen.dart';
import 'package:flutter_translation_demo/screens/words_scanner/wods_scanner_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: CustomAppBar.mainAppBar(
           backGroundColor: Colors.blueAccent,
          elevation: 0,
          title: "مترجم آنلاین",
          textStyle: AppTextStyle.appBarTitle,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu)),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert)),
          ],
          tabBar:  TabBar(
            labelStyle: AppTextStyle.tabBarTitle,
            tabs: const [
              Tab(text: "مترجم آنلاین",icon: Icon(Icons.title)),
              Tab(text: "تشخیص کلمات",icon: Icon(Icons.remove_red_eye_outlined)),
            ],
          )
      ),
          body: const TabBarView(
            children: [
              TranslationScreen(),
              WordsScannerScreen(),
            ],
          ),

    ),
      ),
    );
  }
}
