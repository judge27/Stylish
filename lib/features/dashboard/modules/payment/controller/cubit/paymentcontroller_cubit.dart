import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/features/dashboard/modules/fav/controller/cubit/favoriteproduct_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/controller/cubit/productscontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';
import 'package:stylish/features/dashboard/modules/products/model/repo/database_product_data.dart';
import 'package:stylish/features/dashboard/modules/products/model/repo/firebase_products_data.dart';
import 'package:stylish/features/dashboard/modules/users/model/user_model.dart';

part 'paymentcontroller_state.dart';

class PaymentcontrollerCubit extends Cubit<PaymentcontrollerState> {
  static PaymentcontrollerCubit instance =PaymentcontrollerCubit();
  PaymentcontrollerCubit() : super(PaymentcontrollerInitial()){
  }
  int Qty=1;
  int prodcutPrice=0;
  TextEditingController QtyController=TextEditingController();
  int deliveryFee=0;
  void updateQty(int value,ProductModel productModel ){
    if(value<=0)
      value=1;
    Qty=value;
    if(((productModel.productCurrentPrice!*value)*0.3).toInt()<250)
    deliveryFee=((productModel.productCurrentPrice!*value)*0.3).toInt();
    else
    deliveryFee=0;
    prodcutPrice=productModel.productCurrentPrice!;
    emit(PaymentcontrollerChanged());
  }



  void addTOFav(String id, int value, BuildContext context,ProductModel productModel) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      productModel.favorite=value;
      await (await FirebaseProductsData.getInstance).updateFavorite(value, id);
      ProductscontrollerCubit.instance.init();
      FavoriteproductCubit.instance.init();
    }
    else {
      productModel.favorite=value;
      await (await DatabaseProductsData.getInstance).updateFavorite(value, id);
      ProductscontrollerCubit.instance.init();
      FavoriteproductCubit.instance.init();
    }
    emit(PaymentcontrollerChanged());
  }


}
