import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/features/dashboard/controller/cubit/dashboardcontroller_cubit.dart';

class DashboardBottomWidegt extends StatelessWidget {
  const DashboardBottomWidegt({super.key,required this.controller});
  final DashboardcontrollerCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardcontrollerCubit>.value(
      value: controller,
      child: BlocBuilder<DashboardcontrollerCubit, DashboardcontrollerState>(
        builder: (context, state) {
         return BottomNavigationBar(

              backgroundColor: Colors.transparent,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.lightGreen,
              showSelectedLabels: false,
              onTap:controller.onChangePage,
             currentIndex: controller.pageIndex,
             items: const [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(CupertinoIcons.home,),
                ),
                BottomNavigationBarItem(
                  label: "Services",
                  icon: Icon(CupertinoIcons.airplane,),
                ),
                BottomNavigationBarItem(
                  label: "Products",
                  icon: Icon(CupertinoIcons.archivebox,),
                ),
                BottomNavigationBarItem(
                  label: "Profile",
                  icon: Icon(CupertinoIcons.profile_circled,),
                ),
              ]);
        },
      ),
    );
  }
}
