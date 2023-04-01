import 'package:flutter/material.dart';

class CustomAppBar   {

  static AppBar mainAppBar({required Color backGroundColor,required String title,required  TextStyle textStyle, required Widget leading, required List<Widget> actions,required double elevation}){
    return AppBar(
        backgroundColor: backGroundColor,
        automaticallyImplyLeading: false,
        elevation: elevation,
        title: Text(title,style: textStyle),
        leading: leading,
        actions: actions
    );
  }

}
