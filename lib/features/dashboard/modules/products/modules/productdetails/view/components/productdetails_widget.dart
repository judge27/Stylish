import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';
import 'package:stylish/features/dashboard/modules/products/modules/productdetails/controller/cubit/productdetails_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/modules/productdetails/view/components/similaritems_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({super.key, required this.productModel, required this.cubit});
  final ProductModel productModel;
  final ProductdetailsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductdetailsCubit, ProductdetailsState>(
      builder: (context, state) {
        ProductModel currentProduct = productModel;

        if (state is ProductdetailsUpdated) {
          currentProduct = state.updatedProduct;
        }

        return SizedBox(
          width: context.width,
          height: context.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: currentProduct.productName,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(14)),
                      child: currentProduct.productImage != null
                          ? Image.network(
                        currentProduct.productImage!,
                        fit: BoxFit.cover,
                        height: 320,
                        width: double.infinity,
                      )
                          : Image.memory(
                        currentProduct.image ?? Uint8List(1),
                        fit: BoxFit.cover,
                        height: 320,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    currentProduct.productName,
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "${AppLocalizations.of(context)!.productcategory} : ${currentProduct.productCategory}",
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
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
                      const SizedBox(width: 5),
                      Text(
                        (currentProduct.productAvailableQuantity!).toString(),
                        style: const TextStyle(
                          color: Color(0xFFA4A9B3),
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      if (currentProduct.isSale == 1) ...[
                        Text(
                          "\$${currentProduct.productAcutalPrice}",
                          style: const TextStyle(
                            color: Color(0xFF808488),
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 5),
                      ],
                      Text(
                        "\$${currentProduct.productCurrentPrice}",
                        style: const TextStyle(
                          color: Color(0xFF808488),
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 5),
                      if (currentProduct.isSale == 1)
                        Text(
                          "${currentProduct.productSale}% ${AppLocalizations.of(context)!.off}",
                          style: const TextStyle(
                            color: Color(0xFFFE735C),
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppLocalizations.of(context)!.productdetails,
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 60,
                    width: context.width,
                    child: Text(
                      currentProduct.productDesc!,
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          cubit.addTOCart(currentProduct.id ?? "", 1, context);
                        },
                        child: Container(
                          width: 150,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: Color(0xFF3F92FF),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(4),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(4),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: const Color(0xFF0B3689).withOpacity(0.6),
                                child: const Center(
                                  child: Icon(
                                    CupertinoIcons.cart,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                               Spacer(),
                               Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Text(
                                  AppLocalizations.of(context)!.goTocart,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context,Routes.SHOPPINGBAG,arguments: currentProduct);
                        },
                        child: Container(
                          width: 136,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: Color(0xFF71F9A9),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(4),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(4),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: const Color(0xFF31B769).withOpacity(0.6),
                                child: const Center(
                                  child: Icon(
                                    Icons.ads_click,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Spacer(),
                               Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: Text(
                                  AppLocalizations.of(context)!.buynow,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    AppLocalizations.of(context)!.similarTO,
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        "${cubit.products.length} ${AppLocalizations.of(context)!.items}",
                        style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
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
                  const SizedBox(height: 15),
                  BlocBuilder<ProductdetailsCubit, ProductdetailsState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: 300,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                cubit.updateProductDetails(cubit.products[index]);
                              },
                              child: SimilarItemsWidget(
                                productModel: cubit.products[index],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 10);
                          },
                          itemCount: cubit.products.length,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 18),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
