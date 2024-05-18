import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';
import 'package:stylish/features/dashboard/modules/products/modules/productdetails/view/components/productdetails_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.productModel});
 final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading:   Padding(
        padding: const EdgeInsets.only(right: 20,left: 20),
        child:InkWell(
          onTap: (){
            context.pop;
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Theme.of(context).hintColor,
            ),
        ),
        ),
        actions: [
          InkWell(
              onTap: (){

              },
              child: const Padding(
                padding: EdgeInsets.only(right: 20,left: 20),
                child:  Icon(CupertinoIcons.shopping_cart),
              )
          )
        ],
      ),
      body: ProductDetailsWidget(productModel: productModel,),
    );
  }
}
