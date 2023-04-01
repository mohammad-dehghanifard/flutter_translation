import 'package:flutter/material.dart';
import 'package:flutter_translation_demo/core/style/text_style.dart';
import 'package:flutter_translation_demo/core/widgets/app_bar/app_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
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
            ]
        )
      ),
    );
  }
}
