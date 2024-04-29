// import 'package:device_preview/device_preview.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish/core/themes/themecontroller_cubit.dart';
import 'package:stylish/core/utils/firebase.dart';
import 'package:stylish/core/utils/navigation.dart';
import 'package:stylish/features/auth/onboarding/view/page/onboarding_page.dart';
import 'package:stylish/features/auth/phonenumber/view/page/phonenumber_page.dart';
import 'package:stylish/features/auth/verification/view/page/verification_page.dart';
import 'package:stylish/features/dashboard/view/page/dashboard_page.dart';
import 'package:stylish/firebase_options.dart';

import 'core/themes/app_thme_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool onBoarding = prefs.getBool('onboarding') ?? false;
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => App(), // Wrap your app
    ),
  );
}
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        lazy: false,
        create: (context) => ThemecontrollerCubit(),
        child: BlocBuilder<ThemecontrollerCubit, ThemecontrollerState>(
        builder: (context, state)
    {
      ThemecontrollerCubit themecontrollerCubit = ThemecontrollerCubit () ;
      return MaterialApp(
        theme : themecontrollerCubit.themeData ,
        builder: DevicePreview.appBuilder,
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Navigation.onGenerateRoute,
        home: OnboardingPage(),
        // onGenerateInitialRoutes: (_) => onBoarding
        //     ? FireBaseModel().checkUserNullable()
        //     ? // Login Page
        // Navigation.routes2
        //     : // GetStarted Page
        // Navigation.routes3
        //     : // Onboarding Page
        // Navigation.routes,

      );
    }));}}
