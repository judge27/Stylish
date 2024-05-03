import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:stylish/const.dart';
import 'package:stylish/features/dashboard/model/product_model.dart';
import 'package:stylish/features/dashboard/modules/products/model/repo/product_database.dart';

part 'productscontroller_state.dart';

class ProductscontrollerCubit extends Cubit<ProductscontrollerState> {
  ProductscontrollerCubit() : super(ProductscontrollerLoading())  {
    init();

  }
  /*
   productImage:  kShoes,
      productName: "HRX by Hrithik Roshan",
      productDesc: "Neque porro quisquam est qui dolorem ipsum quia",
      isSale: 1,
      productCurrentPrice: 2499,
      productAcutalPrice: 4999,
      productSale: 50,
      productAvailableQuantity: "344567",
   */

  String homeTitle = "52,082+ Iteams";
  DatabaseRepo db =DatabaseRepo();
  List<ProductModel> products = [];
  Future<void>init() async {
    emit(ProductscontrollerLoading());
    await db.initDB();
    products =await db.fetchProducts();
    if(products.isEmpty)
      emit(ProductscontrollerEmpty());
    else {
      emit(ProductscontrollerLoaded());
    }

  }



void addTOFav(int id,int value){
    db.updateFavorite(value, id);
    init();
    emit(ProductscontrollerLoaded());
}
  void addTOCart(int id,int value){
    db.updateCart(value, id);
    init();
    emit(ProductscontrollerLoaded());
  }

}
