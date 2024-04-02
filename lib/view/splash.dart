import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stylish/const.dart';
import 'package:stylish/view/onboard_page1.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  static const String id = "SplashPage";
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.pushNamed(context, OnboardPage1.id1));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(kLogo),
      ),
    );
  }
}
