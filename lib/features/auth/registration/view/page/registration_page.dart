import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/features/auth/registration/controller/registrationcontroller_cubit.dart';
import 'package:stylish/features/auth/registration/view/component/registration_widget.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationcontrollerCubit>(
      create: (context) => RegistrationcontrollerCubit(),
      child: BlocBuilder<RegistrationcontrollerCubit, RegistrationcontrollerState>(
        builder: (context, state) {
          final RegistrationcontrollerCubit controller =RegistrationcontrollerCubit();
          return Scaffold(
            backgroundColor: const Color(0xFFFFFFFF).withOpacity(0.94),
            body:  RegistrationWidget(controller: controller,),
          );
        },
      ),
    );
  }
}




