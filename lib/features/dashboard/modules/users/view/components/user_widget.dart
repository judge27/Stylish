import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/core/utils/validation.dart';
import 'package:stylish/features/auth/registration/model/textfield_model.dart';
import 'package:stylish/features/auth/registration/view/component/textfield_widget.dart';
import 'package:stylish/features/dashboard/modules/users/controller/cubit/usercontroller_cubit.dart';


class UserItemWidget extends StatelessWidget {
  const UserItemWidget({
    Key? key, // Add Key parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsercontrollerCubit>(
      create: (context) => UsercontrollerCubit(),
      child: BlocBuilder<UsercontrollerCubit, UsercontrollerState>(
        builder: (context, state) {
          UsercontrollerCubit controller = context.read<UsercontrollerCubit>();
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                Padding(
                padding: EdgeInsets.only(top: 20, right : context.width/11), // Add padding above the first row
                child:
                    Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 32,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Profile",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              controller.user.profilePicture.toString(),
                            ),
                          ),
                          InkWell(
                            onTap: () => controller.getImageUrl(),
                            child: CircleAvatar(
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
                    SizedBox(
                      height: 30,
                    ),
                    Text("Personal Details", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).hintColor
                    ),),
                      SizedBox(
                        height: 15,
                      ),
                    TextFieldWidget(
                      model: TextFieldModel(
                        inputDecoration:
                        Core.instance.authInputDecoration(context).copyWith(labelText: "User Name",
                            labelStyle: TextStyle(color: Theme.of(context).hintColor , fontWeight: FontWeight.w600,
                            fontSize: 20) ),
                        keyboardType: TextInputType.name,
                        controller: controller.nameController,
                        textInputAction: TextInputAction.next,
                        validator: Validation.instance.validateName,
                        textStyle: Core.instance.userTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFieldWidget(
                      model: TextFieldModel(
                        inputDecoration:
                        Core.instance.authInputDecoration(context).copyWith(
                          prefixIcon: Icon(Icons.email)
                          ,labelText: "Email Address",labelStyle: TextStyle(color: Theme.of(context).hintColor ,
                            fontWeight: FontWeight.w600, fontSize: 20)
                        ),
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: Validation.instance.validateEmail,
                        textStyle: Core.instance.userTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFieldWidget(
                      model: TextFieldModel(
                        keyboardType: TextInputType.visiblePassword,
                        controller: controller.passwordController,
                        textInputAction: TextInputAction.done,
                        inputDecoration:
                        Core.instance.authInputDecoration(context).copyWith(
                          prefixIcon: Icon(Icons.lock),
                          labelText: "Password",
                          labelStyle: TextStyle(color: Theme.of(context).hintColor ,
                              fontWeight: FontWeight.w600, fontSize: 20),
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
                        textStyle: Core.instance.userTextStyle,
                      ),
                    ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Spacer() , Text("Change Password",
                            style: TextStyle (color: Theme.of(context).primaryColor ,
                                decoration: TextDecoration.underline
                            , fontSize: 15, fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                      ,
                    ///////////////////////////////////////////////////////////////////
                    SizedBox(
                      height: 20,
                    ),
                    Divider(thickness: 1,),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Bank Account Details", style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).hintColor
                      ),),
                      SizedBox(
                        height: 15,
                      ),
                      TextFieldWidget(
                        model: TextFieldModel(
                          inputDecoration:
                          Core.instance.authInputDecoration(context).copyWith(labelText: "Bank Account Number",
                              labelStyle: TextStyle(color: Theme.of(context).hintColor , fontWeight: FontWeight.w600,
                                  fontSize: 20) ),
                          keyboardType: TextInputType.name,
                          controller: controller.nameController,
                          textInputAction: TextInputAction.next,
                          validator: Validation.instance.validateName,
                          textStyle: Core.instance.userTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFieldWidget(
                        model: TextFieldModel(
                          inputDecoration:
                          Core.instance.authInputDecoration(context).copyWith(labelText: "Account Holder’s Name",
                              labelStyle: TextStyle(color: Theme.of(context).hintColor , fontWeight: FontWeight.w600,
                                  fontSize: 20) ),
                          keyboardType: TextInputType.name,
                          controller: controller.nameController,
                          textInputAction: TextInputAction.next,
                          validator: Validation.instance.validateName,
                          textStyle: Core.instance.userTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFieldWidget(
                        model: TextFieldModel(
                          inputDecoration:
                          Core.instance.authInputDecoration(context).copyWith(labelText: "IFSC Code",
                              labelStyle: TextStyle(color: Theme.of(context).hintColor , fontWeight: FontWeight.w600,
                                  fontSize: 20) ),
                          keyboardType: TextInputType.name,
                          controller: controller.nameController,
                          textInputAction: TextInputAction.next,
                          validator: Validation.instance.validateName,
                          textStyle: Core.instance.userTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: InkWell(
                          onTap: () {
                            controller.onSave(context: context);
                          },
                          child: Core.instance.coreButton(
                            buttonText: "Save",
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
