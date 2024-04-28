class UserModel {
  String? id;
  String? name;
  String? email;
  String? password;
  UserModel({this.id,this.name,this.email,this.password});
  UserModel.fromJson(Map map){
    id=map['id'].toString();
    name=map['name'];
    email=map['email'];
    password=map['password'];
  }
}