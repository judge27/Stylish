import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/features/dashboard/controller/cubit/dashboardcontroller_cubit.dart';
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
          final DashboardcontrollerCubit controller=context.read<DashboardcontrollerCubit>();
          return Scaffold(
            backgroundColor: Colors.lightGreen,
            appBar: AppBar(
              centerTitle: true,
              title: Text(controller.pagesTitle[controller.pageIndex]),
              actions: [
                Padding(padding: EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap:()=> context.pushTo=Routes.SIGN_UP,
                  child:Icon(CupertinoIcons.add,color: Colors.black,size: 30,),
                ),
                )
                ]
            ),
            body: DashboardBodyWidget(controller: controller,),
            bottomNavigationBar: DashboardBottomWidegt(controller: controller),
          );
        },
      ),
    );
  }
}
