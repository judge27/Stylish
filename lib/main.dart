import 'package:flutter/material.dart';
import 'package:stylish/view/splash.dart';

void main() {
  var name;
  name = "ahmed";
  print(name);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
