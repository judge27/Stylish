import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/themes/app_thme_cubit.dart';
import 'package:stylish/core/themes/themecontroller_cubit.dart';
import 'package:stylish/features/auth/login/controller/logincontroller_cubit.dart';
import 'package:stylish/features/auth/login/view/components/login_body_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogincontrollerCubit>(
      create: (context) => LogincontrollerCubit(),
      child: BlocBuilder<LogincontrollerCubit, LogincontrollerState>(
        builder: (context, state) {
          final LogincontrollerCubit controller =context.read<LogincontrollerCubit>();
          return Scaffold(
            appBar: AppBar(actions: [InkWell(child:Icon(Icons.wb_sunny),onTap: () => ThemecontrollerCubit().toggleTheme() ,) ]),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: LoginBodyWidget(controller:controller,),
          );
        },
      ),
    );
  }
}
