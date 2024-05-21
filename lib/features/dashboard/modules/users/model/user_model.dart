import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';
import 'package:stylish/features/dashboard/modules/users/model/card_model.dart';

class UserModel {
  final String id;
  String name;
  String email;
  String password;
  String phoneNumber;
  String profilePicture;
  bool admin;
  String? cardHolderName;
  String? expiryDate;
  String? cardNumber;
  String? cvvCode;
  UserModel(
      {required this.id, required this.name, required this.email,
        required this.password,
        required this.phoneNumber,
        required this.profilePicture,
        this.admin=false,
        this.cardHolderName,
        this.expiryDate,
        this.cardNumber,
        this.cvvCode
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

  String get getUserCardHolderName => cardHolderName!;

  String get getUserCardexpiryDate => expiryDate!;

  String get getUserCardcardNumber => cardNumber!;

  String get getUserCardcvvCode => cvvCode!;

  bool get getAdmin => admin;


  static UserModel empty() =>
      UserModel(password: '',
          email: '',
          name: '',
          id: '',
          phoneNumber: '',
          profilePicture: '',
          admin: false,
          cardHolderName:'',
          expiryDate:'',
          cardNumber:'',
          cvvCode:'',

      );

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Email': email,
      'Password': password,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'admin':admin,
      'cardHolderName':cardHolderName,
      'expiryDate': expiryDate ,
      'cardNumber':cardNumber,
      'cvvCode':cvvCode ,
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
          cardHolderName:data['cardHolderName'] ?? '',
          expiryDate:data['expiryDate'] ?? '',
          cardNumber:data['cardNumber'] ?? '',
          cvvCode:data['cvvCode'] ?? '',

      );
    } else {
      return UserModel.empty();
    }
  }

}