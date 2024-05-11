import 'package:flutter/material.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/features/auth/forgotpassword/view/page/forgotpassword_page.dart';
import 'package:stylish/features/auth/getstarted/view/page/getstarted_page.dart';
import 'package:stylish/features/auth/login/view/page/login_page.dart';
import 'package:stylish/features/auth/onboarding/view/page/onboarding_page.dart';
import 'package:stylish/features/auth/phonenumber/controller/cubit/phonenumbercontroller_cubit.dart';
import 'package:stylish/features/auth/registration/view/page/registration_page.dart';
import 'package:stylish/features/auth/phonenumber/view/page/phonenumber_page.dart';
import 'package:stylish/features/auth/verification/view/page/verification_page.dart';
import 'package:stylish/features/dashboard/modules/addproduct/view/page/new_product_page.dart';
import 'package:stylish/features/dashboard/view/page/dashboard_page.dart';

class Navigation {

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.SIGN_UP:
        return MaterialPageRoute(builder: (_) => const RegistrationPage());
      case Routes.NewProduct:
        return MaterialPageRoute(builder: (_) =>  const NewProductPage());
      case Routes.LOGIN:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case Routes.FORGOT_PASSWORD:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
      case Routes.PHONE_NUMBER:
        return MaterialPageRoute(builder: (_) => const PhoneNumberPage());
      case Routes.VERIFICATION:
        final PhonenumbercontrollerCubit data =PhonenumbercontrollerCubit();
        return MaterialPageRoute(builder: (_) =>  VerificationPage( controller: data,
     ));
      case Routes.GETSTARTED:
        return MaterialPageRoute(builder: (_) => const GetStartedPage());
      case Routes.DASHBOARD:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      default:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
    }
  }

  static List<Route> routes = [
   MaterialPageRoute(builder: (_) => const OnboardingPage()),
  ];
  static List<Route> routes2 = [
    MaterialPageRoute(builder: (_) => const LoginPage()),
  ];
  static List<Route> routes3 = [
    MaterialPageRoute(builder: (_) => const DashboardPage()),
  ];

}
