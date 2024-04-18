import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish/features/auth/forgotpassword/view/page/forgotpassword_page.dart';
import 'package:stylish/features/auth/login/view/page/login_page.dart';
import 'package:stylish/features/auth/onboarding/view/page/onboarding_page.dart';
import 'package:stylish/features/auth/registration/view/page/registration_page.dart';
import 'package:stylish/features/auth/verification/view/page/phonenumber_page.dart';
import 'package:stylish/features/auth/verification/view/page/verification_page.dart';

class Navigation {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'registration':
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => const RegistrationPage());
      case 'login':
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => LoginPage());
      case 'forgotpassword':
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => const ForgotPasswordPage());
      case 'otp':
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => const VerificationPage());
      case 'phonenumber':
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => const PhoneNumberPage());
      default:
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => const OnboardingPage());
    }
  }

  static List<Route> routes = [
    MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const OnboardingPage()),
  ];
  static List<Route> routes2 = [
    MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const ForgotPasswordPage()),
  ];
  static List<Route> routes3 = [
    MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const LoginPage()),
  ];

}
