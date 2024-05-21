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
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/features/dashboard/modules/cart/controller/cubit/cartcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/fav/controller/cubit/favoriteproduct_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';
import 'package:stylish/features/dashboard/modules/products/model/repo/database_product_data.dart';
import 'package:stylish/features/dashboard/modules/products/model/repo/firebase_products_data.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/firebase_users_data.dart';

part 'productscontroller_state.dart';

class ProductscontrollerCubit extends Cubit<ProductscontrollerState> {
  static ProductscontrollerCubit instance = ProductscontrollerCubit();

  ProductscontrollerCubit() : super(ProductscontrollerLoading()) {
    init();
  }
  bool sorted=true;
  XFile? image;
  String homeTitle = "0 Iteams";
  final FirebaseStorage _storage = FirebaseStorage.instance;
  List<ProductModel> products = [];
  var cateogriesFilter =[
    "All",
    "Beauty",
    "Fashion",
    "Kids",
    "Mens",
    "Women"
  ];

  Future<void> init() async {
    emit(ProductscontrollerLoading());
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      products = globalCategory == "All" ? await (await FirebaseProductsData.getInstance)
          .fetchProducts() :
      await (await FirebaseProductsData.getInstance).fetchProductsWithCategory(
          productCategory: globalCategory);
    }
    else {
      products =
      globalCategory == "All" ? await (await DatabaseProductsData.getInstance)
          .fetchProducts() :
      await (await DatabaseProductsData.getInstance).fetchProductsWithCategory(
          productCategory: globalCategory);
    }

    homeTitle = products.length.toString() + " Items";
    if (products.isEmpty) {
      emit(ProductscontrollerEmpty());
    } else {
      emit(ProductscontrollerLoaded());
    }
  }


  void addTOFav(String id, int value, BuildContext context) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      await (await FirebaseProductsData.getInstance).updateFavorite(value, id);
      for (int i=0;i<=products.length-1;i++){
        if(products[i].id==id){
          products[i].favorite=value;
          break;
        }
      }
    }
    else {
      (await DatabaseProductsData.getInstance).updateFavorite(value, id);
      for (int i=0;i<=products.length-1;i++){
        if(products[i].id==id){
          products[i].favorite=value;
          break;
        }
      }
    }
    FavoriteproductCubit.instance.init();
    emit(ProductscontrollerLoaded());
  }

  void onDelete(String id) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      connected = true;
      (await FirebaseProductsData.getInstance).deleteProduct(id);
      for (int i=0;i<=products.length-1;i++){
        if(products[i].id==id){
          products.removeAt(i);
          break;
        }
      }
    }
    else {
      connected = false;
      (await DatabaseProductsData.getInstance).deleteProduct(id);
      for (int i=0;i<=products.length-1;i++){
        if(products[i].id==id){
          products.removeAt(i);
          break;
        }
      }
    }
    emit(ProductscontrollerLoaded());
  }


  Future<void> updateImage(String id) async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image!.path != null) {
      String uniqueFileName = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      Reference ref = _storage.ref().child('productsImages').child(
          uniqueFileName);
      try {
        await ref.putFile(File(image!.path));
        String downloadUrl = await ref.getDownloadURL();
        (await FirebaseProductsData.getInstance).newImage(downloadUrl, id);
        for (int i=0;i<=products.length-1;i++){
          if(products[i].id==id){
            products[i].productImage=downloadUrl;
            break;
          }
        }
        emit(ProductscontrollerLoaded());
      }
      catch (error) {
        print(error);
      }
    }
  }


  Future<void> searchProducts(String value) async {
    if(value.isEmpty ){
      init();
    }
    else {
      products=await (await FirebaseProductsData.getInstance)
          .fetchProducts();
      products = products.where((element) {
        String searchItem = "${element.productName.toLowerCase()} ${element
            .productDesc!.toLowerCase()} ${element.productCategory
            .toLowerCase()} ";
        return searchItem.toLowerCase().contains(value.toLowerCase());
      }).toList();
      homeTitle = products.length.toString() + " Items";
    }
    emit(ProductscontrollerLoaded());
  }

  Future<void> sortProducts() async {
    sorted=!sorted;
    Comparator<ProductModel> sortById = (a, b) => a.productCurrentPrice!.compareTo(b.productCurrentPrice!);
    products.sort(sortById);
    if(sorted){
      products=products.reversed.toList();
    }
    emit(ProductscontrollerLoaded());
  }

  Future<void> filterProducts(String value) async {
      globalCategory =value;
      List<ProductModel> temp=[];
      if(value.toLowerCase()=='all') {
        products = await (await FirebaseProductsData.getInstance).fetchProducts();
      }
      else{
        temp = await (await FirebaseProductsData.getInstance).fetchProductsWithCategory(productCategory: value);
        products=[];
        for(int i=0;i<=temp.length-1;i++){
          if(temp[i].productCategory==value){
            products.add(temp[i]);
          }
        }
      }
     emit(ProductscontrollerLoaded());
 }
}
