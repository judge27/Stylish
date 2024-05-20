import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/features/dashboard/modules/fav/controller/cubit/favoriteproduct_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/controller/cubit/productscontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';
import 'package:stylish/features/dashboard/modules/products/model/repo/database_product_data.dart';
import 'package:stylish/features/dashboard/modules/products/model/repo/firebase_products_data.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/firebase_users_data.dart';

part 'cartcontroller_state.dart';

class CartcontrollerCubit extends Cubit<CartcontrollerState> {
  static CartcontrollerCubit instance =CartcontrollerCubit();
  CartcontrollerCubit() : super(CartcontrollerLoading()){
      init();
    }



   List<ProductModel> products =[];

   Future<void> init() async {
    emit(CartcontrollerLoading());
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile)) {
      connected = true;
      products = await (await FirebaseProductsData.getInstance).fetchCartProducts();
    }
    else{
      connected = false;
      products =
      await (await DatabaseProductsData.getInstance).fetchCartProducts();
    }
    if (products.isEmpty)
      emit(CartcontrollerEmpty());
    else {
      emit(CartcontrollerLoaded());
    }
   }


  Future<void> removeFromCart(String id, int value, BuildContext context) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile)) {
      connected=true;
      await (await FirebaseProductsData.getInstance).updateCart(0, id);
      (await FirebaseProductsData.getInstance).updateDemandQuantity(0, id);
      for (int i=0;i<=CartcontrollerCubit.instance.products.length-1;i++){
        if(CartcontrollerCubit.instance.products[i].id==id){
          products.removeAt(i);
          ProductscontrollerCubit.instance.products[i].demandQuantity=0;
         FavoriteproductCubit.instance.products[i].demandQuantity=0;
          ProductscontrollerCubit.instance.init();
          break;
        }
      }
    }
    else {
      connected=false;
      (await DatabaseProductsData.getInstance).updateCart(0, id);
      (await DatabaseProductsData.getInstance).updateDemandQuantity(0, id);
      for (int i=0;i<=CartcontrollerCubit.instance.products.length-1;i++){
        if(CartcontrollerCubit.instance.products[i].id==id){
          products.removeAt(i);
          ProductscontrollerCubit.instance.products[i].demandQuantity=0;
          FavoriteproductCubit.instance.products[i].demandQuantity=0;
          ProductscontrollerCubit.instance.init();
          break;
        }
      }
    }
    emit(CartcontrollerRemoved());
  }
}

