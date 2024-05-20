import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/languages/language_cubit.dart';
import 'package:stylish/core/models/enums/language.dart';
import 'package:stylish/core/models/enums/themestate.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/core/theme/apptheme_cubit.dart';
import 'package:stylish/features/dashboard/controller/cubit/dashboardcontroller_cubit.dart';
import 'package:stylish/features/dashboard/view/components/dashboard_body_widget.dart';
import 'package:stylish/features/dashboard/view/components/dashboard_bottom_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardcontrollerCubit>.value(
      value:  DashboardcontrollerCubit.instance,
      child: BlocBuilder<DashboardcontrollerCubit, DashboardcontrollerState>(
        builder: (context, state) {
          final DashboardcontrollerCubit controller=context.read<DashboardcontrollerCubit>();
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              centerTitle: true,
              title: Text(controller.pageIndex==0?AppLocalizations.of(context)!.home
                  :controller.pageIndex==1?AppLocalizations.of(context)!.products:
               controller.pageIndex==2?AppLocalizations.of(context)!.cart:
              AppLocalizations.of(context)!.settings),
              leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child:InkWell(
                    onTap: (){
                      if ( sharedPreferences!.getString('lang')=='en') {
                        BlocProvider.of<LanguageCubit>(context)
                            .chnageLanguage(Languages.ar);
                      } else {
                        BlocProvider.of<LanguageCubit>(context)
                            .chnageLanguage(Languages.en);
                      }
                    },
                    child: const Icon( CupertinoIcons.globe)),
              ),
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
                      padding: const EdgeInsets.only(right: 20,left: 20),
                      child:IconTheme(
                        data:  IconThemeData(
                            color:sharedPreferences!.getString('theme')=='light'? Colors.blue:Colors.white),
                        child:  const Icon(Icons.sunny),
                      ),
                    )
                ),

              ],
            ),
            body: DashboardBodyWidget(controller: controller,),
              floatingActionButton:user.admin==false||controller.pageIndex==3?
              const SizedBox():
              FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
              onPressed: (){context.pushTo=Routes.NEWProduct;},
              tooltip: 'Insert',
              child:   const Icon(Icons.add),
            ),
            bottomNavigationBar: DashboardBottomWidegt(controller: controller),
          );
        },
      ),
    );
  }
}
