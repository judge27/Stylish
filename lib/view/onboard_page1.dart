import 'package:flutter/material.dart';
import 'package:stylish/model/onboard_model.dart';
import 'package:stylish/view/signin.dart';
import 'package:stylish/widgets/onboarding_item.dart';
import '../const.dart';

const List<OnBoardingModel> item = [
  OnBoardingModel(
      bannerImage: kSplash1,
      titleText: "Choose Products",
      nextText: "Next",
      onBoardingImage: kCircle,
      pageNumber: "1",
      prevText: "      ",
      nextPage: OnboardPage1.id2),
  OnBoardingModel(
      bannerImage: kSplash2,
      titleText: "Make Payment",
      nextText: "Next",
      onBoardingImage: kCircle2,
      pageNumber: "2",
      prevText: "Prev",
      nextPage: OnboardPage1.id3),
  OnBoardingModel(
      bannerImage: kSplash3,
      titleText: "Get Your Order",
      nextText: "Get Started",
      onBoardingImage: kCircle3,
      pageNumber: "3",
      prevText: " Prev      ",
      nextPage: Signin.id),
];

class OnboardPage1 extends StatelessWidget {
  const OnboardPage1({super.key, required this.index});
  static const String id1 = "OnBoardingPage1";
  static const String id2 = "OnBoardingPage2";
  static const String id3 = "OnBoardingPage3";

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OnBoardingItem(item: item, index: this.index));
  }
}
