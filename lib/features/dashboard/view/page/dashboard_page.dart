import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/models/enums/themestate.dart';
import 'package:stylish/core/theme/apptheme_cubit.dart';
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
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              centerTitle: true,
              title: Text(controller.pagesTitle[controller.pageIndex]),
              actions: [
                InkWell(
                    onTap: () {
                      if ( sharedPreferences!.getString('theme')=='light') {
                        BlocProvider.of<AppthemeCubit>(context)
                            .chnageTheme(ThemeState.Dark);
                      } else {
                        BlocProvider.of<AppthemeCubit>(context)
                            .chnageTheme(ThemeState.Light);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child:IconTheme(
                        data:  IconThemeData(
                            color:sharedPreferences!.getString('theme')=='light'? Colors.blue:Colors.white),
                        child:  const Icon(Icons.sunny),
                      ),
                    )
                )
              ],
            ),
            body: DashboardBodyWidget(controller: controller,),
            bottomNavigationBar: DashboardBottomWidegt(controller: controller),
          );
        },
      ),
    );
  }
}
