import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key, required this.title, required this.textStyle, required this.leading, required this.onTap}) : super(key: key);
  final String title;
  final TextStyle textStyle;
  final Icon leading;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title,style: textStyle),
      leading: leading,
    );
  }
}
