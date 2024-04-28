import 'package:stylish/features/dashboard/modules/users/model/user_model.dart';

abstract class ParentUsersData {
  Future<void> insert(
      {required String name, required String email, required String password});

  Future<void> delete({required int id});
  Future<List<UserModel>> fetech();

}