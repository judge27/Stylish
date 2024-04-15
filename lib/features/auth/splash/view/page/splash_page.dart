//
// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:stylish2/const.dart';
// class SplashPage extends StatefulWidget {
//   const SplashPage({super.key});
//   static const String id = "SplashPage";
//   @override
//   State<SplashPage> createState() => _SplashPageState();
// }
//
// class _SplashPageState extends State<SplashPage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Timer(const Duration(seconds: 3),
//             () => Navigator.pushNamed(context,"onboarding" ));
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Image.asset(kLogo),
//       ),
//     );
//   }
// }