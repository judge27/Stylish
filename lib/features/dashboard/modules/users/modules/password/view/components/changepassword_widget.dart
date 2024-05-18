import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/models/textfield_model.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/core/utils/validation.dart';
import 'package:stylish/features/auth/registration/view/component/textfield_widget.dart';
import 'package:stylish/features/dashboard/modules/users/modules/password/controller/cubit/changepassword_cubit.dart';

class ChangePasswordWidget extends StatelessWidget {
  const ChangePasswordWidget({super.key,required this.cubit});
  final ChangepasswordCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangepasswordCubit>.value(
      value:  cubit,
      child: BlocBuilder<ChangepasswordCubit, ChangepasswordState>(
        builder: (context, state) {
          return SizedBox(
            height: context.height / 2,
            child: Form(
              key: cubit.formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.height/20,),
                    SizedBox(
                      height: context.height / 20,
                      child: Text("Change Password", style: TextStyle(
                          color: Theme
                              .of(context)
                              .hintColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w700
                      ),),
                    ),
                    SizedBox(height: context.height / 30,),
                    SizedBox(
                      height: context.height/10,
                      child: TextFieldWidget(model: TextFieldModel(
                        inputDecoration: Core.instance.authInputDecoration(context)
                            .copyWith(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: InkWell(
                              onTap: (){
                                cubit.toggleCurrentPassword();
                              },
                              child: Icon(cubit.obscureCurrentPassword? CupertinoIcons.eye_slash_fill
                                  : CupertinoIcons.eye_fill,
                              color: Colors.black54,
                              size: 24,),
                          ),
                          hintText: "Current Password",
                        ),
                        validator: (value){
                          Validation.instance.validatePassword(context: context,value: value);
                        },
                        controller: cubit.currentPasswordController,
                        obscureText: cubit.obscureCurrentPassword,
                        textStyle: Core.instance.authTextStyle,
                        keyboardType: TextInputType.visiblePassword,
                      )),
                    ),
                    SizedBox(height: context.height/30,),
                    SizedBox(
                      height: context.height/10,
                      child: TextFieldWidget(model: TextFieldModel(
                        inputDecoration: Core.instance.authInputDecoration(context)
                            .copyWith(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: InkWell(
                            onTap: (){
                              cubit.toggleNewPassword();
                            },
                            child: Icon(cubit.obscureNewPassword? CupertinoIcons.eye_slash_fill
                                : CupertinoIcons.eye_fill,
                              color: Colors.black54,
                              size: 24,),
                          ),
                          hintText: "New Password",
                        ),
                        validator: (value){
                          Validation.instance.validatePassword(context: context,value: value);
                        },
                        controller: cubit.newPasswordController,
                        obscureText: cubit.obscureNewPassword,
                        textStyle: Core.instance.authTextStyle,
                        keyboardType: TextInputType.visiblePassword,
                      )),
                    ),
                    SizedBox(height: context.height/30,),
                    SizedBox(
                      height: context.height/10,
                      child: TextFieldWidget(model: TextFieldModel(
                        inputDecoration: Core.instance.authInputDecoration(context)
                            .copyWith(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: InkWell(
                            onTap: (){
                              cubit.toggleRepeatNewPassword();
                            },
                            child: Icon(cubit.obscureRepeatNewPassword? CupertinoIcons.eye_slash_fill
                                : CupertinoIcons.eye_fill,
                              color: Colors.black54,
                              size: 24,),
                          ),
                          hintText: "Repeat New Password",
                        ),
                        validator: (value){
                          Validation.instance.validatePassword(context: context,value: value);
                          if(cubit.newPasswordController.text!=cubit.repeatNewPasswordController.text){
                            return "The New password should matches each other ";
                          }
                        },
                        controller: cubit.repeatNewPasswordController,
                        obscureText: cubit.obscureRepeatNewPassword,
                        textStyle: Core.instance.authTextStyle,
                        keyboardType: TextInputType.visiblePassword,
                      )),
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
