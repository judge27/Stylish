import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/models/enums/themestate.dart';

part 'apptheme_state.dart';

class AppthemeCubit extends Cubit<AppThemeState> {
  AppthemeCubit() : super(AppThemeInitial());
  chnageTheme(ThemeState state){
    switch(state){
      case ThemeState.Initial:
        if ( sharedPreferences!.getString('theme')!=null) {
          if (sharedPreferences!.getString('theme') == 'light') {
                  emit(AppLightTheme());
          }
          else {
            emit(AppDarkTheme());
          }
        }
        else{
          sharedPreferences!.setString('theme','light');
          emit(AppDarkTheme());
        }
        break;
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
