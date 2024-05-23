import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/models/enums/language.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());
  chnageLanguage(Languages language){
    switch(language){
      case Languages.Initial:
        if ( sharedPreferences!.getString('lang')!=null) {
          if (sharedPreferences!.getString('lang') == 'en') {
            emit(LanguageChanged(languageCode: 'en'));
          }
          else {
            emit(LanguageChanged(languageCode: 'ar'));
          }
        }
        else{
          sharedPreferences!.setString('lang','en');
          emit(LanguageChanged(languageCode: 'en'));
        }
        break;
      case Languages.en:
        sharedPreferences!.setString('lang','en');
        emit(LanguageChanged(languageCode: 'en'));
        break;
      case Languages.ar:
        sharedPreferences!.setString('lang','ar');
        emit(LanguageChanged(languageCode: 'ar'));
        break;

    }
  }
}
