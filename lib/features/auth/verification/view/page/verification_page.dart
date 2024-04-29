import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/features/auth/phonenumber/controller/cubit/phonenumbercontroller_cubit.dart';
import 'package:stylish/features/auth/verification/controller/cubit/verificationcontroller_cubit.dart';
import 'package:stylish/features/auth/verification/view/components/verification_widget.dart';

class VerificationPage extends StatelessWidget {
  VerificationPage({
    super.key,
   required this.controller
  });
  final PhonenumbercontrollerCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhonenumbercontrollerCubit>.value(
        value: controller,
        child:
            BlocBuilder<PhonenumbercontrollerCubit, PhonenumbercontrollerState>(
                builder: (context, state) {
          return Scaffold(
            body: VerificationWidget(
                controller2: controller,
            ),
          );
        }));
  }
}
