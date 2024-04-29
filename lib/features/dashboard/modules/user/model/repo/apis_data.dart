import 'package:stylish/features/dashboard/modules/user/model/repo/parent_data.dart';
import '../user_model.dart';
class APIsRepo extends ParentRepo {
  @override
  Future<void> delete({required num id}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> fetch() {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<void> insert({required String name, String? address}) {
    // TODO: implement insert
    throw UnimplementedError();
  }
}