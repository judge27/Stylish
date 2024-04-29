import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/firebase/firebase.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/firebase_users_data.dart';
import 'package:stylish/features/dashboard/modules/users/model/user_model.dart';

part 'usercontroller_state.dart';

class UsercontrollerCubit extends Cubit<UsercontrollerState> {
  UsercontrollerCubit() : super(UserLoading()) {
    init();
  }
  final storage= FirebaseStorage.instance;

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


  // Show & Hide Password Method
  void togglePassword() {
    obscurePassword = !obscurePassword;
    emit(UserScured());
  }

  // Initilize the user page
  Future<void> init() async {
    emit(UserLoading());
    try {
      user.profilePicture='';
      user = await firebaseUserData.fetech();
      await getImageUrl();
      nameController.text = user.name;
      emailController.text = user.email;
      passwordController.text = user.password;
      print("****************"+nameController.text+"****************");
      print("****************"+emailController.text+"****************");
      print("****************"+passwordController.text+"****************");
      emit(UserLoaded());
    } catch (_) {
      user = UserModel.empty();
    }
  }
  Future<void> getImageUrl() async{
    final ref = storage.ref().child('default_avatar.png');
    final url= await ref.getDownloadURL();
    user.profilePicture=url;
    FireBaseModel.instance.constImage=user.profilePicture;
  }
  Future<void> onSave({required BuildContext context}) async {
    if (formKey.currentState!.validate()) {
      if (user.name == nameController.text &&
          user.password == passwordController.text &&
          user.email == emailController.text) {
        context.showToastMessage = "Data Still The Same";
      } else {
        Map<String, dynamic> model = {
          'Name': nameController.text,
          'Email': emailController.text,
          'Password': passwordController.text,
          'ProfilePicture': user.profilePicture,
          'PhoneNumber':FireBaseModel.instance.phonenumber
        };
        await FirebaseUsersData.getInstance.updateSingleField(model);
        user.name = nameController.text;
        user.password = passwordController.text;
        user.email = emailController.text;
        user.phoneNumber=FireBaseModel.instance.phonenumber;
        context.showToastMessage = "Data Updated Successfully";
      }
    }
  }
  void onDelete({required BuildContext context}){
    try{
      final auth= FireBaseModel.instance.autUser;
      FirebaseUsersData.getInstance.delete(id: auth!.uid.toString());
      context.showToastMessage="User Deleted";
      context.pushTo=Routes.LOGIN;
    }
    catch(_){

    }
  }
}
