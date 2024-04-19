import 'package:flutter/material.dart';
import 'package:stylish/features/auth/forgotpassword/view/page/forgotpassword_page.dart';
import 'package:stylish/features/auth/getstarted/view/page/getstarted_page.dart';
import 'package:stylish/features/auth/login/view/page/login_page.dart';
import 'package:stylish/features/auth/onboarding/view/page/onboarding_page.dart';
import 'package:stylish/features/auth/registration/view/page/registration_page.dart';
import 'package:stylish/features/auth/verification/controller/verificationcontroller_cubit.dart';
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
        final VerificationcontrollerCubit data=settings.arguments as VerificationcontrollerCubit;
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) =>  VerificationPage(controller: data,));
      case 'phonenumber':
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => const PhoneNumberPage());
      case 'getstarted':
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => const GetStartedPage());
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
        builder: (BuildContext context) => const LoginPage()),
  ];
  static List<Route> routes3 = [
    MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const GetStartedPage()),
  ];

}
