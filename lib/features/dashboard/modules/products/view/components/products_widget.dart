import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/features/dashboard/modules/home/view/components/home_top_item.dart';
import 'package:stylish/features/dashboard/modules/products/controller/cubit/productscontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/view/components/product_item_widget.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key, required this.controller});

  final ProductscontrollerCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductscontrollerCubit>.value(
      value: ProductscontrollerCubit(),
      child: BlocBuilder<ProductscontrollerCubit, ProductscontrollerState>(
        builder: (context, state) {
          return state is ProductscontrollerLoading
              ? const Center(child: CircularProgressIndicator())
              : state is ProductscontrollerEmpty
                  ? const Center(
                      child:Icon(CupertinoIcons.nosign),
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
                                child: HomeTopWidget(
                                  homeTitle: controller.homeTitle,
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
                                return ProductItemWidget(productModel: controller.products[index],controller: controller,);
                              }),
                            ),
                          ]),
                  );
        },
      ),
    );
  }
}
