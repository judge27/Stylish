import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/features/dashboard/controller/cubit/dashboardcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/home/controller/cubit/homecontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/home/view/components/home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key,required this.dashboardcontrollerCubit});
  final DashboardcontrollerCubit dashboardcontrollerCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomecontrollerCubit(),
      child: BlocBuilder<HomecontrollerCubit, HomecontrollerState>(
        builder: (context, state) {
          final HomecontrollerCubit controller =context.read<HomecontrollerCubit>();
          return Scaffold(
            backgroundColor: Theme
                .of(context)
                .scaffoldBackgroundColor,
            body: HomeWidgetItem(controller: controller,dashboardcontrollerCubit: dashboardcontrollerCubit,),
          );
        },
      ),
    );
  }
}
