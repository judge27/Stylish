import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stylish/const.dart';
import 'package:stylish/view/onboard_page1.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            // ignore: prefer_const_constructors
            builder: (BuildContext context) => OnboardPage1(
                  index: 0,
                )),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(logo),
      ),
    );
  }
}
