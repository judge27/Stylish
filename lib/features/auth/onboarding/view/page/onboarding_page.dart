import 'package:flutter/material.dart';
import 'package:stylish/features/auth/onboarding/view/components/onboarding_widget.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: OnboardingWidget()
    );
  }
}
