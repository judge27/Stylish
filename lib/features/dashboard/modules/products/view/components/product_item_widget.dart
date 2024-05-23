import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stylish/const.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/features/dashboard/modules/fav/controller/cubit/favoriteproduct_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/controller/cubit/productscontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';
import 'package:stylish/features/dashboard/modules/products/model/repo/firebase_products_data.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/firebase_users_data.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key,required this.productModel,this.controller});
 final ProductModel productModel;
  final ProductscontrollerCubit? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Hero(
              tag: productModel.productName,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                    Radius.circular(8)),
                child: connected?
                Image.network(productModel.productImage!, fit: BoxFit.cover,
                height: 196,
                width: double.infinity,
              ):
              Image.memory(productModel.image??Uint8List(1),fit: BoxFit.cover,
                height: 196,
                width: double.infinity,)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8.0),
              child: SizedBox(
                child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: context.height/191.5,),
                      SizedBox(
                        height: 20,
                        child: Text(
                          productModel
                              .productName,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight:
                              FontWeight.w500,
                              overflow: TextOverflow
                                  .ellipsis),
                        ),
                      ),
                      SizedBox(
                        height: context.height/191.5,),
                      SizedBox(
                        height: 22,
                        child: Text(
                          productModel
                              .productDesc!,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight:
                              FontWeight.w400,
                              overflow: TextOverflow
                                  .ellipsis),
                        ),),
                      SizedBox(
                        height: 0,),
                      Row(
                        children: [
                          SizedBox(
                            height: 15,
                            child: Text(
                              "\$${productModel.productCurrentPrice
                                  .toString()}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              if (productModel
                                  .favorite ==
                                  1) {
                                controller!.addTOFav(
                                    productModel.id ??"",
                                    0,
                                    context);
                              } else {
                                controller!.addTOFav(
                                    productModel
                                        .id ??"",
                                    1,
                                    context);
                              }
                            },
                            child: productModel
                                .favorite ==
                                1
                                ? const Icon(
                              CupertinoIcons.heart_fill,
                              color: Colors.redAccent,
                            )
                                : const Icon(
                              CupertinoIcons.heart,
                              color: Colors.redAccent,
                            ),
                          ),
                          user.admin==true?SizedBox(width: 15,):SizedBox(),
                          user.admin==true?
                          InkWell(
                            onTap: ()async {
                               controller!.onDelete(productModel.id??"");
                            },
                            child: const Icon(
                              CupertinoIcons.delete,
                              color: Colors.redAccent,
                            ),
                          ):SizedBox(),
                        ],
                      ),
                      productModel.isSale==1?
                      Row(
                        children: [
                          Text(
                            "\$${productModel.productAcutalPrice.toString()}",
                            style: const TextStyle(
                                color: Color(0xFF808488),
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${productModel.productSale}%Off",
                            style: const TextStyle(
                                color: Color(0xFFFE735C),
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ):
                      SizedBox(
                        height:5,),
                      SizedBox(
                        height: 14,
                        child: Row(
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
                              (productModel
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
                      ),

                    ]),
              ),
            ),

          ],
        ));
  }
}
