import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle{
  AppTextStyle._();

  static final TextStyle subTitle = GoogleFonts.vazirmatn(fontSize: 16,color: Colors.black,fontWeight: FontWeight.normal);
  static final TextStyle title = GoogleFonts.vazirmatn(fontSize: 16,color: Colors.grey[500],fontWeight: FontWeight.bold);
  static final TextStyle appBarTitle = GoogleFonts.vazirmatn(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold);
  static final TextStyle tabBarTitle = GoogleFonts.vazirmatn(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold);
}