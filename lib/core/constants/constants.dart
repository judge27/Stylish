import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/firebase_users_data.dart';
import 'package:stylish/features/dashboard/modules/users/model/user_model.dart';

  // sharedpreferences object
  SharedPreferences? sharedPreferences;

  // onBoarding key
  bool onBoarding =false;

  // User Instance Object
  UserModel user = UserModel.empty();
  Future<UserModel> get getUser =>FirebaseUsersData.getInstance.fetech();


  //Product Constant
  String globalCategory="";

  // Firebase Constants
  final auth = FirebaseAuth.instance;
  String? verificationId = "";
  String phoneNumber="";
  bool resendCode = false;




