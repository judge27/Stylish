import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:stylish/features/dashboard/model/product_model.dart';
import 'package:stylish/features/dashboard/modules/home/controller/cubit/homecontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/home/view/page/home_page.dart';

import '../../../../../../const.dart';

class HomeProductItem extends StatelessWidget {
  const HomeProductItem(
      {super.key, required this.productItem,required this.itemScrollController,});
  final List<ProductModel> productItem;
  final ItemScrollController itemScrollController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 360,
        child: ScrollablePositionedList.builder(
          itemCount: productItem.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => Container(
            margin: const EdgeInsets.only(right: 15),
            child: Stack(alignment: Alignment.bottomCenter, children: [
              Center(
                child: Image.asset(
                  productItem[index].productImage!,
                  fit: BoxFit.cover,
                  width: 250,
                  height: 280,
                ),
              ),
              Container(
                width: 250,
                height: 110,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productItem[index].productName,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Text(
                        productItem[index].productDesc!,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis),
                      ),
                      productItem[index].isSale==1?SizedBox():SizedBox(height: 8,),
                      Text(
                        "\$${productItem[index].productCurrentPrice.toString()}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      productItem[index].isSale==1?
                      Row(
                        children: [
                          Text(
                            "\$${productItem[index].productAcutalPrice.toString()}",
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
                            "${productItem[index].productSale}%Off",
                            style: const TextStyle(
                                color: Color(0xFFFE735C),
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ):SizedBox(height: 6,),
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
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            (productItem[index].productAvailableQuantity!).toString(),
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
            ]),
          ),
          itemScrollController: itemScrollController,
        ));
  }
}

