import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/features/dashboard/modules/products/controller/cubit/productscontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/model/repo/database_product_data.dart';
import 'package:stylish/features/dashboard/modules/products/model/repo/firebase_products_data.dart';

part 'newproductcontroller_state.dart';

class NewproductcontrollerCubit extends Cubit<NewproductcontrollerState> {
  static NewproductcontrollerCubit instance = NewproductcontrollerCubit();
  NewproductcontrollerCubit() : super(NewproductcontrollerInitial());

  XFile? image;
  GlobalKey<FormState> formKey =GlobalKey();
  TextEditingController productName= TextEditingController();
  TextEditingController productDesc= TextEditingController();
  TextEditingController productAcutalPrice= TextEditingController();
  TextEditingController productCurrentPrice= TextEditingController();
  TextEditingController productSale= TextEditingController();
  TextEditingController productAvailableQuantity= TextEditingController();
  TextEditingController productCategory= TextEditingController();
  String? producttImage;
  final FirebaseStorage _storage = FirebaseStorage.instance;


  Future<String> uploadImageToStorage(ImageSource imageSource) async {
    String uniqueFileName=DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = _storage.ref().child('productImages').child(uniqueFileName);

    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: imageSource);
    if(image!.path!=null) {
      String imageurl = image!.path;
      try {
        await ref.putFile(File(imageurl));
        producttImage = await ref.getDownloadURL();
        return producttImage!;
      }
      catch (error) {
        print(error);
        return "Error Occured";
      }
    }
    else{
    return "please upload an image";
    }

  }

  Future<void> addNewProduct({required BuildContext context})async {
    if (formKey.currentState!.validate()) {
      if (producttImage != null) {
        await (await FirebaseProductsData.getInstance).insertProduct(
          productName: productName.text,
          productCategory: productCategory.text.trim(),
          productDesc: productDesc.text,
          availableQuantity: int.parse(productAvailableQuantity.text),
          productCurrentPrice: int.parse(productCurrentPrice.text),
          productSale: int.parse(productSale.text),
          isSale: (int.parse(productSale.text) > 0) ? 1 : 0,
          productImage: producttImage,
          //image: await image!.readAsBytes(),
          productAcutalPrice: int.parse(productAcutalPrice.text),
        );
        await (await DatabaseProductsData.getInstance).insertProduct(
          productName: productName.text,
          productCategory: productCategory.text,
          productDesc: productDesc.text,
          availableQuantity: int.parse(productAvailableQuantity.text),
          productCurrentPrice: int.parse(productCurrentPrice.text),
          productSale: int.parse(productSale.text),
          isSale: (int.parse(productSale.text) > 0) ? 1 : 0,
          image: await image!.readAsBytes(),
          productImage: producttImage,
          productAcutalPrice: int.parse(productAcutalPrice.text),
        );
        globalCategory = productCategory.text.trim();
        context.showToastMessage = "Product Added Successfully";
        ProductscontrollerCubit.instance.init();
        emit(NewproductcontrollerAdded());
        context.pop;
      }
    }
  }
}
