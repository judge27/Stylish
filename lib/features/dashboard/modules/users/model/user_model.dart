import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';

class UserModel {
  final String id;
  String name;
  String email;
  String password;
  String phoneNumber;
  String profilePicture;
  bool admin;
  List<ProductModel>? cartProducts=[];
  List<ProductModel>? favProducts=[];
  UserModel(
      {required this.id, required this.name, required this.email,
        required this.password,
        required this.phoneNumber,
        required this.profilePicture,
        this.admin=false,
        this.cartProducts,
        this.favProducts
      });

  // UserModel.fromJson(Map map){
  //   id = map['id'].toString();
  //   name = map['name'];
  //   email = map['email'];
  //   password = map['password'];
  // }

  String get getName => name;

  String get getEmail => email;

  String get getPassword => password;

  String get getPhoneNumber => phoneNumber;

  String get getProfilePicture => profilePicture;

  bool get getAdmin => admin;

  List<ProductModel> get getCartProducts => cartProducts!;

  List<ProductModel> get getFavProducts => favProducts!;

  static UserModel empty() =>
      UserModel(password: '',
          email: '',
          name: '',
          id: '',
          phoneNumber: '',
          profilePicture: '',
          admin: false,
          cartProducts:[],
          favProducts:[],
      );

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Email': email,
      'Password': password,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'admin':admin,
      'CartProducts':cartProducts,
      'FavProducts':favProducts,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document){
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          name: data['Name'] ?? '',
          email: data['Email'] ?? '',
          password: data['Password'] ?? '',
          phoneNumber: data['PhoneNumber'] ?? '',
          profilePicture: data['ProfilePicture'] ?? '',
          admin: data['admin'] ?? false,
          cartProducts:data['CartProducts'] ?? [],
          favProducts:data['FavProducts'] ?? [],
      );
    } else {
      return UserModel.empty();
    }
  }

}