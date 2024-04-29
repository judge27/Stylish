
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
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

  GlobalKey<FormState> formKey = GlobalKey();

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
      nameController.text=user.name;
      emailController.text=user.email;
      passwordController.text=user.password;
      print("******************"+nameController.text+"******************");
      print("******************"+emailController.text+"******************");
      print("******************"+passwordController.text+"******************");
      emit(UserLoaded());
    } catch (_) {
      user = UserModel.empty();
    }
   }
   Future<void> onSave()async {
    if(formKey.currentState!.validate()){
      // UserModel model = UserModel(
      //     id: userCredential.user!.uid.toString(),
      //     name: name,
      //     email: email,
      //     password: password,
      //     phoneNumber: phoneNumber,
      //     profilePicture: profilePicture
      // ) {
      //   'id': ,
      //   'Name':nameController.text,
      //   'Email':emailController.text,
      //   'Password':passwordController.text
      // };
      // M
      // FirebaseUsersData.getInstance.update(userModel: model )
    }
   }

}
