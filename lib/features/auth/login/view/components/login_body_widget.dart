
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/const.dart';
import 'package:stylish/core/utils/context_extension.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/core/utils/validation.dart';
import 'package:stylish/features/auth/login/controller/logincontroller_cubit.dart';
import 'package:stylish/features/auth/login/view/components/bottom_login_widget.dart';
import 'package:stylish/features/auth/registration/model/textfield_model.dart';
import 'package:stylish/features/auth/registration/view/component/textfield_widget.dart';

class LoginBodyWidget extends StatelessWidget {
  const LoginBodyWidget({super.key, required this.controller});
  final LogincontrollerCubit controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(),
        child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: BlocProvider<LogincontrollerCubit>.value(
                value: controller,
                child: BlocBuilder<LogincontrollerCubit, LogincontrollerState>(
                    builder: (context, state) {
                  return Form(
                      key: controller.formKey,
                      child: Container(
                          height: context.height,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: context.height/24,
                                ),
                                // Screen title Text //Welcome Back!
                                SizedBox(
                                  width: context.width,
                                  child: Text(
                                    "Welcome Back!",
                                    style: TextStyle(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 43,
                                      fontWeight: FontWeight.w800,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                                SizedBox(
                                  height: context.height / 48,
                                ),
                                // Email TextField // Username or Email
                                TextFieldWidget(
                                  model: TextFieldModel(
                                    inputDecoration: Core()
                                        .inputDecoration
                                        .copyWith(
                                            prefixIcon: const Icon(Icons.email),
                                            hintText: "Username or Email"),
                                    controller: controller.emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    validator: Validation().validateEmail,
                                  ),
                                ),
                                SizedBox(
                                  height: context.height / 48,
                                ),
                                // Password TextField // Password
                                TextFieldWidget(
                                    model: TextFieldModel(
                                  controller: controller.passwordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.done,
                                  inputDecoration: Core()
                                      .inputDecoration
                                      .copyWith(
                                          prefixIcon: const Icon(Icons.lock),
                                          hintText: "Password"),
                                  obscureText: true,
                                  validator: Validation().validatePassword,
                                )),
                                // Forgot Password TextButton
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      child: Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                      ),
                                      onPressed: () {
                                        controller.navTOForgotPassword(
                                            context: context);
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: context.height / 48,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.confirmLogin(context: context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 25),
                                    child: Core().coreButton(buttonText: "Login" , context: context),
                                  ),
                                ),
                                SizedBox(
                                  height: context.height / 32,
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
                                  height: context.height / 48,
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
                                        backgroundColor:
                                        Theme.of(context).primaryColor,
                                        child: CircleAvatar(
                                          radius: 32,
                                          backgroundColor:
                                              const Color(0xFFFFFFFF),
                                          child: Image.asset(kGoogle),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: context.width / 10,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await controller.handleGoogleSignout(
                                            context: context);
                                      },
                                      child: CircleAvatar(
                                        radius: 33.5,
                                        backgroundColor:
                                        Theme.of(context).primaryColor,
                                        child: CircleAvatar(
                                          radius: 32,
                                          backgroundColor:
                                              const Color(0xFFFFFFFF),
                                          child: Image.asset(kApple),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: context.width / 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: CircleAvatar(
                                        radius: 33.5,
                                        backgroundColor:
                                        Theme.of(context).primaryColor,
                                        child: CircleAvatar(
                                          radius: 32,
                                          backgroundColor:
                                              const Color(0xFFFFFFFF),
                                          child: Image.asset(kFacebook),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                 SizedBox(
                                  height: context.height/48,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Create An Account",
                                        style: TextStyle(
                                          color : Theme.of(context).splashColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                     SizedBox(
                                      width: context.width/16,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, 'registration');
                                        },
                                        child: Text("Sign Up",
                                            style: TextStyle(
                                              color: Theme.of(context).primaryColor,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                                  TextDecoration.underline,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: context.height/8,)
                              ],
                          )));
                }))));
    //
    //                 ],
    //               ),
    //             ));
    //       },
    //     ),
    //   ),
    // ));
  }
}
