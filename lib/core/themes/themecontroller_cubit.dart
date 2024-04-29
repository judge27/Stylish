import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../constant colors/appcolors.dart';

part 'themecontroller_state.dart';

class ThemecontrollerCubit extends Cubit<ThemecontrollerState> {
  ThemecontrollerCubit() : super(ThemecontrollerInitial());
  static final _lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.SCAFFOLD_LIGHT_COLOR,//backscreen
    primaryColor: AppColors.PRIMARY_COLOR_LIGHT,//button,sign,forget,avatar border
    hintColor: AppColors.FONT_COLOR_LIGHT,// text after abbBar
    hoverColor: AppColors.TEXT_BUTTON_COLOR, //text button color
    // highlightColor: AppColors.TEXT_LIGHT,
    brightness: Brightness.light,
    splashColor: AppColors.TEXT_LIGHT,
  );

  static final _darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.SCAFFOLD_DARK_COLOR,//backscreen
    primaryColor: AppColors.PRIMARY_COLOR_DARK,//button,sign,forget,avatar border
    hintColor: AppColors.FONT_COLOR_DARK,// text after abbBar
    brightness: Brightness.dark,
    hoverColor: AppColors.TEXT_BUTTON_COLOR,//text button color
    splashColor: AppColors.TEXT_DARK,
    // highlightColor: AppColors.TEXT_DARK,//
  );
  bool lightTheme = true;
  ThemeData themess = _lightTheme ;
  ThemeData get themeData => themess ;
  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    lightTheme = !lightTheme;
    if (lightTheme == true )
      themess = _lightTheme ;
    else
      themess = _darkTheme;
    emit(ThemecontrollerInitial());
  }
}
