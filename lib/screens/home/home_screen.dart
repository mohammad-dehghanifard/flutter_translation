import 'package:flutter/material.dart';
import 'package:flutter_translation_demo/core/style/text_style.dart';
import 'package:flutter_translation_demo/core/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter_translation_demo/core/widgets/drawer_item/drawer_item_widget.dart';
import 'package:flutter_translation_demo/screens/translation/translation_screen.dart';
import 'package:flutter_translation_demo/screens/words_scanner/wods_scanner_screen.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          key: _globalKey,
          appBar: CustomAppBar.mainAppBar(
           backGroundColor: Colors.blueAccent,
          elevation: 0,
          title: "مترجم آنلاین",
          textStyle: AppTextStyle.appBarTitle,
          leading: IconButton(
              onPressed: () {
                _globalKey.currentState!.openDrawer();
              },
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
          drawer: Drawer(
            child: ListView(
              children:  [
                UserAccountsDrawerHeader(
                    accountName:  Text('محمد دهقانی فرد',style: AppTextStyle.subTitle.apply(color: Colors.white)),
                    accountEmail:  Text('info@dehghanifard.ir',style: AppTextStyle.subTitle.apply(color: Colors.white)),
                    currentAccountPicture: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: Image.asset('assets/images/logo.jpg'),
                    )),
                //درباره ما
                DrawerItem(
                  onTap: () {

                  },
                  title: "درباره ما",
                    leading: const Icon(Icons.info),
                  textStyle: AppTextStyle.subTitle,
                ),
                // ارتباط با ما
                DrawerItem(
                  onTap: () {

                  },
                  title: "ارتباط با ما",
                    leading: const Icon(Icons.send),
                  textStyle: AppTextStyle.subTitle,
                ),
                // ثبت نظر
                DrawerItem(
                  onTap: () {

                  },
                  title: "ثبت نظر",
                    leading: const Icon(Icons.comment),
                  textStyle: AppTextStyle.subTitle,
                ),
                // اشتراک گذاری برنامه
                DrawerItem(
                  onTap: () {

                  },
                  title: "اشتراک گذاری برنامه",
                    leading: const Icon(Icons.share),
                  textStyle: AppTextStyle.subTitle,
                ),
              ],
            ),
          ),
          body:  TabBarView(
            children: [
              const TranslationScreen(),
              WordsScannerScreen(),
            ],
          ),

    ),
      ),
    );
  }
}
