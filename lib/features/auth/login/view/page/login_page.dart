import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/models/enums/themestate.dart';
import 'package:stylish/core/theme/themes.dart';
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
                    if (AppthemeCubit.isLight) {
                      BlocProvider.of<AppthemeCubit>(context)
                          .chnageTheme(ThemeState.Light);
                    } else {
                      BlocProvider.of<AppthemeCubit>(context)
                          .chnageTheme(ThemeState.Dark);
                    }
                  },
                  child: const Icon(
                    Icons.wb_sunny,
                    size: 30,
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
