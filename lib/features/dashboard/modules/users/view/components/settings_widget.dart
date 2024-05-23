import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/firebase/firebase.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/features/dashboard/controller/cubit/dashboardcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/users/controller/cubit/usercontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/users/modules/profile/controller/cubit/profilecontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/users/view/components/settings_items.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                  child: Text(AppLocalizations.of(context)!.account, style: TextStyle(
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
                              buttonText: AppLocalizations.of(context)!.editprofile,
                              context: context
                            )
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: context.height/48,),
              SettingsItems(iconData: CupertinoIcons.heart_fill, pageName: AppLocalizations.of(context)!.favproducts,onTap: (){
                context.pushTo=Routes.FavProduct;
              },),
              SizedBox(height: context.height/86,),
              SettingsItems(iconData: Icons.lock, pageName: AppLocalizations.of(context)!.changePassword,onTap: (){
                context.pushTo=Routes.CHANGEPASSWORD;
              },),
              SizedBox(height: context.height/86,),
              SettingsItems(iconData: Icons.list_rounded, pageName: AppLocalizations.of(context)!.myOrders,onTap: (){
                DashboardcontrollerCubit.instance.onChangePage(2);
              },),
              SizedBox(height: context.height/86,),
              SettingsItems(iconData: CupertinoIcons.creditcard, pageName: AppLocalizations.of(context)!.paymentcard,onTap: (){
                context.pushTo=Routes.PAYMENT;
              },),
              SizedBox(height: context.height/86,),
              SettingsItems(iconData: Icons.headset_mic_outlined, pageName: AppLocalizations.of(context)!.customersupport),
              SizedBox(height: context.height/86,),
              SettingsItems(iconData: CupertinoIcons.star, pageName: AppLocalizations.of(context)!.rateourapplication,onTap: (){context.pushTo=Routes.RATEOURAPP;}),
              SizedBox(height: context.height/32,),
              SettingsItems(iconData: Icons.logout, pageName: AppLocalizations.of(context)!.logout,onTap: (){
                FireBaseModel.instance.onSignout(context: context);
              },),
            ],
          );
        },
      ),
    );
  }
}
