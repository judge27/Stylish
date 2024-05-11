import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/core/utils/validation.dart';
import 'package:stylish/core/models/textfield_model.dart';
import 'package:stylish/features/auth/registration/view/component/textfield_widget.dart';
import 'package:stylish/features/dashboard/modules/users/controller/cubit/usercontroller_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserItemWidget extends StatelessWidget {
  const UserItemWidget({
    Key? key,required this.controller
  }) : super(key: key);
  final UsercontrollerCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsercontrollerCubit>.value(
      value:controller,
      child: BlocBuilder<UsercontrollerCubit, UsercontrollerState>(
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                 Center(child:  Stack(
                             alignment: Alignment.bottomRight,
                             children: [
                               CircleAvatar(
                                 radius: 40,
                                 backgroundImage:
                                 NetworkImage(controller.profileImage??"")
                                 ),
                               InkWell(
                                 onTap: () async {
                                   controller.uploadImageToStorage();
                                 },
                                 child: const CircleAvatar(
                                   radius: 13,
                                   backgroundColor: Colors.white,
                                   child: CircleAvatar(
                                     radius: 11.5,
                                     backgroundColor: Colors.green,
                                     child: Icon(
                                       Icons.edit,
                                       color: Colors.white,
                                       size: 17,
                                     ),
                                   ),
                                 ),
                               ),
                             ],
                           ),
                           ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                     AppLocalizations.of(context)!.personaldetails,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).hintColor),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFieldWidget(
                      model: TextFieldModel(
                        textStyle: Core.instance.authTextStyle,
                        inputDecoration:
                            Core.instance.authInputDecoration(context).copyWith(
                              hintText: AppLocalizations.of(context)!.name,
                            ),
                        controller: controller.nameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        validator: (value) => Validation.instance
                            .validateName(context: context, value: value),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFieldWidget(
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
                      validator: (value) => Validation.instance
                          .validateEmail(context: context, value: value),
                    )),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFieldWidget(
                        model: TextFieldModel(
                      textStyle: Core.instance.authTextStyle,
                      keyboardType: TextInputType.visiblePassword,
                      controller: controller.passwordController,
                      textInputAction: TextInputAction.done,
                      inputDecoration:
                          Core.instance.authInputDecoration(context).copyWith(
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
                      validator: (value) => Validation.instance
                          .validatePassword(context: context, value: value),
                    )),
                    const SizedBox(
                      height: 15,
                    ),
                    ///////////////////////////////////////////////////////////////////
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppLocalizations.of(context)!.bankdetails,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).hintColor),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFieldWidget(
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
                            .validateName(context: context, value: value),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFieldWidget(
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
                      validator: (value) => Validation.instance
                          .validateEmail(context: context, value: value),
                    )),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFieldWidget(
                        model: TextFieldModel(
                      textStyle: Core.instance.authTextStyle,
                      keyboardType: TextInputType.visiblePassword,
                      controller: controller.passwordController,
                      textInputAction: TextInputAction.done,
                      inputDecoration:
                          Core.instance.authInputDecoration(context).copyWith(
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
                      validator: (value) => Validation.instance
                          .validatePassword(context: context, value: value),
                    )),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        onTap: () async{
                          await controller.onSave(context: context);
                        },
                        child: Core.instance.coreButton(
                          buttonText: AppLocalizations.of(context)!.save,
                          context: context,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
