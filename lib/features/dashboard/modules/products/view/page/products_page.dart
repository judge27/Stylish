import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/features/dashboard/controller/cubit/dashboardcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/controller/cubit/productscontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/view/components/products_widget.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key,});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductscontrollerCubit>.value(
      value: ProductscontrollerCubit.instance,
      child: BlocBuilder<ProductscontrollerCubit, ProductscontrollerState>(
        builder: (context, state) {
          final ProductscontrollerCubit controller =context.read<ProductscontrollerCubit>();
          return Scaffold(
            backgroundColor: Theme
                .of(context)
                .scaffoldBackgroundColor,
            body: ProductsWidget(controller: controller,),

          );
        },
      ),
    );
  }
}
