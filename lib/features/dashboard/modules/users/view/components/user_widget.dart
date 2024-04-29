import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/core/firebase/firebase.dart';
import 'package:stylish/core/utils/validation.dart';
import 'package:stylish/features/auth/registration/model/textfield_model.dart';
import 'package:stylish/features/auth/registration/view/component/textfield_widget.dart';
import 'package:stylish/features/dashboard/modules/users/controller/cubit/usercontroller_cubit.dart';

class UserItemWidget extends StatelessWidget {
  const UserItemWidget({
    super.key, //required this.userModel
  });
  // final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsercontrollerCubit>(
      create: (context) => UsercontrollerCubit(),
      child: BlocBuilder<UsercontrollerCubit, UsercontrollerState>(
        builder: (context, state) {
          final UsercontrollerCubit controller =
              context.read<UsercontrollerCubit>();
          return SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Edit Profile",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Stack(alignment: Alignment.bottomRight, children: [
                        controller.user.profilePicture == null
                            ? const CircleAvatar(
                                radius: 64,
                                backgroundImage: AssetImage(
                                    "assets/images/default_avatar.png"),
                              )
                            : CircleAvatar(
                                radius: 64,
                                backgroundImage:
                                    MemoryImage(FireBaseModel.instance.image!),
                              ),
                        InkWell(
                            onTap: controller.getImage,
                            child: const CircleAvatar(
                              radius: 20,
                              child: CircleAvatar(
                                  radius: 17,
                                  backgroundColor: Colors.green,
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 22,
                                  )),
                            ))
                      ]),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFieldWidget(
                      model: TextFieldModel(
                          // initialValue: controller.nameController.text==null?
                          // "Null":controller.nameController.text,
                          inputDecoration: Core.instance.userInputDecoration,
                          keyboardType: TextInputType.name,
                          controller: controller.nameController,
                          textInputAction: TextInputAction.next,
                          validator: Validation.instance.validateName,
                          textStyle: Core.instance.userTextStyle),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFieldWidget(
                      model: TextFieldModel(

                          //   initialValue: controller.emailController.text==null?
                          // "Null":controller.emailController.text,
                          inputDecoration: Core.instance.userInputDecoration
                              .copyWith(labelText: "Email"),
                          controller: controller.emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: Validation.instance.validateEmail,
                          textStyle: Core.instance.userTextStyle),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFieldWidget(
                        model: TextFieldModel(

                            // initialValue:  controller.passwordController.text==null?
                            // "Null":controller.passwordController.text,
                            keyboardType: TextInputType.visiblePassword,
                            controller: controller.passwordController,
                            textInputAction: TextInputAction.done,
                            inputDecoration:
                                Core.instance.userInputDecoration.copyWith(
                              labelText: "Password",
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
                            validator: Validation.instance.validatePassword,
                            textStyle: Core.instance.userTextStyle)),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Core.instance.coreButton(
                            buttonText: "    Cancel     ",context: context
                            ),
                        InkWell(
                          onTap: () => controller.saveUserRecord(context: context),
                          child: Core.instance.coreButton(
                              buttonText: "      Save       ",context: context),
                        ),
                      ],
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
