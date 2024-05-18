import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';
import 'package:stylish/features/dashboard/modules/products/model/repo/database_product_data.dart';
import 'package:stylish/features/dashboard/modules/products/model/repo/firebase_products_data.dart';

part 'productdetails_state.dart';

class ProductdetailsCubit extends Cubit<ProductdetailsState> {
  ProductdetailsCubit() : super(ProductdetailsLoading()){
    init();
  }
  String productCategory="All";
  String filterCategory="All";

  String homeTitle = "0 Iteams";
  List<ProductModel> products = [];
  bool sorted=true;
  var cateogries =[
    "All",
    "Beauty",
    "Fashion",
    "Kids",
    "Mens",
    "Women"
  ];
  Future<void> init() async {
    emit(ProductdetailsLoading());
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      products =
      productCategory == "All" ? await (await FirebaseProductsData.getInstance)
          .fetchProducts() :
      await (await FirebaseProductsData.getInstance).fetchProductsWithCategory(
          productCategory: productCategory);
    }
    else {
      products =
      productCategory == "All" ? await (await DatabaseProductsData.getInstance)
          .fetchProducts() :
      await (await DatabaseProductsData.getInstance).fetchProductsWithCategory(
          productCategory: productCategory);
    }

    homeTitle = products.length.toString() + " Items";
    if (products.isEmpty)
      emit(ProductdetailsEmpty());
    else {
      emit(ProductdetailsLoaded());
    }
  }
  Future<void> sortProducts() async {
    sorted=!sorted;
    Comparator<ProductModel> sortById = (a, b) => a.productCurrentPrice!.compareTo(b.productCurrentPrice!);
    products.sort(sortById);
    if(sorted)
      products=products.reversed.toList();
    emit(ProductdetailsLoaded());
  }

  Future<void> filterProducts(String value) async {
    productCategory=value;
    filterCategory=value;
    init();
  }
  void onClickItem(){
    emit(ProductdetailsLoaded());
  }
}
