import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/models/enums/themestate.dart';
import 'package:stylish/core/theme/themes.dart';
import 'package:stylish/core/firebase/firebase.dart';
import 'package:stylish/core/navigation/navigation.dart';
import 'package:stylish/core/firebase/firebase_options.dart';
import 'package:stylish/core/theme/apptheme_cubit.dart';
import 'package:stylish/features/auth/phonenumber/view/page/phonenumber_page.dart';
import 'package:stylish/features/dashboard/modules/users/view/page/user_page.dart';
import 'features/auth/onboarding/view/page/onboarding_page.dart';
import 'features/dashboard/modules/wishlist/view/page/wishlist_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  sharedPreferences = await SharedPreferences.getInstance();
  onBoarding = sharedPreferences!.getBool('onboarding') ?? false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppthemeCubit>(
        create: (context) => AppthemeCubit()..chnageTheme(ThemeState.Light),
        child: BlocBuilder<AppthemeCubit, AppThemeState>(
            builder: (context, state) {
              if( state is AppLightTheme){
                return MaterialApp(
                  builder: DevicePreview.appBuilder,
                  useInheritedMediaQuery: true,
                  theme: Themes.lightTheme,
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: Navigation.onGenerateRoute,
                  // onGenerateInitialRoutes: (_) => onBoarding
                  //     ? FireBaseModel.instance.checkUserNullable()
                  //     ? // Login Page
                  // Navigation.routes2
                  //     : // GetStarted Page
                  // Navigation.routes3
                  //     : // Onboarding Page
                  // Navigation.routes,
                  home: UserPage()
                 );
              }
              else {
               return MaterialApp(
                  builder: DevicePreview.appBuilder,
                  useInheritedMediaQuery: true,
                  theme: Themes.darkTheme,
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: Navigation.onGenerateRoute,
                  onGenerateInitialRoutes: (_) => onBoarding
                      ? FireBaseModel.instance.checkUserNullable()
                      ? // Login Page
                  Navigation.routes2
                      : // GetStarted Page
                  Navigation.routes3
                      : // Onboarding Page
                  Navigation.routes,

               );
              }
        }));
  }
}
