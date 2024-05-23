import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/core/utils/validation.dart';
import 'package:stylish/features/auth/registration/controller/cubit/registrationcontroller_cubit.dart';
import 'package:stylish/core/models/textfield_model.dart';
import 'package:stylish/features/auth/registration/view/component/textfield_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegistrationWidget extends StatelessWidget {
  const RegistrationWidget({super.key, required this.controller});
  final RegistrationcontrollerCubit controller;

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width / 25),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: BlocProvider<RegistrationcontrollerCubit>.value(
              value: controller,
              child: BlocBuilder<RegistrationcontrollerCubit,
                  RegistrationcontrollerState>(builder: (context, state) {
                return Form(
                    key: controller.formKey,
                    child: SizedBox(
                        height: context.height / 2.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Screen title Text //Welcome Back!
                            SizedBox(
                              width: context.width,
                              height: context.height / 12,
                              child: Text(
                                AppLocalizations.of(context)!.createanaccount,
                                style: TextStyle(
                                  color: Theme.of(context).hintColor,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w800,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            SizedBox(
                              height: context.height / 72,
                            ),
                            // Name TextField // Your Name
                            SizedBox(
                              height: context.height / 9,
                              child: TextFieldWidget(
                                model: TextFieldModel(
                                  textStyle: Core.instance.authTextStyle,
                                  inputDecoration:
                                      Core.instance.authInputDecoration(context).copyWith(
                                        hintText: AppLocalizations.of(context)!.name
                                      ),
                                  controller: controller.nameController,
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) => Validation.instance
                                      .validateName(
                                          context: context, value: value),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: context.height / 72,
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
                                        hintText: AppLocalizations.of(context)!.email),
                                controller: controller.emailController,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                validator:  (value) => Validation.instance.validateEmail(
                                    context: context, value: value)  ,
                              )),
                            ),
                            SizedBox(
                              height: context.height / 72,
                            ),
      
                            // Password TextField // Password
                            SizedBox(
                              height: context.height / 9,
                              child: TextFieldWidget(
                                  model: TextFieldModel(
                                textStyle: Core.instance.authTextStyle,
                                keyboardType: TextInputType.visiblePassword,
                                controller: controller.passwordController,
                                textInputAction: TextInputAction.done,
                                inputDecoration: Core.instance
                                    .authInputDecoration(context)
                                    .copyWith(
                                      prefixIcon: const Icon(Icons.lock),
                                      hintText: AppLocalizations.of(context)!.password,
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
                                validator: (value)=> Validation.instance.validatePassword(
                                      context: context, value: value)  ,
                              )),
                            ),
      
      
                            SizedBox(
                              height: context.height / 72,
                            ),
                          ],
                        )));
              }),
            ),
          )),
    );
  }
}
