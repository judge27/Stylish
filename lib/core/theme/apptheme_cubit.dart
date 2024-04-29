import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/models/enums/themestate.dart';

part 'apptheme_state.dart';

class AppthemeCubit extends Cubit<AppThemeState> {
  AppthemeCubit() : super(AppThemeInitial());
  static bool isLight=true;
  chnageTheme(ThemeState state){
    isLight=!isLight;
    switch(state){
      case ThemeState.Light:
        sharedPreferences!.setString('theme','light');
        emit(AppLightTheme());
        break;
      case ThemeState.Dark:
        sharedPreferences!.setString('theme','dark');
        emit(AppDarkTheme());
        break;
  }

  }



}
