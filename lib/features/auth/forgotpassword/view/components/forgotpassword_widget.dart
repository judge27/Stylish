

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/core/utils/validation.dart';
import 'package:stylish/features/auth/forgotpassword/controller/cubit/forgotpasswordcontroller_cubit.dart';
import 'package:stylish/features/auth/registration/model/textfield_model.dart';
import 'package:stylish/features/auth/registration/view/component/textfield_widget.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.width/25 ,vertical:  context.height/15),
        child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: BlocProvider<ForgotpasswordcontrollerCubit>(
              create: (context) => ForgotpasswordcontrollerCubit(),
              child: BlocBuilder<ForgotpasswordcontrollerCubit,
                  ForgotpasswordcontrollerState>(
                builder: (context, state) {
                  final ForgotpasswordcontrollerCubit controller =
                      context.read<ForgotpasswordcontrollerCubit>();
                  return Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Screen title Text //Welcome Back!
                         SizedBox(
                          width: context.width,
                          child: Text(
                            "Forgot password?",
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
                          height: context.height/15,
                        ),
                        // Email TextField // Username or Email
                        TextFieldWidget(
                          model: TextFieldModel(
                            textStyle: Core.instance.authTextStyle,
                            inputDecoration: Core.instance.authInputDecoration(context).copyWith(
                                prefixIcon: const Icon(Icons.email),
                                hintText: "Enter your email address"),
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.done,
                            validator: Validation.instance.validateEmail,
                          ),
                        ),
                        SizedBox(
                          height: context.height/15,
                        ),
                        Container(
                            child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                color: Theme.of(context).splashColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                  text: "* ",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor, fontSize: 20),
                                ),
                                const TextSpan(
                                  text:
                                      "We will send you a message to set or reset your new password",
                                )
                              ]),
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                        )),
                         SizedBox(
                          height: context.height/15,
                        ),
                        InkWell(
                          onTap: () async {
                            await controller.confirmForgotPassword(context);
                          },
                          child: Core.instance.coreButton(buttonText: "Submit",context: context),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )));
  }
}

