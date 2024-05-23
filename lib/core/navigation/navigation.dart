import 'dart:typed_data';

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
import 'package:stylish/features/dashboard/modules/fav/view/page/favoriteproduct_page.dart';
import 'package:stylish/features/dashboard/modules/payment/controller/cubit/paymentcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/payment/modules/checkout/view/page/payment_page.dart';
import 'package:stylish/features/dashboard/modules/payment/view/page/shopping_bag_page.dart';
import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';
import 'package:stylish/features/dashboard/modules/products/modules/productdetails/view/page/productdetails_page.dart';
import 'package:stylish/features/dashboard/modules/users/modules/password/view/page/changepassword_page.dart';
import 'package:stylish/features/dashboard/modules/users/modules/paymentinfo/view/page/payment_info_page.dart';
import 'package:stylish/features/dashboard/modules/users/modules/phonenumber/view/page/chnagephonenumber_page.dart';
import 'package:stylish/features/dashboard/modules/users/modules/profile/view/page/profile_page.dart';
import 'package:stylish/features/dashboard/modules/users/modules/rateourapplication/view/page/rateourapplication_page.dart';
import 'package:stylish/features/dashboard/view/page/dashboard_page.dart';

class Navigation {

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.SIGN_UP:
        return MaterialPageRoute(builder: (_) => const RegistrationPage());

      case Routes.LOGIN:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case Routes.FORGOT_PASSWORD:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
      case Routes.PHONE_NUMBER:
        return MaterialPageRoute(builder: (_) => const PhoneNumberPage());
      case Routes.VERIFICATION:
        final PhonenumbercontrollerCubit data =settings.arguments as PhonenumbercontrollerCubit;
        return MaterialPageRoute(builder: (_) =>  VerificationPage( controller: data,
     ));
      case Routes.GETSTARTED:
        return MaterialPageRoute(builder: (_) => const GetStartedPage());
      case Routes.DASHBOARD:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case Routes.NEWProduct:
        return MaterialPageRoute(builder: (_) =>  const NewProductPage());
      case Routes.PRODUCTDETAILS:
        final ProductModel data = settings.arguments as ProductModel;
        return MaterialPageRoute(builder: (_) =>   ProductDetailsPage(productModel:data));
      case Routes.CHANGEPHONENUMBER:
        return MaterialPageRoute(builder: (_) => const ChangePhoneNumberPage());
      case Routes.CHANGEPASSWORD:
        return MaterialPageRoute(builder: (_) => const ChangePasswordPage());
      case Routes.FavProduct:
        return MaterialPageRoute(builder: (_) => const FavoriteProductPage());
      case Routes.PROFILE:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case Routes.PAYMENT:
        return MaterialPageRoute(builder: (_) => const PaymentInfoPage());
      case Routes.RATEOURAPP:
        return MaterialPageRoute(builder: (_) =>  RateOurApplicationPage());
        case Routes.SHOPPINGBAG:
        final ProductModel data = settings.arguments as ProductModel;
        return MaterialPageRoute(builder: (_) =>  ShoppingBagPage(productModel:data));
      case Routes.CHECKOUT:
      final PaymentcontrollerCubit data = settings.arguments as PaymentcontrollerCubit;
      return MaterialPageRoute(builder: (_) =>  PaymentPage(cubit:data));

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
