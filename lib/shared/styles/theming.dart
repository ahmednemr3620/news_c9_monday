import 'package:flutter/material.dart';

import 'colors.dart';

class MyThemeData {

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: mintGreen,


      bottomNavigationBarTheme:  BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedItemColor: primary ,
          unselectedItemColor: Colors.grey));
  static ThemeData darkTheme =ThemeData();
}
