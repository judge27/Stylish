import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/utils/extensions.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/core/utils/validation.dart';
import 'package:stylish/features/auth/registration/controller/registrationcontroller_cubit.dart';
import 'package:stylish/features/auth/registration/model/textfield_model.dart';
import 'package:stylish/features/auth/registration/view/component/textfield_widget.dart';

class RegistrationWidget extends StatelessWidget {
  const RegistrationWidget({super.key, required this.controller});
  final RegistrationcontrollerCubit controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width / 25),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: BlocProvider<RegistrationcontrollerCubit>.value(
            value: controller,
            child: BlocBuilder<RegistrationcontrollerCubit,
                RegistrationcontrollerState>(builder: (context, state) {
              return Form(
                  key: controller.formKey,
                  child: Container(
                      height: context.height / 1.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: context.height / 12,
                          ),
                          // Screen title Text //Welcome Back!
                          SizedBox(
                            width: context.width,
                            child: const Text(
                              "Create an account",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                                fontWeight: FontWeight.w800,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          SizedBox(
                            height: context.height / 48,
                          ),
                          // Name TextField // Your Name
                          TextFieldWidget(
                            model: TextFieldModel(
                                inputDecoration:
                                    Core.instance.authInputDecoration,
                                controller: controller.nameController,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                validator: Validation.instance.validateName,
                                textStyle: Core.instance.authTextStyle),
                          ),
                          SizedBox(
                            height: context.height / 48,
                          ),

                          // Email TextField // Username or Email
                          TextFieldWidget(
                            model: TextFieldModel(
                                inputDecoration:
                                    Core.instance.authInputDecoration.copyWith(
                                        prefixIcon: const Icon(Icons.email),
                                        hintText: "Username or Email"),
                                controller: controller.emailController,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                validator: Validation.instance.validateEmail,
                                textStyle: Core.instance.authTextStyle),
                          ),
                          SizedBox(
                            height: context.height / 48,
                          ),

                          // Password TextField // Password
                          TextFieldWidget(
                              model: TextFieldModel(
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: controller.passwordController,
                                  textInputAction: TextInputAction.done,
                                  inputDecoration: Core
                                      .instance.authInputDecoration
                                      .copyWith(
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
                                  validator:
                                      Validation.instance.validatePassword,
                                  textStyle: Core.instance.authTextStyle)),
                          SizedBox(
                            height: context.height / 45,
                          ),
                        ],
                      )));
            }),
          ),
        ));
  }
}
