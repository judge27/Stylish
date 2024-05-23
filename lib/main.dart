import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/languages/language_cubit.dart';
import 'package:stylish/core/models/enums/language.dart';
import 'package:stylish/core/models/enums/themestate.dart';
import 'package:stylish/core/theme/themes.dart';
import 'package:stylish/core/navigation/navigation.dart';
import 'package:stylish/core/firebase/firebase_options.dart';
import 'package:stylish/core/theme/apptheme_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/features/dashboard/modules/users/modules/paymentinfo/view/components/pament_info_widget.dart';
import 'package:stylish/features/dashboard/modules/users/modules/paymentinfo/view/page/payment_info_page.dart';
import 'package:stylish/features/dashboard/modules/users/modules/rateourapplication/view/page/rateourapplication_page.dart';

import 'core/firebase/firebase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  sharedPreferences = await SharedPreferences.getInstance();
  onBoarding = sharedPreferences!.getBool('onboarding') ?? false;
  runApp(DevicePreview(
    enabled: false,
    builder: (context) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppthemeCubit()..chnageTheme(ThemeState.Initial),
          ),
          BlocProvider(
            create: (context) =>
            LanguageCubit()..chnageLanguage(Languages.Initial),
          ),
        ],
        child:  Builder(
            builder: (context) {
              var themeState =context.select((AppthemeCubit cubit)=>cubit.state);
              var language =context.select((LanguageCubit cubit)=>cubit.state);
              return MaterialApp(
                locale: language is LanguageChanged? language.languageCode=='en'?Locale('en'):Locale('ar'):Locale('en'),
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                supportedLocales: const [
                  Locale("en"),
                  Locale("ar"),
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var locale in supportedLocales) {
                    if (deviceLocale != null) {
                      if (deviceLocale.languageCode == locale.languageCode) {
                        return deviceLocale;
                      }
                    }
                  }
                  return supportedLocales.first;
                },
                builder: DevicePreview.appBuilder,
                useInheritedMediaQuery: true,
                theme: themeState is AppChangeTheme? themeState.appTheme=='light'?Themes.lightTheme:Themes.darkTheme :Themes.lightTheme,
                debugShowCheckedModeBanner: false,
                onGenerateRoute: Navigation.onGenerateRoute,
                onGenerateInitialRoutes: (_) =>
                onBoarding
                    ? FireBaseModel.instance.checkUserNullable()
                    ? // Login Page
                Navigation.routes2
                    : // GetStarted Page
                Navigation.routes3
                    : // Onboarding Page
                Navigation.routes,
              );
            }
        )
    );
  }
}
