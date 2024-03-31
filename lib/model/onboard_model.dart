import 'package:flutter/cupertino.dart';

class OnBoardingModel {
  final String pageNumber;
  final String titleText;
  final String prevText;
  final String nextText;
  final String bannerImage;
  final String onBoardingImage;
  final Widget nextPage;

  const OnBoardingModel({
    required this.titleText,
    required this.bannerImage,
    required this.nextText,
    required this.onBoardingImage,
    required this.pageNumber,
    required this.prevText,
    required this.nextPage,
  });
}
