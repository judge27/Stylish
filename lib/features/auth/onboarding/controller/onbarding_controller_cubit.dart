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
  int pageIndex=0;
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

  void changeNextPage({required int index , required BuildContext context}) {
    if(index==body.length-1){
      onSkipButton(context);
    }
    else{
    pageIndex++;
    pageController.jumpToPage(pageIndex);
    }
  }

  void changePrevPage({int index = 0,required BuildContext context}) {
    if (index != 0) {
      pageIndex--;
      pageController.jumpToPage(pageIndex);
    }
    else{
      Navigator.pop(context);
    }
  }

  void onSkipButton(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding', true);
    if (FireBaseModel.getInstance().checkUserNullable()) {
      Navigator.pushReplacementNamed(
        context,
        'login',
      );
    } else {
      Navigator.pushReplacementNamed(context, 'getstarted');
    }
  }
}
