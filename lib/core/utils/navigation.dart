
import 'package:flutter/material.dart';
import 'package:stylish/features/auth/forgotpassword/view/page/forgotpassword_page.dart';
import 'package:stylish/features/auth/login/view/page/login_page.dart';
import 'package:stylish/features/auth/onboarding/view/page/onboarding_page.dart';
import 'package:stylish/features/auth/registration/view/page/registration_page.dart';

class Navigation {
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
  switch(settings.name){
    case 'registration':return MaterialPageRoute<dynamic>(builder: (BuildContext context)=>const RegistrationPage());
    case 'login':
      final String data =settings.arguments as String;
      return MaterialPageRoute<dynamic>(builder: (BuildContext context)=>LoginPage(name: data,));
    case 'forgotpassword': return MaterialPageRoute<dynamic>(builder: (BuildContext context)=>const ForgotPasswordPage());
    default: return MaterialPageRoute<dynamic>(builder: (BuildContext context)=>const OnboardingPage());

  }
  }
  static List<Route> routes=[
  MaterialPageRoute<dynamic>(builder: (BuildContext context)=>const OnboardingPage()),
  ];
}