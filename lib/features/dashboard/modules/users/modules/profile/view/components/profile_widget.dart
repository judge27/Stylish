import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/core/utils/validation.dart';
import 'package:stylish/core/models/textfield_model.dart';
import 'package:stylish/features/auth/registration/view/component/textfield_widget.dart';
import 'package:stylish/features/dashboard/modules/users/modules/profile/controller/cubit/profilecontroller_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,required this.controller
  }) : super(key: key);
  final ProfilecontrollerCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfilecontrollerCubit>.value(
      value:controller,
      child: BlocBuilder<ProfilecontrollerCubit, ProfilecontrollerState>(
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
              child: Form(
                key: controller.formKey,
                child: SizedBox(
                  width: context.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text("Account", style: TextStyle(
                            color: Theme
                                .of(context)
                                .hintColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 28
                        ),),
                      ),
                      SizedBox(height: 32,),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                    NetworkImage(controller.profileImage??"")
                                ),
                              ],
                            ),
                            SizedBox(width: 32,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               InkWell(
                                 onTap:(){
                                   controller.uploadImageToStorage();
                                  },
                                 child: Core.instance.coreButton(
                                          height: 38,
                                          buttonText: "CHANGE PICTURE",
                                          context: context
                                      ),
                               ),
                                SizedBox(height: 25,),
                                InkWell(
                                  onTap:(){
                                    controller.onDelete();
                                  },
                                  child: Core.instance.coreButton(
                                          height: 38,
                                          buttonText: "         DELETE          ",
                                          context: context
                                  ),
                                ),
                              ],
                            )
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
                          readOnly: true,
                          textStyle: Core.instance.authTextStyle,
                          inputDecoration:
                          Core.instance.authInputDecoration(context).copyWith(
                            hintText: AppLocalizations.of(context)!.name,
                          ),
                          controller: controller.nameController,
                          keyboardType: TextInputType.name,

                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFieldWidget(
                          model: TextFieldModel(
                            readOnly: true,
                            textStyle: Core.instance.authTextStyle,
                            inputDecoration: Core.instance
                                .authInputDecoration(context)
                                .copyWith(
                                prefixIcon: const Icon(Icons.email),
                                hintText: AppLocalizations.of(context)!.email),
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,

                          )),
                      const SizedBox(
                        height: 30,
                      ),
                          TextFieldWidget(
                              model: TextFieldModel(
                                readOnly: true,
                                textStyle: Core.instance.authTextStyle,
                                keyboardType: TextInputType.visiblePassword,
                                controller: controller.phoneController,
                                textInputAction: TextInputAction.done,
                                inputDecoration:
                                Core.instance.authInputDecoration(context).copyWith(
                                  prefixIcon: const Icon(Icons.phone),
                                  hintText: AppLocalizations.of(context)!.phonenumber,
                                ),
                              )),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Spacer(),
                          InkWell(
                            onTap:(){
                              context.pushTo=Routes.CHANGEPHONENUMBER;
                            },
                            child: Core.instance.coreButton(
                                height: 26,
                                buttonText: "  CHANGE  ",
                                context: context
                            ),
                          ),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
