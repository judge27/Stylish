import 'package:dio/dio.dart';
import 'package:stylish/const.dart';
import 'package:stylish/model/categoryname_model.dart';
import 'package:stylish/services/dio_helper.dart';

class GetAllCategories {
  Dio dio = Dio();
  Future<List<CategoryNameModel>> getProducts() async {
    Map<String, dynamic> data =
        await DioHelper().get(url: kBaseUrl + "categories");
    Map<String, dynamic> categories = data["data"];
    List<CategoryNameModel> categoriesList = [];
    for (int i = 0; i < categories.length; i++) {
      categoriesList.add(CategoryNameModel.fromJson(categories[i]));
    }

    return categoriesList;
  }
}
