import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/firebase/firebase.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/parent_users_data.dart';
import 'package:stylish/features/dashboard/modules/users/model/user_model.dart';

class FirebaseUsersData extends ParentUsersData {
  static FirebaseUsersData? _instance;
  FirebaseUsersData._init();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  static FirebaseUsersData get getInstance {
    _instance ??= FirebaseUsersData._init();
    return _instance!;
  }

  @override
  Future<void> delete({required String id}) async {
    try {
      await _db.collection('users').doc(id).delete().then((_) => print("DELETED Success"))
          .catchError((error) => print(error));
    }
    catch(_){
      throw 'something went error';
    }
  }

  Future<void> insert(
      {required String name,
        required String email,
        required String password,
        required bool admin,
        String? profilePicture,
        String? phoneNumber,

      }) async {
    CollectionReference users = _db.collection('users');
    await users
        .add({
      'name': name,
      'email': email,
      'password': password,
      'admin':admin,
      'phoneNumber':phoneNumber,
      'profilePicture':profilePicture
    })
        .then((_) => print("Added Success"))
        .catchError((error) => print(error));
  }

  @override
  Future<UserModel> fetech() async {
    try {
      final documentSnapshot = await _db
          .collection('users')
          .doc(FireBaseModel.instance.autUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } catch (_) {
      throw 'something went wrong';
    }
  }

  Future<void> saveUserRecord(UserModel userModel) async {
    try {
      await _db.collection('users').doc(userModel.id).set(userModel.toJson());
    } catch (_) {
      throw 'something went wrong';
    }
  }

  @override
  Future<void> update({required UserModel userModel}) async {
    try {
      await _db
          .collection('users')
          .doc(userModel.id)
          .update(userModel.toJson());
    } catch (_) {
      throw 'something went wrong';
    }
  }

  Future<void> updateSingleField(Map<String, dynamic> json,)async {
    try{
      await _db.collection('users').doc(FireBaseModel.instance.autUser?.uid).
      update(json);
    }
    catch(e){
      throw 'something went wrong $e';
    }
  }
}
