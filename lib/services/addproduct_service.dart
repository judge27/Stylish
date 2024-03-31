import 'package:stylish/const.dart';
import 'package:stylish/model/product_model.dart';
import 'package:stylish/services/dio_helper.dart';

class AddProductService {
  Future<ProductModel> addProducts({
    required String name,
    required String? image,
    required double price,
    required String? description,
    required String? category,
    int? id,
    required List<String> images,
    required bool isInfav,
    required bool isInCart,
  }) async {
    dynamic data = DioHelper().post(url: baseUrl + "products", data: {
      "id": id,
      "price": price,
      "image": image,
      "name": name,
      "description": description,
      "images": images,
      "in_favorites": isInfav,
      "in_cart": isInCart,
    });
    return data;
  }
}
