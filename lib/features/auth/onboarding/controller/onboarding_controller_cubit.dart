import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish/const.dart';
import 'package:stylish/core/utils/extensions.dart';
import 'package:stylish/core/utils/firebase.dart';
import 'package:stylish/features/auth/onboarding/model/onboarding_model.dart';

part 'onboarding_controller_state.dart';

class OnboardingControllerCubit extends Cubit<OnboardingControllerState> {
  OnboardingControllerCubit() : super(OnbardingControllerInitial());

  // controller object of pageView in onBoarding Page
  PageController pageController = PageController();

  // current onBoarding page variable
  int pageIndex = 0;

  // onBoarding pages List
  List pages = [
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

  // next button Method
  void changeNextPage({required int index, required BuildContext context}) {
    if (index == pages.length - 1) {
      onSkipButton(context);
    } else {
      pageIndex++;
      pageController.jumpToPage(pageIndex);
    }
  }

  // previous button Method
  void changePrevPage({int index = 0, required BuildContext context}) {
    if (index != 0) {
      pageIndex--;
      pageController.jumpToPage(pageIndex);
    } else {
      context.pop;
    }
  }

  // skip button method
  void onSkipButton(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding', true);
    if (FireBaseModel.instance.checkUserNullable()) {
      context.pushTo = 'login';
    } else {
      context.pushTo = 'getstarted';
    }
  }
}
