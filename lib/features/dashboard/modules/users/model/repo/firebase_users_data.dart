import 'package:stylish/features/dashboard/modules/users/model/repo/parent_users_data.dart';
import 'package:stylish/features/dashboard/modules/users/model/user_model.dart';

class FirebaseUsersData extends ParentUsersData{
  static FirebaseUsersData? _instance;
  FirebaseUsersData._init();

  static FirebaseUsersData get getInstance {
    _instance??=FirebaseUsersData._init();
    return _instance!;
  }
  @override
  Future<void> delete({required int id}) {
    // TODO: implement delete
    throw UnimplementedError();
  }


  @override
  Future<void> insert({required String name, required String email, required String password}) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> fetech() {
    // TODO: implement fetech
    throw UnimplementedError();
  }
  
}