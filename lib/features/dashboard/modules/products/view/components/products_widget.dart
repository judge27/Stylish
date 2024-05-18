import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/features/dashboard/modules/home/view/components/home_top_item.dart';
import 'package:stylish/features/dashboard/modules/products/controller/cubit/productscontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/view/components/product_item_widget.dart';
import 'package:stylish/features/dashboard/modules/products/view/components/product_top_widget.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key, required this.controller});

  final ProductscontrollerCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductscontrollerCubit>.value(
      value: controller,
      child: BlocBuilder<ProductscontrollerCubit, ProductscontrollerState>(
        builder: (context, state) {
          return state is ProductscontrollerLoading
              ? const Center(child: CircularProgressIndicator())
              : state is ProductscontrollerEmpty
                  ? ProductTopWidget(
                    controller:controller
                  )
                  : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomScrollView(
                        physics: const BouncingScrollPhysics(),
                        slivers: [
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 15),
                                child: ProductTopWidget(
                                  controller:controller
                                ),
                              ),
                            ),
                            const SliverToBoxAdapter(
                              child: SizedBox(
                                height: 10,
                              ),
                            ),
                            SliverGrid(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 10,
                                mainAxisExtent: 305
                              ),
                              delegate: SliverChildBuilderDelegate(
                                  childCount: controller.products.length,
                                  (context, index) {
                                return InkWell(
                                  onTap: (){
                                    Navigator.pushNamed(context,
                                        Routes.PRODUCTDETAILS,
                                        arguments: controller.products[index]);
                                  },
                                  child: ProductItemWidget(
                                    productModel: controller.products[index],
                                    controller: controller,));
                              }),
                            ),
                          ]),
                  );
        },
      ),
    );
  }
}
