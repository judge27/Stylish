import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/features/dashboard/modules/addproduct/controller/cubit/newproductcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/addproduct/model/new_product_textfield_model.dart';
import 'package:stylish/features/dashboard/modules/addproduct/view/components/new_product_textfield_widget.dart';
import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';
import 'package:stylish/features/dashboard/modules/products/view/components/product_item_widget.dart';

class NewProductWidget extends StatelessWidget {
  const NewProductWidget({super.key, required this.cubit});

  final NewproductcontrollerCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewproductcontrollerCubit>.value(
      value: cubit,
      child: BlocBuilder<NewproductcontrollerCubit,NewproductcontrollerState>(
        builder: (context,state) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 18),
            child: SingleChildScrollView(
              child: SizedBox(
                width: context.width,
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    children: [

                      SizedBox(height: 15,),
                      NewProductTextFieldWidget(newProductTextFieldModel: NewProductTextFieldModel(
                        textEditingController: cubit.productName,
                        textInputType: TextInputType.name,
                        inputDecoration: Core.instance.authInputDecoration(context).copyWith(
                          hintText: "Product Name",
                            prefixIcon: Icon(CupertinoIcons.shopping_cart)

                        ),
                      )),
                      SizedBox(height: 15,),
                      NewProductTextFieldWidget(newProductTextFieldModel: NewProductTextFieldModel(
                        textEditingController: cubit.productCategory,
                        textInputType: TextInputType.name,
                        inputDecoration: Core.instance.authInputDecoration(context).copyWith(
                          hintText: "Product Category",
                            prefixIcon: Icon(CupertinoIcons.tag)

                        ),
                      )),
                      SizedBox(height: 15,),
                      NewProductTextFieldWidget(newProductTextFieldModel: NewProductTextFieldModel(
                        textEditingController: cubit.productDesc,
                        textInputType: TextInputType.name,
                        inputDecoration: Core.instance.authInputDecoration(context).copyWith(
                          hintText: "Product Description",
                            prefixIcon: Icon(CupertinoIcons.decrease_indent)
                        ),
                      )),

                      SizedBox(height: 15,),
                      NewProductTextFieldWidget(newProductTextFieldModel: NewProductTextFieldModel(
                        textEditingController: cubit.productAcutalPrice,
                        textInputType: TextInputType.number,
                        inputDecoration: Core.instance.authInputDecoration(context).copyWith(
                          hintText: "Product Actual Price",
                          prefixIcon: Icon(Icons.price_check)
                        ),
                      )),
                      SizedBox(height: 15,),
                      NewProductTextFieldWidget(newProductTextFieldModel: NewProductTextFieldModel(
                        textEditingController: cubit.productSale,
                        textInputType: TextInputType.number,
                        inputDecoration: Core.instance.authInputDecoration(context).copyWith(
                          hintText: "Product Sale",
                            prefixIcon: Icon(CupertinoIcons.number)
                        ),
                      )),
                      SizedBox(height: 15,),
                      NewProductTextFieldWidget(newProductTextFieldModel: NewProductTextFieldModel(
                        textEditingController: cubit.productCurrentPrice,
                        textInputType: TextInputType.number,
                        inputDecoration: Core.instance.authInputDecoration(context).copyWith(
                            hintText: "Product Current Price",
                            prefixIcon: Icon(Icons.price_check)
                        ),
                      )),SizedBox(height: 15,),
                      NewProductTextFieldWidget(newProductTextFieldModel: NewProductTextFieldModel(
                        textEditingController: cubit.productAvailableQuantity,
                        textInputType: TextInputType.number,
                        inputDecoration: Core.instance.authInputDecoration(context).copyWith(
                          hintText: "Product Available Quantity",
                            prefixIcon: Icon(CupertinoIcons.bag_fill)

                        ),
                      )),
                      SizedBox(height: 20,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                              onTap: (){
                                cubit.uploadImageToStorage(ImageSource.camera);

                              },
                              child: Icon(CupertinoIcons.camera,size: 30,)),
                          InkWell(
                              onTap: (){
                                cubit.uploadImageToStorage(ImageSource.gallery);
                              },
                              child: Icon(CupertinoIcons.photo,size: 30,))
                        ],
                      ),


                      SizedBox(height: 20,),
                      Center(
                        child: InkWell(
                            onTap: (){
                              cubit.addNewProduct(context: context);
                            },
                            child: Core.instance.coreButton(buttonText: "Add Product", context: context)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
