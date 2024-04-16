import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/features/auth/login/controller/logincontroller_cubit.dart';
import 'package:stylish/features/auth/login/view/components/login_body_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogincontrollerCubit>(
      create: (context) => LogincontrollerCubit(),
      child: BlocBuilder<LogincontrollerCubit, LogincontrollerState>(
        builder: (context, state) {
          final LogincontrollerCubit controller =LogincontrollerCubit();
          return Scaffold(
            body: LoginBodyWidget(name: name, controller:controller,),
          );
        },
      ),
    );
  }
}
