import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/utils/extensions.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/core/utils/validation.dart';
import 'package:stylish/features/auth/login/controller/logincontroller_cubit.dart';
import 'package:stylish/features/auth/registration/model/textfield_model.dart';
import 'package:stylish/features/auth/registration/view/component/textfield_widget.dart';

class LoginBodyWidget extends StatelessWidget {
  const LoginBodyWidget({super.key, required this.controller});
  final LogincontrollerCubit controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width / 25),
        child: BlocProvider<LogincontrollerCubit>.value(
            value: controller,
            child: BlocBuilder<LogincontrollerCubit, LogincontrollerState>(
                builder: (context, state) {
              return Form(
                  key: controller.formKey,
                  child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Container(
                          height: context.height,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: context.height / 10,
                              ),
                              // Screen title Text //Welcome Back!
                              SizedBox(
                                width: context.width,
                                child: const Text(
                                  "Welcome Back!",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 43,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              SizedBox(
                                height: context.height / 36,
                              ),
                              // Email TextField // Username or Email
                              TextFieldWidget(
                                model: TextFieldModel(
                                  inputDecoration: Core.instance.authInputDecoration
                                      .copyWith(
                                          prefixIcon: const Icon(Icons.email),
                                          hintText: "Username or Email"),
                                  controller: controller.emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  validator: Validation.instance.validateEmail,
                                  textStyle:Core.instance.authTextStyle
                                ),
                              ),
                              SizedBox(
                                height: context.height / 36,
                              ),
                              // Password TextField // Password
                              TextFieldWidget(
                                  model: TextFieldModel(
                                controller: controller.passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.done,
                                inputDecoration:
                                    Core.instance.authInputDecoration.copyWith(
                                  prefixIcon: const Icon(Icons.lock),
                                  hintText: "Password",
                                  suffixIcon: InkWell(
                                    onTap: controller.togglePassword,
                                    child: Icon(
                                      controller.obscurePassword
                                          ? CupertinoIcons.eye_fill
                                          : CupertinoIcons.eye_slash_fill,
                                      color: Colors.black54,
                                      size: 24,
                                    ),
                                  ),
                                ),
                                obscureText: controller.obscurePassword,
                                validator: Validation.instance.validatePassword,
                                textStyle:Core.instance.authTextStyle
                              )),
                              Row(
                                children: [
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      context.pushTo = "forgotpassword";
                                    },
                                    // Forgot Password TextButton
                                    child: const Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                        color: Color(0xFFF83758),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: context.height / 48,
                              ),
                            ],
                          ))));
            })));
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
