import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish/const.dart';
import 'package:stylish/core/utils/firebase.dart';
import 'package:stylish/features/auth/onboarding/model/onboarding_model.dart';

part 'onbarding_controller_state.dart';

class OnbardingControllerCubit extends Cubit<OnbardingControllerState> {
  OnbardingControllerCubit() : super(OnbardingControllerInitial());

  PageController pageController = PageController();

  List body = [
    OnboardingModel(
        image: kSplash1,
        title: "Choose Products",
        kCircle: kCircle,
        pageNumber: "1"),
    OnboardingModel(
        image: kSplash2,
        title: "Choose Products",
        kCircle: kCircle2,
        prevText: "prev",
        pageNumber: "2"),
    OnboardingModel(
        image: kSplash3,
        title: "Get Your Order",
        kCircle: kCircle3,
        prevText: "prev",
        pageNumber: "3"),
  ];

  void changeNextPage({var index = 0, required BuildContext context}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding', true);
    if (FireBaseModel().checkUserNullable()) {
      Navigator.pushReplacementNamed(
        context,
        'login',
      );
    } else {
      Navigator.pushReplacementNamed(context, 'forgotpassword');
    }
  }

  void changePrevPage({var index = 0}) {
    if (index != 0)
      pageController.previousPage(
          duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  void onSkipButton(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding', true);
    if (FireBaseModel().checkUserNullable()) {
      Navigator.pushReplacementNamed(
        context,
        'login',
      );
    } else {
      Navigator.pushReplacementNamed(context, 'forgotpassword');
    }
  }
}
