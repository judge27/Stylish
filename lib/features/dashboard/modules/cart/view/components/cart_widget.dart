import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/const.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/features/dashboard/modules/cart/controller/cubit/cartcontroller_cubit.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key,required this.cubit});
  final CartcontrollerCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
    value:  cubit,
    child: BlocBuilder<CartcontrollerCubit, CartcontrollerState>(
  builder: (context, state) {
    return state is CartcontrollerLoading?
    const Center(child:CircularProgressIndicator()):
     state is CartcontrollerEmpty?
     const Center(child: Icon(CupertinoIcons.nosign),):
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: Text(
                      "Shopping List",
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                const SliverToBoxAdapter(
                  child:  SizedBox(
                    height: 20,
                  ),
                ),
                SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      childCount: cubit.products.length,
                      (context, index) {
                      return Dismissible(
                        onDismissed: (direction)async {
                          await cubit.addTOFav(cubit.products[index].id??"", 0, context);
                        },
                        key: UniqueKey(),
                        background: Container(
                          color: Colors.green,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(CupertinoIcons.delete,size: 25,),
                              Icon(CupertinoIcons.delete,size: 25,),
                            ],
                          ),
                        ),
                        child: Container(
                          width: context.width,
                          height: 200,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child:Image(image: NetworkImage(
                                        cubit.products[index].productImage??"",
                                    ),width: 130,
                                      height: 125,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                         Text(
                                           cubit.products[index].productName,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Variations : ",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              width: 39,
                                              height: 17,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(2),
                                                  border: Border.all(color: Colors.black)),
                                              alignment: Alignment.center,
                                              child: const Text(
                                                "Black",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              width: 39,
                                              height: 17,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(2),
                                                  border: Border.all(color: Colors.black)),
                                              alignment: Alignment.center,
                                              child: const Text(
                                                "Red",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "4.8",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            SizedBox(
                                                width: 80,
                                                height: 10,
                                                child: ListView.builder(
                                                    itemCount: 5,
                                                    scrollDirection: Axis.horizontal,
                                                    itemBuilder: (_, index) => const Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                      size: 14.5,
                                                    ))),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 84,
                                              height: 29,
                                              decoration: BoxDecoration(
                                                  border:
                                                  Border.all(color: const Color(0xFFCACACA))),
                                              alignment: Alignment.center,
                                              child:  Text(
                                                cubit.products[index].productCurrentPrice.toString(),
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                             cubit.products[index].isSale==1?
                                             Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'upto ${cubit.products[index].productSale.toString()}% off',
                                                  style: const TextStyle(
                                                      color: Color(0xFFEB3030),
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 14),
                                                ),
                                                Text(
                                                  '\$ ${cubit.products[index].productAcutalPrice.toString()}',
                                                  style: const TextStyle(
                                                      color: Color(0xFFA7A7A7),
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 14),
                                                )
                                              ],
                                            ):SizedBox()
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Divider(
                                indent: 10,
                                endIndent: 10,
                                thickness: 1.0,
                                color: Color(0xFFBBBBBB),
                              ),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                   Text("Total Order (${cubit.products[index].demandQuantity.toString()})   :",style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                  Text(
                                    "\$ ${cubit.products[index].productCurrentPrice.toString()}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),

                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    } ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisExtent: 200,
                      mainAxisSpacing: 6
                    )
                )
              ],
            ),
          );
  },
),
);
  }
}
