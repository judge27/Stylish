import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/features/auth/verification/controller/verificationcontroller_cubit.dart';
import 'package:stylish/features/auth/verification/view/components/verification_widget.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key,required this.controller});
  final VerificationcontrollerCubit controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<VerificationcontrollerCubit>(
      create: (context) =>VerificationcontrollerCubit(),
      child: BlocBuilder<VerificationcontrollerCubit, VerificationcontrollerState>(
        builder: (context, state) {
          final VerificationcontrollerCubit controller=VerificationcontrollerCubit();
          return Scaffold(
            body: VerificationWidget(controller: controller,),
          );
        },
      ),
    );
  }
}
