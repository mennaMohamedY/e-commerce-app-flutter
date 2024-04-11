

import 'package:e_commerce_app/ui/utiles/colors.dart';
import 'package:flutter/material.dart';

class MyTheme{
  static ThemeData LightModeTheme=ThemeData(
    appBarTheme: AppBarTheme(color: AppColors.PrimaryColor,),
        iconButtonTheme:IconButtonThemeData(style: ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white)) ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: AppColors.PrimaryColor,)
  );
}