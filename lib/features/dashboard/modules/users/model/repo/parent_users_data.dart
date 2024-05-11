
import 'dart:typed_data';

import 'package:stylish/features/dashboard/modules/users/model/user_model.dart';

abstract class ParentUsersData {
  Future<void> insert(
      {required String name, required String email, required String password,required bool admin});

  Future<void> delete({required String id});
  Future<UserModel> fetech();
  Future<void> update({required UserModel userModel});

}