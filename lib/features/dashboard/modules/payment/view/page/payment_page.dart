import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/features/dashboard/modules/payment/view/components/payment_widget.dart';
import 'package:stylish/features/dashboard/modules/users/controller/cubit/usercontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/users/view/components/user_widget.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsercontrollerCubit>(
        create: (context) => UsercontrollerCubit(),
        child: BlocBuilder<UsercontrollerCubit, UsercontrollerState>(
          builder: (context, state) {
            final UsercontrollerCubit controller =
            context.read<UsercontrollerCubit>();
            return Scaffold(
              body: state is UserLoading
                  ? const Center(child:CircularProgressIndicator()):  const PaymentWidget(),
            );
          },
        ));
  }
}
