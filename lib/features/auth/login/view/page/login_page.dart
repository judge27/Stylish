import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/languages/language_cubit.dart';
import 'package:stylish/core/models/enums/language.dart';
import 'package:stylish/core/models/enums/themestate.dart';
import 'package:stylish/core/theme/apptheme_cubit.dart';
import 'package:stylish/features/auth/login/controller/cubit/logincontroller_cubit.dart';
import 'package:stylish/features/auth/login/view/components/bottom_login_widget.dart';
import 'package:stylish/features/auth/login/view/components/login_body_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogincontrollerCubit>(
      create: (context) => LogincontrollerCubit(),
      child: BlocBuilder<LogincontrollerCubit, LogincontrollerState>(
        builder: (context, state) {
          final LogincontrollerCubit controller =
              context.read<LogincontrollerCubit>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              actions: [
                InkWell(
                  onTap: () {
                  if ( sharedPreferences!.getString('theme')=='dark') {
                    BlocProvider.of<AppthemeCubit>(context)
                        .chnageTheme(ThemeState.Light);
                    } else {
                    BlocProvider.of<AppthemeCubit>(context)
                        .chnageTheme(ThemeState.Dark);

                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:IconTheme(
                      data:  IconThemeData(
                          color:sharedPreferences!.getString('theme')=='light'? Colors.blue:Colors.white),
                      child:  const Icon(Icons.sunny),
                    ),
                  )
                ),
                InkWell(
                    onTap: () {
                      if ( sharedPreferences!.getString('lang')=='en') {
                        BlocProvider.of<LanguageCubit>(context)
                            .chnageLanguage(Languages.ar);
                      } else {
                        BlocProvider.of<LanguageCubit>(context)
                            .chnageLanguage(Languages.en);

                      }
                    },
                    child:  const Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20),
                      child:Icon(CupertinoIcons.globe),
                      ),
                )
              ],
            ),
            bottomNavigationBar: BottomLoginWidget(
              controller: controller,
            ),
            body: LoginBodyWidget(
              controller: controller,
            ),
          );
        },
      ),
    );
  }
}
