class OnboardingModel {
  late String image;
  late String pageNumber;
  late String title;
  late String kCircle;
  late String prevText;
  OnboardingModel({
    required this.image,
    required this.pageNumber,
    required this.title,
    required this.kCircle,
    this.prevText="",
});

}