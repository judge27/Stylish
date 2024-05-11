import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:stylish/const.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/features/dashboard/modules/cart/controller/cubit/cartcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';
import 'package:stylish/features/dashboard/modules/products/model/repo/database_product_data.dart';
import 'package:stylish/features/dashboard/modules/products/model/repo/firebase_products_data.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/firebase_users_data.dart';

part 'productscontroller_state.dart';

class ProductscontrollerCubit extends Cubit<ProductscontrollerState> {
  static ProductscontrollerCubit instance=ProductscontrollerCubit();
  ProductscontrollerCubit() : super(ProductscontrollerLoading())  {
    init();

  }
  XFile? image;
  String homeTitle = "0 Iteams";
  final FirebaseStorage _storage = FirebaseStorage.instance;

  List<ProductModel> products = [];

  Future<void>init() async {
    emit(ProductscontrollerLoading());
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());

    if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile)) {
      products =
      globalCategory == "" ? await (await FirebaseProductsData.getInstance)
          .fetchProducts() :
      await (await FirebaseProductsData.getInstance).fetchProductsWithCategory(
          productCategory: globalCategory);
    }
    else{
      products =
      globalCategory == "" ? await (await DatabaseProductsData.getInstance)
          .fetchProducts() :
      await (await DatabaseProductsData.getInstance).fetchProductsWithCategory(
          productCategory: globalCategory);

    }

    homeTitle=products.length.toString()+" Items";
    if(products.isEmpty)
      emit(ProductscontrollerEmpty());
    else {
      emit(ProductscontrollerLoaded());
    }

  }



  void addTOFav(String id,int value,BuildContext context)async{
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());

    if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile)) {
      (await FirebaseProductsData.getInstance).updateFavorite(value, id);
      (await FirebaseProductsData.getInstance).updateDemandQuantity(value, id);
    }
    else {
      (await DatabaseProductsData.getInstance).updateFavorite(value, id);
      (await DatabaseProductsData.getInstance).updateDemandQuantity(value, id);
    }
    init();
    CartcontrollerCubit.instance.init();
    emit(ProductscontrollerLoaded());
  }

  void addTOCart(String id,int value)async {

    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());

    if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile))
      (await FirebaseProductsData.getInstance).updateCart(value, id);
    else
      (await DatabaseProductsData.getInstance).updateCart(value, id);

    init();
    emit(ProductscontrollerLoaded());
  }

  void onDelete(String id)async{
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());

    if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile))
      (await FirebaseProductsData.getInstance).deleteProduct(id);
    else
      (await DatabaseProductsData.getInstance).deleteProduct(id);

    init();
    emit(ProductscontrollerLoaded());
  }



  Future<void> updateImage(String id)async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image!.path != null) {
      String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref = _storage.ref().child('productsImages').child(uniqueFileName);
      try {
        await ref.putFile(File(image!.path));
        String downloadUrl = await ref.getDownloadURL();
        (await FirebaseProductsData.getInstance).newImage(downloadUrl,id);
        init();
        emit(ProductscontrollerLoaded());
      }
      catch (error) {
        print(error);
      }
    }

  }



  Future<void>  searchProducts(String searchitem) async {
    products = await (await FirebaseProductsData.getInstance).fetchSearchProducts(productName: searchitem);
    init();
  emit(ProductscontrollerSearched());
  }

}
