import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';
import 'package:stylish/features/dashboard/modules/products/controller/cubit/productscontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/model/repo/database_product_data.dart';
import 'package:stylish/features/dashboard/modules/products/model/repo/firebase_products_data.dart';

part 'cartcontroller_state.dart';

class CartcontrollerCubit extends Cubit<CartcontrollerState> {
  static CartcontrollerCubit instance =CartcontrollerCubit();
  CartcontrollerCubit() : super(CartcontrollerLoading()){
      init();
    }



   List<ProductModel> products = [];

   Future<void> init() async {
    emit(CartcontrollerLoading());
    products =  await (await FirebaseProductsData.getInstance).fetchFavoriteProducts();
    if (products.isEmpty)
      emit(CartcontrollerEmpty());
    else {
      emit(CartcontrollerLoaded());
    }
   }


  Future<void> addTOFav(String id, int value, BuildContext context) async {

    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile)) {
      await (await FirebaseProductsData.getInstance).updateFavorite(value, id);
      (await FirebaseProductsData.getInstance).updateDemandQuantity(value, id);
      products=await(await FirebaseProductsData.getInstance).fetchFavoriteProducts();
    }
    else {
      (await DatabaseProductsData.getInstance).updateFavorite(value, id);
      (await DatabaseProductsData.getInstance).updateDemandQuantity(value, id);
      products=await(await FirebaseProductsData.getInstance).fetchFavoriteProducts();
    }
    await ProductscontrollerCubit.instance.init();
    emit(CartcontrollerRemoved());
  }
}

