import 'package:adexcloud/Shared/Style/Colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: primaryColor,
  ),
  scaffoldBackgroundColor: Colors.white,
);
class FontStyles{
  static const TextStyle style1=TextStyle(fontSize:22,color: darkBleu,fontFamily: 'Roboto1');
  static const TextStyle style2=TextStyle(fontSize:14,color: grey1,fontFamily: 'Roboto2' );
  static const TextStyle style3=TextStyle(fontSize:14,color: darkBleu,fontFamily: 'Roboto2' );
  static const TextStyle style4=TextStyle(fontSize:12,color: grey2,fontFamily: 'Roboto2' );
  static const TextStyle style5=TextStyle(fontSize: 12,color: darkBleu,fontFamily: 'Roboto1');
  static const TextStyle style6=TextStyle(fontSize:12 ,color: redError,fontFamily: 'Roboto2');
  static const TextStyle style7=TextStyle(fontSize: 10,color: darkBleu,fontFamily: 'Roboto1');
  static const TextStyle style8=TextStyle(fontSize: 9,color: Colors.white,fontFamily: 'Roboto1');
  static TextStyle style9=TextStyle(fontSize: 9,color: darkBleu.withOpacity(0.8),fontFamily: 'Roboto2');
  static const TextStyle style10=TextStyle(fontSize: 9,color: grey1,fontFamily: 'Roboto1');
}
