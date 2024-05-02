import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/features/dashboard/controller/cubit/dashboardcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/home/view/page/home_page.dart';
import 'package:stylish/features/dashboard/modules/users/view/page/user_page.dart';

class DashboardBodyWidget extends StatelessWidget {
  const DashboardBodyWidget({super.key,required this.controller});
 final DashboardcontrollerCubit controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardcontrollerCubit>.value(
      value: controller,
      child: BlocBuilder<DashboardcontrollerCubit, DashboardcontrollerState>(
        builder: (context, state) {
          return PageView(
            controller:controller.pageController,
            onPageChanged:controller.onChangePage,
            children:  const [
             HomePage(),
              Center(child:Text("Service",style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.w700
              ),) ,),
              Center(child:Text("Products",style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.w700
              ),) ,),
              UserPage(),
            ],
          );
        },
      ),
    );
  }
}
