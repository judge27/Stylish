import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/const.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/features/auth/registration/controller/cubit/registrationcontroller_cubit.dart';

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
                          .coreButton(buttonText: "Create Account",context: context),
                    ),
                    SizedBox(
                      height: context.height / 48,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "- OR Continue with -",
                        style: TextStyle(
                          color: Theme.of(context).splashColor,
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
                            backgroundColor: Theme.of(context).primaryColor,
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
                            backgroundColor: Theme.of(context).primaryColor,
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
                            backgroundColor: Theme.of(context).primaryColor,
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
                          child: Text(
                            "I Already Have an Account",
                            style: TextStyle(
                              color: Theme.of(context).splashColor,
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
                            child: Text("Login",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
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
