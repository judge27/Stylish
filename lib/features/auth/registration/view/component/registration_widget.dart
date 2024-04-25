import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/core/utils/validation.dart';
import 'package:stylish/features/auth/registration/controller/registrationcontroller_cubit.dart';
import 'package:stylish/features/auth/registration/model/textfield_model.dart';
import 'package:stylish/features/auth/registration/view/component/textfield_widget.dart';

class RegistrationWidget extends StatelessWidget {
  const RegistrationWidget({
    super.key,
    required this.controller
  });
  final RegistrationcontrollerCubit controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: BlocProvider<RegistrationcontrollerCubit>.value(
            value: controller,
            child: BlocBuilder<RegistrationcontrollerCubit, RegistrationcontrollerState>(
              builder: (context, state) {
                return Form(
                  key: controller.formKey,
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Screen title Text //Welcome Back!
                    const SizedBox(
                      width: 190,
                      child: Text("Create an account",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 43,
                          fontWeight: FontWeight.w800,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    const SizedBox(height: 25,),
                    // Name TextField // Your Name
                    TextFieldWidget(
                      item: TextFieldModel(
                        inputDecoration: Core().inputDecoration,
                        controller: controller.nameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        validator: Validation().validateName,
                      ),
                    ),
                    const SizedBox(height: 25,),
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
                    const SizedBox(height: 25,),

                    // Password TextField // Password
                    TextFieldWidget(item: TextFieldModel(
                      keyboardType: TextInputType.visiblePassword,
                      controller: controller.passwordController,
                      textInputAction: TextInputAction.done,
                      inputDecoration: Core().inputDecoration.copyWith(
                          prefixIcon: const Icon(Icons.lock),
                          hintText: "Password"),
                      obscureText: true,
                      validator: Validation().validatePassword,
                    )),
                    // Forgot Password TextButton
                    const SizedBox(height: 50,),


                  ],
                )
                );
              },
            ),
          ),
        )

    );
  }
}
