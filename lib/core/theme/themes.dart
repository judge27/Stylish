import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/constants/appcolors.dart';


class Themes {
  static  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.SCAFFOLD_LIGHT_COLOR,//backscreen
    primaryColor: AppColors.PRIMARY_COLOR_LIGHT,//button,sign,forget,avatar border
    hintColor: AppColors.FONT_COLOR_LIGHT,// text after abbBar
    hoverColor: AppColors.TEXT_BUTTON_COLOR, //text button color
   // highlightColor: AppColors.FORGET_DARK_COLOR,
    brightness: Brightness.light,
    splashColor: AppColors.TEXT_LIGHT,
  );
  static ThemeData  darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.SCAFFOLD_DARK_COLOR,//backscreen
    primaryColor: AppColors.PRIMARY_COLOR_DARK,//button,sign,forget,avatar border
    hintColor: AppColors.FONT_COLOR_DARK,// text after abbBar
    brightness: Brightness.dark,
    hoverColor: AppColors.TEXT_BUTTON_COLOR,//text button color
    splashColor: AppColors.TEXT_DARK,
    // highlightColor: AppColors.TEXT_DARK,//
  );
}
