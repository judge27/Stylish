import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish/const.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/firebase/firebase.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/features/auth/onboarding/model/onboarding_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        kCircle: kCircle,
       ),
    OnboardingModel(
        image: kSplash2,
        kCircle: kCircle2,
        ),
    OnboardingModel(
        image: kSplash3,
        kCircle: kCircle3,
       ),
  ];

  // next button Method
  void changeNextPage({required int index, required BuildContext context}) {
    if (index == pages.length - 1) {
      onSkipButton(context);
    } else {
      pageIndex++;
      pageController.jumpToPage(pageIndex);
    }
    emit(OnbardingPageChanges());
  }

  // previous button Method
  void changePrevPage({int index = 0, required BuildContext context}) {
    if (index != 0) {
      pageIndex--;
      pageController.jumpToPage(pageIndex);
    } else {
      context.pop;
    }
    emit(OnbardingPageChanges());

  }

  // skip button method
  void onSkipButton(BuildContext context) async {
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.setBool('onboarding', true);
    if (FireBaseModel.instance.checkUserNullable()) {
      Navigator.pushNamedAndRemoveUntil(context, Routes.LOGIN, (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, Routes.DASHBOARD, (route) => false);
    }

  }
}
