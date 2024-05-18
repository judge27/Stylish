import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/firebase/firebase.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/features/dashboard/modules/users/controller/cubit/usercontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/users/modules/profile/controller/cubit/profilecontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/users/view/components/settings_items.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key,required this.cubit});
  final ProfilecontrollerCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfilecontrollerCubit>.value(
      value: cubit,
      child: BlocBuilder<ProfilecontrollerCubit, ProfilecontrollerState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: context.height/16,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text("Account", style: TextStyle(
                      color: Theme
                          .of(context)
                          .hintColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 28
                  ),),
                ),
              ),
              SizedBox(height: context.height/32,),
              SizedBox(
                height: context.height/8,
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
                            NetworkImage(cubit.profileImage??"")
                        ),
                      ],
                    ),
                    SizedBox(width: 32,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: context.height/32,
                          child: Text(cubit.nameController.text,style: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w800
                          ),),
                        ),
                        SizedBox(height: context.height/128,),
                        SizedBox(
                          height: context.height/32,
                          child: Text(cubit.emailController.text,style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w800
                          ),),
                        ),
                        SizedBox(height: context.height/128,),
                        InkWell(
                          onTap: (){
                            context.pushTo=Routes.PROFILE;                          },
                          child: Core.instance.coreButton(
                              height: context.height/30,
                              buttonText: "   Edit Profile    ",
                              context: context
                            )
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: context.height/48,),
              SettingsItems(iconData: Icons.store_mall_directory, pageName: "Shop Profile"),
              SizedBox(height: context.height/86,),
              SettingsItems(iconData: Icons.lock, pageName: "Change Password",onTap: (){
                context.pushTo=Routes.CHANGEPASSWORD;
              },),
              SizedBox(height: context.height/86,),
              SettingsItems(iconData: Icons.list_rounded, pageName: "My Orders",onTap: (){
                context.pushTo=Routes.CHANGEPHONENUMBER;
              },),
              SizedBox(height: context.height/86,),
              SettingsItems(iconData: Icons.mail_rounded, pageName: "Invite Friends"),
              SizedBox(height: context.height/86,),

              SettingsItems(iconData: Icons.headset_mic_outlined, pageName: "Customer Support"),
              SizedBox(height: context.height/86,),
              SettingsItems(iconData: CupertinoIcons.star, pageName: "Rate Our Application"),
              SizedBox(height: context.height/32,),
              SettingsItems(iconData: Icons.logout, pageName: "Logout",onTap: (){
                FireBaseModel.instance.onSignout(context: context);
              },),
            ],
          );
        },
      ),
    );
  }
}
