import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/features/dashboard/modules/users/modules/paymentinfo/controller/cubit/paymenyinfo_cubit.dart';
import 'package:stylish/features/dashboard/modules/users/modules/paymentinfo/view/components/pament_info_widget.dart';

class PaymentInfoPage extends StatelessWidget {
  const PaymentInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymenyinfoCubit>.value(
      value: PaymenyinfoCubit.instance,
      child: BlocBuilder<PaymenyinfoCubit, PaymenyinfoState>(
        builder: (context, state) {
          final PaymenyinfoCubit cubit =context.read<PaymenyinfoCubit>();
          return Scaffold(
            backgroundColor: Theme
                .of(context)
                .scaffoldBackgroundColor,
            body:  PaymentInfoWidget(cubit: cubit,),
          );
        },
      ),
    );
  }
}
