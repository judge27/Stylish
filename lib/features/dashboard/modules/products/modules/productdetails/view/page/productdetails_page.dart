import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/features/dashboard/controller/cubit/dashboardcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/cart/controller/cubit/cartcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';
import 'package:stylish/features/dashboard/modules/products/modules/productdetails/controller/cubit/productdetails_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/modules/productdetails/view/components/productdetails_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductdetailsCubit>(
      create: (context) => ProductdetailsCubit(),
      child: BlocBuilder<ProductdetailsCubit, ProductdetailsState>(
        builder: (context, state) {
          ProductdetailsCubit cubit = context.read<ProductdetailsCubit>();

          return Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              appBar: AppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                leading: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 25,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ),
                actions: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      InkWell(
                        onTap: () {
                          DashboardcontrollerCubit.instance.onChangePage(2);
                          Navigator.of(context).pop();
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 25),
                          child: Icon(CupertinoIcons.shopping_cart, size: 35),
                        ),
                      ),
                      CartcontrollerCubit.instance.products.length != 0
                          ? Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          radius: 9,
                          child: Text(
                            CartcontrollerCubit.instance.products.length.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                          : const SizedBox()
                    ],
                  )
                ],
              ),
              body: ProductDetailsWidget(
                productModel: productModel,
                cubit: cubit,
              ),
            ),
          );
        },
      ),
    );
  }
}