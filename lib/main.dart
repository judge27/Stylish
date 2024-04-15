import 'package:flutter/material.dart';
import 'package:stylish/core/utils/navigation.dart';

void main() async {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Navigation.onGenerateRoute,
      onGenerateInitialRoutes:(_)=>Navigation.routes,
    );
  }
}

