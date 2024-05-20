import 'dart:typed_data';

import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/parent_users_data.dart';
import 'package:stylish/features/dashboard/modules/users/model/user_model.dart';

class ApiUsersData extends ParentUsersData {
  static ApiUsersData? _instance;
  ApiUsersData._init();

  static ApiUsersData get getInstance {
    _instance??=ApiUsersData._init();
    return _instance!;
  }


  @override
  Future<void> delete({required String id}) {
    // TODO: implement delete
    throw UnimplementedError();
  }





  @override
  Future<void> update({required UserModel userModel}) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<void> insert({required String name, required String email, required String password, required bool admin,}) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<UserModel> fetech({required String id}) {
    // TODO: implement fetech
    throw UnimplementedError();
  }

  @override
  Future<void> updateCartProducts(ProductModel value, String id) {
    // TODO: implement updateCartProducts
    throw UnimplementedError();
  }

  @override
  Future<void> updateFavProducts(ProductModel value, String id) {
    // TODO: implement updateFavProducts
    throw UnimplementedError();
  }



  
}