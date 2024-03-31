import 'package:dio/dio.dart';
import 'package:stylish/const.dart';
import 'package:stylish/model/product_model.dart';
import 'package:stylish/services/dio_helper.dart';

class CategoriesService {
  Future<List<ProductModel>> getProducts({required int id}) async {
    Map<String, dynamic> data =
        await DioHelper().get(url: baseUrl + "categories/" + id.toString());

    Map<String, dynamic> products = data["data"];
    List<ProductModel> productsList = [];
    for (int i = 0; i < products.length; i++) {
      productsList.add(ProductModel.fromJson(products[i]));
    }

    return productsList;
  }
}
