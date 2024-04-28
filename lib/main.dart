import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish/core/utils/firebase.dart';
import 'package:stylish/core/utils/navigation.dart';
import 'package:stylish/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool onBoarding = prefs.getBool('onboarding') ?? false;
  MaterialApp materialApp = MaterialApp(
      builder: DevicePreview.appBuilder,
      useInheritedMediaQuery: true,
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
  runApp(
    // DevicePreview(
    //   enabled: false,
    //   builder: (context) =>
      materialApp, // Wrap your app
    //),
  );
}
