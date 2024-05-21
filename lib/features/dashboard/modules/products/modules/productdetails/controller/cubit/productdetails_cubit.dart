import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/features/dashboard/controller/cubit/dashboardcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/cart/controller/cubit/cartcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/controller/cubit/productscontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';
import 'package:stylish/features/dashboard/modules/products/model/repo/database_product_data.dart';
import 'package:stylish/features/dashboard/modules/products/model/repo/firebase_products_data.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/firebase_users_data.dart';

part 'productdetails_state.dart';

class ProductdetailsCubit extends Cubit<ProductdetailsState> {
  static ProductdetailsCubit instance =ProductdetailsCubit();
  ProductdetailsCubit() : super(ProductdetailsLoading()){
    init(productCategory).then((value) {
      filterCategory=productCategory;
      init(filterCategory);
      CartcontrollerCubit.instance.init();
    });
  }
  String productCategory="All";
  String filterCategory="All";
  String homeTitle = "0 Iteams";
  List<ProductModel> products = [];
  bool sorted=true;
  var cateogriesFilter =[
    "All",
    "Beauty",
    "Fashion",
    "Kids",
    "Mens",
    "Women"
  ];
  Future<void> init(String category) async {
    emit(ProductdetailsLoading());
    emit(ProductdetailsFetchCategory());
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      products =
      category == "All" ? await (await FirebaseProductsData.getInstance)
          .fetchProducts() :
      await (await FirebaseProductsData.getInstance).fetchProductsWithCategory(
          productCategory: category);
    }
    else {
      products =
      category == "All" ? await (await DatabaseProductsData.getInstance)
          .fetchProducts() :
      await (await DatabaseProductsData.getInstance).fetchProductsWithCategory(
          productCategory: category);
    }

    homeTitle = products.length.toString() + " Items";
    if (products.isEmpty)
      emit(ProductdetailsEmpty());
    else {
      filterCategory=category;
      emit(ProductdetailsLoaded());
    }
  }
  void addTOCart(String id, int value,BuildContext context) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      connected = true;
     await (await FirebaseProductsData.getInstance).updateCart(1, id);
     await (await FirebaseProductsData.getInstance).updateDemandQuantity(value, id);
      for (int i=0;i<=ProductscontrollerCubit.instance.products.length-1;i++){
        if(ProductscontrollerCubit.instance.products[i].id==id){
          ProductscontrollerCubit.instance.products[i].cart=1;
          ProductscontrollerCubit.instance.products[i].demandQuantity=
          ProductscontrollerCubit.instance.products[i].demandQuantity!+1;
          await CartcontrollerCubit.instance.init();
          break;
        }
      }
    }
    else {
      connected = false;
      (await DatabaseProductsData.getInstance).updateCart(1, id);
      (await DatabaseProductsData.getInstance).updateDemandQuantity(value, id);
      for (int i=0;i<=ProductscontrollerCubit.instance.products.length-1;i++){
        if(ProductscontrollerCubit.instance.products[i].id==id){
          ProductscontrollerCubit.instance.products[i].cart=1;
          ProductscontrollerCubit.instance.products[i].demandQuantity=
              ProductscontrollerCubit.instance.products[i].demandQuantity!+1;
          await CartcontrollerCubit.instance.init();
          break;
        }
      }
    }
    emit(ProductdetailsChanged());
  }
  Future<void> sortProducts() async {
    sorted=!sorted;
    Comparator<ProductModel> sortById = (a, b) => a.productCurrentPrice!.compareTo(b.productCurrentPrice!);
    products.sort(sortById);
    if(sorted){
      products=products.reversed.toList();
    }
    emit(ProductdetailsLoaded());
  }

  Future<void> filterProducts(String value) async {
    filterCategory=value;
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
    emit(ProductdetailsLoaded());
  }
  void updateProductDetails(ProductModel product) {
    emit(ProductdetailsUpdated(updatedProduct: product));
  }

}
