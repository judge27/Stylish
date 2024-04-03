import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:stylish/view/forgot_password.dart';
import 'package:stylish/view/getstarted.dart';
import 'package:stylish/view/onboard_page1.dart';
import 'package:stylish/view/signin.dart';
import 'package:stylish/view/signup.dart';
import 'package:stylish/view/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Splash.id: (context) => const Splash(),
        Signin.id: (context) =>  Signin(),
        Signup.id: (context) =>  Signup(),
        ForgotPassword.id: (context) => const ForgotPassword(),
        GetStarted.id: (context) => const GetStarted(),
        OnboardPage1.id1: (context) => const OnboardPage1(
              index: 0,
            ),
        OnboardPage1.id2: (context) => const OnboardPage1(
              index: 1,
            ),
        OnboardPage1.id3: (context) => const OnboardPage1(
              index: 2,
            ),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: Splash.id,
    );
  }
}
