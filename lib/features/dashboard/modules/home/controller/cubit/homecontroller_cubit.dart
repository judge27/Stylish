import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:stylish/const.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/features/dashboard/controller/cubit/dashboardcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/controller/cubit/productscontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';
import 'package:stylish/features/dashboard/modules/products/model/repo/database_product_data.dart';
import "dart:math";
import '../../../products/model/repo/firebase_products_data.dart';

part 'homecontroller_state.dart';

class HomecontrollerCubit extends Cubit<HomecontrollerState> {
  static HomecontrollerCubit instance = HomecontrollerCubit();
  HomecontrollerCubit() : super(HomecontrollerLoading()){
    init();
  }
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemScrollController itemScrollController2 = ItemScrollController();
  TextEditingController searchController=TextEditingController();
  String homeTitle = "All Featured";
  int pageIndex1 = 0;
  int pageIndex2 = 0;
  List<ProductModel> products=[];
  bool sorted=true;
  var cateogriesFilter =[
    "All",
    "Beauty",
    "Fashion",
    "Kids",
    "Mens",
    "Women"
  ];
  void onNext({required ItemScrollController itemScrollController1,required int pageIndex}) {
    pageIndex += 2;
    itemScrollController1.scrollTo(
        index: pageIndex,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOutCubic);
    emit(HomecontrollerChanged());
  }
  Future<void> init() async {
    emit(HomecontrollerLoading());
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
          products =  await (await FirebaseProductsData.getInstance)
          .fetchProducts().then((value) async{
            products=[];
            for(int i=0;i<value.length-1;i++){
                  if(value[i].isSale==1){
                    products.add(value[i]);
                  }
              }
            return products;
      });
    }
    else {
      products =
      await (await DatabaseProductsData.getInstance)
          .fetchProducts().then((value) async{
        products=[];
        for(int i=0;i<value.length-1;i++){
          if(value[i].isSale==1){
            products.add(value[i]);
          }
        }
        return products;
      });
    }
    if (products.isEmpty) {
      emit(HomecontrollerEmpty());
    } else {
      emit(HomecontrollerLoaded());
    }
  }

  Future<void> searchProducts(String value) async {
    if(value.isEmpty ){
      init();
    }
    else {
      globalCategory="All";
      ProductscontrollerCubit.instance.init();
      ProductscontrollerCubit.instance.products = ProductscontrollerCubit.instance.products.where((element) {
        String searchItem = "${element.productName.toLowerCase()} ${element
            .productDesc!.toLowerCase()} ${element.productCategory
            .toLowerCase()} ";
        return searchItem.toLowerCase().contains(value.toLowerCase());
      }).toList();
      DashboardcontrollerCubit.instance.onChangePage(1);
    }
    emit(HomecontrollerLoaded());
  }

  Future<void> sortProducts() async {
    sorted=!sorted;
    Comparator<ProductModel> sortById = (a, b) => a.productCurrentPrice!.compareTo(b.productCurrentPrice!);
    products.sort(sortById);
    if(sorted){
      products=products.reversed.toList();
    }
    emit(HomecontrollerLoaded());
  }

  Future<void> filterProducts(String value) async {
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
    emit(HomecontrollerLoaded());
  }
  Future<void>  onTapViewAll() async{
    ProductscontrollerCubit.instance.init();
    ProductscontrollerCubit.instance.homeTitle=products.length.toString();
    DashboardcontrollerCubit.instance.onChangePage(1);
    emit(HomecontrollerChanged());
  }

}
