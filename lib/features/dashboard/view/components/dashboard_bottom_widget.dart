import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/features/dashboard/controller/cubit/dashboardcontroller_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashboardBottomWidegt extends StatelessWidget {
  const DashboardBottomWidegt({super.key,required this.controller});
  final DashboardcontrollerCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardcontrollerCubit>.value(
      value: controller,
      child: BlocBuilder<DashboardcontrollerCubit, DashboardcontrollerState>(
        builder: (context, state) {
         return BottomNavyBar(

           selectedIndex: controller.pageIndex,
           onItemSelected: (index) {
             controller.onChangePage(index);
           },
           backgroundColor: Theme.of(context).scaffoldBackgroundColor,
           itemCornerRadius: 2,
           items: <BottomNavyBarItem>[
             BottomNavyBarItem(
                 title:  Text(AppLocalizations.of(context)!.home,style: TextStyle(
                   color: Theme.of(context).primaryColor,
                 ),),
                 icon:  Icon(CupertinoIcons.home,color: Theme.of(context).primaryColor,),
             ),
             BottomNavyBarItem(
                 title:  Text(AppLocalizations.of(context)!.products,style: TextStyle(
                   color: Theme.of(context).primaryColor,
                 ),),
                 icon:  Icon(CupertinoIcons.bag_fill,color: Theme.of(context).primaryColor,)
             ),
             BottomNavyBarItem(
                 title:  Text(AppLocalizations.of(context)!.cart,style: TextStyle(
                   color: Theme.of(context).primaryColor,
                 ),),
                 icon:  Icon(CupertinoIcons.cart,color: Theme.of(context).primaryColor,
             ),
            ),
             BottomNavyBarItem(
                 title:  Text(AppLocalizations.of(context)!.settings,style: TextStyle(
                   color: Theme.of(context).primaryColor,
                 ),),
                 icon:  Icon(CupertinoIcons.settings,color: Theme.of(context).primaryColor,)
             ),
           ],
         );
        },
      ),
    );
  }
}
