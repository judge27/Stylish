import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';
import 'package:stylish/features/dashboard/modules/products/modules/productdetails/controller/cubit/productdetails_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stylish/features/dashboard/modules/products/modules/productdetails/view/components/similaritems_widget.dart';
import 'package:stylish/features/dashboard/modules/products/view/components/product_item_widget.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/firebase_users_data.dart';

class ProductDetailsWidget extends StatelessWidget {
  ProductDetailsWidget({super.key, required this.productModel});
  ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductdetailsCubit(),
      child: BlocBuilder<ProductdetailsCubit, ProductdetailsState>(
        builder: (context, state) {
          final ProductdetailsCubit cubit = context.read<ProductdetailsCubit>();
          cubit.productCategory = productModel.productCategory;
          return  SizedBox(
            width: context.width,
            height: context.height,
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: productModel.productName,
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(14)),
                          child: connected
                              ? Image.network(
                                  productModel.productImage!,
                                  fit: BoxFit.cover,
                                  height: 235,
                                  width: double.infinity,
                                )
                              : Image.memory(
                                  productModel.image ?? Uint8List(1),
                                  fit: BoxFit.cover,
                                  height: 235,
                                  width: double.infinity,
                                )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      productModel.productName,
                      style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Product Category : ${productModel.productCategory}",
                      style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 14,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80,
                            height: 20,
                            child: ListView.builder(
                              itemCount: 5,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => const Icon(
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
                            (productModel.productAvailableQuantity!).toString(),
                            style: const TextStyle(
                              color: Color(0xFFA4A9B3),
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        productModel.isSale == 1
                            ? Text(
                                "\$${productModel.productAcutalPrice.toString()}",
                                style: const TextStyle(
                                    color: Color(0xFF808488),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.lineThrough),
                              )
                            : const SizedBox(),
                        productModel.isSale == 1
                            ? const SizedBox(
                                width: 5,
                              )
                            : const SizedBox(),
                        Text(
                          "\$${productModel.productCurrentPrice.toString()}",
                          style: const TextStyle(
                            color: Color(0xFF808488),
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        productModel.isSale == 1
                            ? Text(
                                "${productModel.productSale}%Off",
                                style: const TextStyle(
                                  color: Color(0xFFFE735C),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Product Details",
                      style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      height: 60,
                      width: context.width,
                      child: Text(
                        productModel.productDesc!,
                        style: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                        onTap: ()async{
                            cubit.addTOCart(productModel.id??"",productModel.demandQuantity!+1,context);
                        },
                          child: Container(
                            width: 136,
                            height: 36,
                            decoration: const BoxDecoration(
                                color: Color(0xFF3F92FF),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(4),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(4),
                                )),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 18,
                                  backgroundColor:
                                      const Color(0xFF0B3689).withOpacity(0.6),
                                  child: const Center(
                                    child: Icon(
                                      CupertinoIcons.cart,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                const Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    "Go to cart",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 136,
                          height: 36,
                          decoration: const BoxDecoration(
                              color: Color(0xFF71F9A9),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(4),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(4),
                              )),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor:
                                    const Color(0xFF31B769).withOpacity(0.6),
                                child: const Center(
                                  child: Icon(
                                    Icons.ads_click,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              const Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: Text(
                                  "Buy Now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Similar To",
                      style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Text(
                          "${cubit.products.length} ${AppLocalizations.of(context)!.items}",
                          style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            cubit.sortProducts();
                          },
                          child: Container(
                            width: 70,
                            height: 30,
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.sort,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_upward_rounded,
                                  size: 14,
                                  color: Colors.black,
                                ),
                                const Icon(
                                  Icons.arrow_downward_rounded,
                                  size: 14,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: context.width / 20,
                        ),
                        Container(
                            width: 89,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: DropdownButton(
                                    underline: const SizedBox(),
                                    items: cubit.cateogriesFilter.map((String item) {
                                      return DropdownMenuItem(
                                        value: item,
                                        child: Center(
                                          child: Text(item),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      cubit.filterProducts(value!);
                                    },
                                    value: cubit.filterCategory,
                                    dropdownColor: Colors.white,
                                    iconSize: 0,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ),
                                const Icon(
                                  Icons.filter_alt_outlined,
                                  size: 17,
                                  color: Colors.black,
                                ),
                              ],
                            )),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    SizedBox(height: 300,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                        return InkWell(
                            onTap: (){
                              productModel=cubit.products[index];
                              cubit.onClickItem();
                            },
                            child: SimilarItemsWidget(
                              productModel: cubit.products[index],
                            ));
                      }, separatorBuilder:(context, index){
                          return const SizedBox(width: 10,);
                          },
                          itemCount: cubit.products.length),
                    ),
                    SizedBox(height: 18,)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
