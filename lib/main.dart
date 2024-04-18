import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish/core/utils/firebase.dart';
import 'package:stylish/core/utils/navigation.dart';
import 'package:stylish/features/auth/verification/view/page/phonenumber_page.dart';
import 'package:stylish/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "stylish-app-93002",
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool onBoarding = prefs.getBool('onboarding') ?? false;
  MaterialApp materialApp = MaterialApp(
      builder: FToastBuilder(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Navigation.onGenerateRoute,
      onGenerateInitialRoutes: (_) => onBoarding
          ? FireBaseModel().checkUserNullable()
              ? // Login Page
              Navigation.routes3
              : // GetStarted Page
              Navigation.routes2
          : // Onboarding Page
          Navigation.routes

  );
  runApp(materialApp);
}
