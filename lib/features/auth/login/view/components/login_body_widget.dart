import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/core/utils/validation.dart';
import 'package:stylish/features/auth/login/controller/cubit/logincontroller_cubit.dart';
import 'package:stylish/core/models/textfield_model.dart';
import 'package:stylish/features/auth/registration/view/component/textfield_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/firebase_users_data.dart';

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
                      child: SizedBox(
                          height: context.height / 1.7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Screen title Text //Welcome Back!
                              SizedBox(
                                height: context.height / 9,
                                width: context.width,
                                child: Text(
                                  AppLocalizations.of(context)!.welcomeback,
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
                                height: context.height / 63,
                              ),
                              // Email TextField // Username or Email
                              SizedBox(
                                height: context.height / 9,
                                child: TextFieldWidget(
                                  model: TextFieldModel(
                                    textStyle: Core.instance.authTextStyle,
                                    inputDecoration: Core.instance
                                        .authInputDecoration(context)
                                        .copyWith(
                                            prefixIcon: const Icon(Icons.email),
                                            hintText:
                                                AppLocalizations.of(context)!
                                                    .email),
                                    controller: controller.emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    validator: (value) => Validation.instance
                                        .validateEmail(
                                            context: context, value: value),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: context.height / 63,
                              ),
                              // Password TextField // Password
                              SizedBox(
                                height: context.height / 9,
                                child: TextFieldWidget(
                                    model: TextFieldModel(
                                  textStyle: Core.instance.authTextStyle,
                                  controller: controller.passwordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.done,
                                  inputDecoration: Core.instance
                                      .authInputDecoration(context)
                                      .copyWith(
                                        prefixIcon: const Icon(Icons.lock),
                                        hintText: AppLocalizations.of(context)!
                                            .password,
                                        suffixIcon: InkWell(
                                          onTap: controller.togglePassword,
                                          child: Icon(
                                            controller.obscurePassword
                                                ? CupertinoIcons.eye_slash_fill
                                                : CupertinoIcons.eye_fill,
                                            color: Colors.black54,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                  obscureText: controller.obscurePassword,
                                  validator: (value) => Validation.instance
                                      .validatePassword(
                                          context: context, value: value),
                                )),
                              ),
                              SizedBox(
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        context.pushTo = Routes.FORGOT_PASSWORD;
                                      },
                                      // Forgot Password TextButton
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .forgetpassword,
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: context.height / 63,
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
