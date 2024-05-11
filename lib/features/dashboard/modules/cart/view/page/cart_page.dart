import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/features/dashboard/modules/cart/controller/cubit/cartcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/cart/view/components/cart_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartcontrollerCubit>.value(
      value: CartcontrollerCubit.instance,
      child: BlocBuilder<CartcontrollerCubit, CartcontrollerState>(
        builder: (context, state) {
          final CartcontrollerCubit cubit = context.read<CartcontrollerCubit>();
          return Scaffold(
            backgroundColor: Theme
                .of(context)
                .scaffoldBackgroundColor,
            body: CartWidget(cubit: cubit,),
          );
        },
      ),
    );
  }
}
