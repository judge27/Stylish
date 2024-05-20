import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/features/dashboard/modules/cart/controller/cubit/cartcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/controller/cubit/productscontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';
import 'package:stylish/features/dashboard/modules/products/model/repo/database_product_data.dart';
import 'package:stylish/features/dashboard/modules/products/model/repo/firebase_products_data.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/firebase_users_data.dart';

part 'favoriteproduct_state.dart';

class FavoriteproductCubit extends Cubit<FavoriteproductState> {
  static FavoriteproductCubit instance=FavoriteproductCubit();
  FavoriteproductCubit() : super(FavoriteproductLoading()){
    init();
  }

  List<ProductModel> products = [];

  Future<void> init() async {
    emit(FavoriteproductLoading());
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile)) {
      connected = true;
      products =await (await FirebaseProductsData.getInstance).fetchFavoriteProducts();
    }
    else{
      connected = false;
      products =
      await (await DatabaseProductsData.getInstance).fetchFavoriteProducts();
    }
    if (products.isEmpty)
      emit(FavoriteproductEmpty());
    else {
      emit(FavoriteproductLoaded());
    }
  }
  void addTOCart(String id, int value) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      connected = true;
      await (await FirebaseProductsData.getInstance).updateCart(1, id);
      await (await FirebaseProductsData.getInstance).updateDemandQuantity(value, id);
      for (int i=0;i<=FavoriteproductCubit.instance.products.length-1;i++){
        if(FavoriteproductCubit.instance.products[i].id==id){
          ProductscontrollerCubit.instance.init();
          ProductscontrollerCubit.instance.products[i].demandQuantity=FavoriteproductCubit.instance.products[i].demandQuantity!+1;
          FavoriteproductCubit.instance.products[i].demandQuantity=FavoriteproductCubit.instance.products[i].demandQuantity!+1;
          CartcontrollerCubit.instance.init();
          break;
        }
      }
    }
    else {
      connected = false;
      (await DatabaseProductsData.getInstance).updateCart(value, id);
      await (await DatabaseProductsData.getInstance).updateDemandQuantity(value, id);
      for (int i=0;i<=FavoriteproductCubit.instance.products.length-1;i++){
        if(FavoriteproductCubit.instance.products[i].id==id){
          ProductscontrollerCubit.instance.init();
          ProductscontrollerCubit.instance.products[i].demandQuantity=FavoriteproductCubit.instance.products[i].demandQuantity!+1;

          FavoriteproductCubit.instance.products[i].demandQuantity=FavoriteproductCubit.instance.products[i].demandQuantity!+1;
          CartcontrollerCubit.instance.init();
          break;
        }
      }
    }
    emit(FavoriteproductLoaded());
  }


  Future<void> removeFromFav(String id, int value, BuildContext context) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile)) {
      connected=true;
      await (await FirebaseProductsData.getInstance).updateFavorite(value, id);
      (await FirebaseProductsData.getInstance).updateDemandQuantity(value, id);
      for (int i=0;i<=FavoriteproductCubit.instance.products.length-1;i++){
        if(FavoriteproductCubit.instance.products[i].id==id){
          products.removeAt(i);
          ProductscontrollerCubit.instance.init();
          break;
        }
      }
    }
    else {
      connected=false;
      (await DatabaseProductsData.getInstance).updateFavorite(value, id);
      (await DatabaseProductsData.getInstance).updateDemandQuantity(value, id);
      for (int i=0;i<=FavoriteproductCubit.instance.products.length-1;i++){
        if(FavoriteproductCubit.instance.products[i].id==id){
          products.removeAt(i);
          ProductscontrollerCubit.instance.init();
          break;
        }
      }
    }
    emit(FavoriteproductRemoved());
  }
}
