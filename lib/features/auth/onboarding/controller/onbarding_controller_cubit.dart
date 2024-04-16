import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:stylish/const.dart';
import 'package:stylish/features/auth/onboarding/model/onboarding_model.dart';

part 'onbarding_controller_state.dart';

class OnbardingControllerCubit extends Cubit<OnbardingControllerState> {
  OnbardingControllerCubit() : super(OnbardingControllerInitial());

  PageController pageController = PageController();
  void changeNextPage({var index = 0, required BuildContext context}) {
    if (index != 2)
      pageController.nextPage(
          duration: Duration(seconds: 1), curve: Curves.linear);
    else {
      Navigator.pushNamed(context, 'login', arguments: '');
    }
  }

  void changePrevPage({var index = 0}) {
    if (index != 0)
      pageController.previousPage(
          duration: Duration(seconds: 1), curve: Curves.linear);
  }

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
  void onSkipButton(BuildContext context) {
    Navigator.pushNamed(
      context,
      'login',
    );
  }
}
