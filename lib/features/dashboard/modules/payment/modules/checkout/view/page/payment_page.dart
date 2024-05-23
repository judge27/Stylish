import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/features/dashboard/modules/payment/controller/cubit/paymentcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/payment/modules/checkout/view/components/payment_widget.dart';
import 'package:stylish/features/dashboard/modules/users/controller/cubit/usercontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/users/modules/profile/controller/cubit/profilecontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/users/view/components/user_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaymentPage extends StatelessWidget {
   PaymentPage({super.key, required this.cubit});

   PaymentcontrollerCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentcontrollerCubit>.value(
      value: PaymentcontrollerCubit.instance,
      child: BlocBuilder<PaymentcontrollerCubit, PaymentcontrollerState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              leading: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: InkWell(
                  onTap: () {
                    context.pop;
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ),
              title: Text(
                AppLocalizations.of(context)!.checkout,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Theme.of(context).hintColor),
              ),
              centerTitle: true,
            ),
            body: PaymentWidget(
              cubit: cubit,
            ),
          );
        },
      ),
    );
  }
}
