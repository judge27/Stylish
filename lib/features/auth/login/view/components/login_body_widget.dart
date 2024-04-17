import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/utils/context_extension.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/core/utils/validation.dart';
import 'package:stylish/features/auth/login/controller/logincontroller_cubit.dart';
import 'package:stylish/features/auth/login/view/components/bottom_login_widget.dart';
import 'package:stylish/features/auth/registration/model/textfield_model.dart';
import 'package:stylish/features/auth/registration/view/component/textfield_widget.dart';

class LoginBodyWidget extends StatelessWidget {
  const LoginBodyWidget(
      {super.key, required this.controller});
  final LogincontrollerCubit controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
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
                          // Screen title Text //Welcome Back!
                          SizedBox(
                            width: 190,
                            child: Text(
                              "Welcome Back!",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 43,
                                fontWeight: FontWeight.w800,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          // Email TextField // Username or Email
                          TextFieldWidget(
                            item: TextFieldModel(
                              inputDecoration: Core().inputDecoration.copyWith(
                                  prefixIcon: const Icon(Icons.email),
                                  hintText: "Username or Email"),
                              controller: controller.emailController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              validator: Validation().validateEmail,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          // Password TextField // Password
                          TextFieldWidget(
                              item: TextFieldModel(
                            controller: controller.passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            inputDecoration: Core().inputDecoration.copyWith(
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
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: Color(0xFFF83758),
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
                          Spacer(
                            flex: 1,
                          ),
                          BottomLoginWidget(controller: controller),
                          Spacer(
                            flex: 20,
                          ),
                        ],
                      ),
                    ));
              },
            ),
          ),
        ));
  }
}
