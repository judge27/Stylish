import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/features/dashboard/controller/dashboardcontroller_cubit.dart';
import 'package:stylish/features/dashboard/view/components/dashboard_body_widget.dart';
import 'package:stylish/features/dashboard/view/components/dashboard_bottom_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardcontrollerCubit>(
      create: (context) => DashboardcontrollerCubit(),
      child: BlocBuilder<DashboardcontrollerCubit, DashboardcontrollerState>(
        builder: (context, state) {
          final DashboardcontrollerCubit controller=DashboardcontrollerCubit();
          return Scaffold(
            backgroundColor: Colors.lightGreen,
            body: DashboardBodyWidget(controller: controller,),
            bottomNavigationBar: DashboardBottomWidegt(controller: controller),
          );
        },
      ),
    );
  }
}
