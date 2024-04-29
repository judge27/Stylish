
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/firebase/firebase.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/database_users_data.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/firebase_users_data.dart';
import 'package:stylish/features/dashboard/modules/users/model/user_model.dart';

part 'usercontroller_state.dart';

class UsercontrollerCubit extends Cubit<UsercontrollerState> {
  UsercontrollerCubit() : super(UserLoading()) {
    init();
  }

  // password showen & hiden value
  bool obscurePassword = true;

  // controller object of name textField
  TextEditingController nameController = TextEditingController();

  // controller object of email textField
  TextEditingController emailController = TextEditingController();

  // controller object of password textField
  TextEditingController passwordController = TextEditingController();

  UserModel user = UserModel.empty();

  final firebaseUserData = FirebaseUsersData.getInstance;

  void getImage() async {
    FireBaseModel.instance.image = await FireBaseModel.instance.pickImage(
        source: ImageSource.gallery);
    emit(UserImage());
  }


  // Show & Hide Password Method
  void togglePassword() {
    obscurePassword = !obscurePassword;
    emit(UserScured());
  }

  // Initilize the user page
  Future<void> init() async {
    emit(UserLoading());
    try {
      user = await firebaseUserData.fetech();

    } catch (_) {
      user = UserModel.empty();
    }
    nameController.text=user.name!;
    emailController.text=user.email!;
    passwordController.text=user.password!;
    emit(UserLoaded());
  }

  Future<void> saveUserRecord(
      {required BuildContext context, UserCredential? userCredential}) async {


  }
}
