import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish/model/custombutton_model.dart';
import 'package:stylish/model/textinput_model.dart';
import 'package:stylish/model/websiteslogo_model.dart';
import 'package:stylish/view/forgot_password.dart';
import 'package:stylish/view/getstarted.dart';
import 'package:stylish/view/signup.dart';
import 'package:stylish/widgets/login/backgroundimage_item.dart';
import 'package:stylish/widgets/login/custombutton_item.dart';
import 'package:stylish/widgets/login/passwordinput_item.dart';
import 'package:stylish/widgets/login/textinput_item.dart';
import 'package:stylish/widgets/login/websitesicons_item.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});
  static const String id = "SigninPage";
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackgroundImage(),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(children: [
              Container(
                height: 150,
                child: const Center(
                  child: Text(
                    "Stylish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextInput(
                          item: TextInputModel(
                            contentPadding: 15,
                            boderColor: Colors.transparent,
                            borderRadius: 16,
                            hintColor: Colors.white,
                            hintsize: 17,
                            prefixIconColor: Colors.white,
                            fillBorderColor: Colors.grey[600]!.withOpacity(0.5),
                            inputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.next,
                            hint: "Username or Email",
                            prefixIcon: Icons.email,
                          ),
                        ),
                        PasswordInput(
                          item: TextInputModel(
                            fillBorderColor: Colors.grey[600]!.withOpacity(0.5),
                            prefixIcon: Icons.lock_outline_rounded,
                            inputAction: TextInputAction.done,
                            hint: "Password",
                            contentPadding: 15,
                            boderColor: Colors.transparent,
                            borderRadius: 16,
                            hintColor: Colors.white,
                            hintsize: 17,
                            prefixIconColor: Colors.white,
                            inputType: TextInputType.emailAddress,
                            obscureText: true,
                            suffixIcon: CupertinoIcons.eye_slash_fill,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPassword()));
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                fontFamily: "Montserrat"),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 63,
                        ),
                        Container(
                          child: CustomButtonItem(
                            item: CustomButtonModel(
                              fontSize: 20,
                              titleColor: Colors.white,
                              fillColor: const Color(0xFFFF5656),
                              boderColor: const Color(0xFFFF5656),
                              boderRadius: 10,
                              title: "LOGIN",
                              height: 55,
                              onTap: () =>
                                  {Navigator.pushNamed(context, GetStarted.id)},
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        WebsitesLogoItem(
                          item: WebsitesLogoModel(
                            accountText: "Create An Account",
                            signinText: "Sign Up",
                            accountColor: Colors.white,
                            siginColor: const Color(0xFFF83758),
                            onSignTaped: () {
                              Navigator.pushNamed(context, Signup.id);
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ]),
          )))
    ]);
  }
}
