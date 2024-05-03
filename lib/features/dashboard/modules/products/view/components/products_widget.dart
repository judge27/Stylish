import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/features/dashboard/modules/home/view/components/home_top_item.dart';
import 'package:stylish/features/dashboard/modules/home/view/components/home_product_item.dart';
import 'package:stylish/features/dashboard/modules/products/controller/cubit/productscontroller_cubit.dart';

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
                      child: Icon(Icons.hourglass_empty),
                    )
                  : CustomScrollView(
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
                            ),
                            delegate: SliverChildBuilderDelegate(
                                childCount: controller.products.length,
                                (context, index) {
                              return ClipRRect(
                                child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Column(
                                      children: [
                                        Center(
                                          child: ClipRRect(
                                            child: Image.asset(
                                              controller.products[index]
                                                  .productImage!,
                                              fit: BoxFit.fill,
                                              width: 200,
                                              height: 120,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    topRight:
                                                        Radius.circular(8)),
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          height: 83,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(8),
                                                bottomRight:
                                                    Radius.circular(8)),
                                          ),
                                          alignment: Alignment.topLeft,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 9),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.products[index]
                                                      .productName,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                                Text(
                                                  controller.products[index]
                                                      .productDesc!,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                                Text(
                                                  "\$${controller.products[index].productCurrentPrice.toString()}",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 80,
                                                      height: 20,
                                                      child: ListView.builder(
                                                        itemCount: 5,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemBuilder:
                                                            (context, index) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color: Colors.amber,
                                                          size: 15,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      (controller
                                                              .products[index]
                                                              .productAvailableQuantity!)
                                                          .toString(),
                                                      style: const TextStyle(
                                                        color:
                                                            Color(0xFFA4A9B3),
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ]),
                                        )
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (controller.products[index]
                                            .favorite == 1) {
                                          controller.addTOFav(
                                              controller.products[index]
                                                  .id ?? 0,0);
                                        }
                                        else{
                                          controller.addTOFav(
                                              controller.products[index]
                                                  .id ?? 0,1);
                                        }
                                      },
                                      child:
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: controller.products[index]
                                                      .favorite ==
                                                  1
                                              ? const Icon(
                                                  CupertinoIcons.heart_fill,
                                                  color: Colors.redAccent,
                                                )
                                              : const Icon(
                                                  CupertinoIcons.heart,
                                                  color: Colors.redAccent,
                                                )),
                                    )
                                  ],
                                ),
                              );
                            }),
                          ),
                        ]);
        },
      ),
    );
  }
}

/*



 */
/*
 Container(
                            height: 360,
                            child: Stack(alignment: Alignment.bottomCenter, children: [
                              Center(
                                child: Image.asset(
                                  controller.products[index].productImage,
                                  fit: BoxFit.cover,
                                  width: 250,
                                  height: 280,
                                ),
                              ),
                              Container(
                                width: 250,
                                height: 81,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 8),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.products[index].productName,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      Text(
                                        controller.products[index].productTitle,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      Text(
                                        "\$${controller.products[index].productCurrentPrice.toString()}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 80,
                                            height: 20,
                                            child: ListView.builder(
                                              itemCount: 5,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 15,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            controller
                                                .products[index].productDemandNum,
                                            style: const TextStyle(
                                              color: Color(0xFFA4A9B3),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                              )
                                                  ],
                                                ),
                          );
 */
