import 'package:sqflite/sqflite.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/parent_users_data.dart';
import 'package:path/path.dart';
import 'package:stylish/features/dashboard/modules/users/model/user_model.dart';
class DatabaseUsersData extends ParentUsersData {

  static DatabaseUsersData? _instance;
  static late Database _database;

  DatabaseUsersData._init();

  static Future<DatabaseUsersData> get getInstance async {
    if (_instance == null) {
      await _initDatabase();
      _instance = DatabaseUsersData._init();
    }
    return _instance!;
  }

  static Future<void> _initDatabase() async {
    // get the path of databse in your device
    final String databasePath = await getDatabasesPath();

    // get the final path = the path of database + folder of database in our device
    final path = join(databasePath, 'users.db');

    _database = await openDatabase(
      path,
      version: 3,
      onCreate:_createTables,
    );
  }

  static Future<void> _createTables(Database db, _) async {
   await db.execute("""
   CREATE TABLE user (
   id INTEGER PRIMARY KEY AUTOINCREMENT,
   name TEXT  NOT NULL,
   email TEXT  NOT NULL,
   password Text NOT NULL )
   """);
  }


  @override
  Future<void> delete({required String id}) async{
    await _database.delete('user',where: 'id=?',whereArgs: [id]);
  }


  @override
  Future<void> insert(
      {required String name, required String email, required String password}) async {
    await _database.insert('user', {'name':name,'email':email,'password':password});
  }

  @override
  Future<UserModel> fetech() {
    // TODO: implement fetech
    throw UnimplementedError();
  }

  @override
  Future<void> update({required UserModel userModel}) {
    // TODO: implement update
    throw UnimplementedError();
  }



}