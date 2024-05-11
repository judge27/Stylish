import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/features/dashboard/modules/addproduct/controller/cubit/newproductcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/addproduct/view/components/new_product_widget.dart';

class NewProductPage extends StatelessWidget {
  const NewProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewproductcontrollerCubit>(
      create: (context)=>NewproductcontrollerCubit(),
      child: BlocBuilder<NewproductcontrollerCubit,NewproductcontrollerState>(
        builder: (context, state) {
          final NewproductcontrollerCubit cubit =context.read<NewproductcontrollerCubit>();
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
              backgroundColor: Theme
                  .of(context)
                  .scaffoldBackgroundColor,
              body: NewProductWidget(cubit:cubit,),
            ),
          );
        },
      ),
    );
  }
}
