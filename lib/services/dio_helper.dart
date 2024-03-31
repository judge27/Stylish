import 'package:dio/dio.dart';

class DioHelper {
  Dio dio = Dio();
  DioHelper();

  Future<dynamic> get({required String url}) async {
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("there is an error with status code" +
          response.statusCode.toString());
    }
  }

  Future<dynamic> post(
      {required String url, required Map<String, dynamic> data}) async {
    Map<String, String> headers = {};
    headers.addAll({
      "Auhorization": "",
    });
    Response response = await dio.post(
      url,
      data: data,
    );
    return response.data;
  }

  Future<dynamic> put({required String url, required dynamic data}) async {
    Response response = await dio.post(
      url,
      data: data,
    );
    if (response.statusCode == 200)
      return response.data;
    else {
      throw Exception(
          "there is a problem with status code ${response.statusCode} with body ${response.data}");
    }
  }
}
