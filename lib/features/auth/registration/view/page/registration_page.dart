import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/features/auth/registration/controller/cubit/registrationcontroller_cubit.dart';
import 'package:stylish/features/auth/registration/view/component/bottom_registration_widget.dart';
import 'package:stylish/features/auth/registration/view/component/registration_widget.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationcontrollerCubit>(
      create: (context) => RegistrationcontrollerCubit(),
      child:
          BlocBuilder<RegistrationcontrollerCubit, RegistrationcontrollerState>(
        builder: (context, state) {
          final RegistrationcontrollerCubit controller =context.read<RegistrationcontrollerCubit>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            bottomNavigationBar: BottomRegistrationWidget(controller: controller,),
            body: RegistrationWidget(
              controller: controller,
            ),
          );
        },
      ),
    );
  }
}
