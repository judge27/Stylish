import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/const.dart';
import 'package:stylish/core/utils/extensions.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/features/auth/registration/controller/registrationcontroller_cubit.dart';

class BottomRegistrationWidget extends StatelessWidget {
  const BottomRegistrationWidget({super.key, required this.controller});

  final RegistrationcontrollerCubit controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.height / 2.6,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width / 25),
          child: BlocProvider<RegistrationcontrollerCubit>.value(
            value: controller,
            child: BlocBuilder<RegistrationcontrollerCubit,
                RegistrationcontrollerState>(
              builder: (context, state) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.confirmRegistration(context);
                      },
                      child: Core.instance
                          .coreButton(buttonText: "Create Account"),
                    ),
                    SizedBox(
                      height: context.height / 48,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "- OR Continue with -",
                        style: TextStyle(
                          color: Color(0xFF575757),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.height / 85,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await controller.handleGoogleSignin(
                                context: context);
                          },
                          child: CircleAvatar(
                            radius: 33.5,
                            backgroundColor: const Color(0xFFF83758),
                            child: CircleAvatar(
                              radius: 32,
                              backgroundColor: const Color(0xFFFFFFFF),
                              child: Image.asset(kGoogle),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: context.width / 8,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await controller.handleGoogleSignout(
                                context: context);
                          },
                          child: CircleAvatar(
                            radius: 33.5,
                            backgroundColor: const Color(0xFFF83758),
                            child: CircleAvatar(
                              radius: 32,
                              backgroundColor: const Color(0xFFFFFFFF),
                              child: Image.asset(kApple),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: context.width / 8,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 33.5,
                            backgroundColor: const Color(0xFFF83758),
                            child: CircleAvatar(
                              radius: 32,
                              backgroundColor: const Color(0xFFFFFFFF),
                              child: Image.asset(kFacebook),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: context.height / 85),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "I Already Have an Account",
                            style: TextStyle(
                              color: Color(0xFF575757),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: context.width / 25,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Login",
                                style: TextStyle(
                                  color: Color(0xFFF83758),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.height / 75,
                    )
                  ],
                );
              },
            ),
          ),
        ));
  }
}
