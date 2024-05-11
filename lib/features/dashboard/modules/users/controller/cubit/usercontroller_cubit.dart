import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/firebase/firebase.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/firebase_users_data.dart';
import 'package:stylish/features/dashboard/modules/users/model/user_model.dart';
part 'usercontroller_state.dart';


class UsercontrollerCubit extends Cubit<UsercontrollerState> {

  static UsercontrollerCubit instance = UsercontrollerCubit();

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


  // UserModel user = UserModel.empty();

  final firebaseUserData = FirebaseUsersData.getInstance;

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  final FirebaseStorage _storage = FirebaseStorage.instance;

  String? profileImage;

  XFile? image;


  // Show & Hide Password Method
  void togglePassword() {
    obscurePassword = !obscurePassword;
    emit(UserScured());
  }




  Future<String> pickImage()async{
    final ImagePicker picker = ImagePicker();
     image = await picker.pickImage(source: ImageSource.gallery);
    if(image!.path!=null){
      return image!.path;
    }
    else {
      return "please upload an image";
    }

    emit(UserImage());
  }
  Future<String> uploadImageToStorage() async {
    String uniqueFileName=DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = _storage.ref().child('image').child(uniqueFileName);
    String imageurl =await pickImage();
    try {
      await ref.putFile(File(imageurl));
      profileImage= await ref.getDownloadURL();
      emit(UserImage());
      return profileImage!;
    }
    catch(error){
      print(error);
      return "Error Occured";
    }

  }


// Initilize the user page
  Future<void> init() async {
    emit(UserLoading());
    try {
      user = await getUser;
      nameController.text = user.name;
      emailController.text = user.email;
      passwordController.text = user.password;
      profileImage= await user.profilePicture;
      emit(UserLoaded());
    } catch (_) {
      user = UserModel.empty();
    }
  }


  Future<void> onSave({required BuildContext context}) async {
    if (formKey.currentState!.validate()) {
      if (user.name == nameController.text &&
          user.password == passwordController.text &&
          user.email == emailController.text&&user.profilePicture==profileImage) {
        context.showToastMessage = "Data Still The Same";
      } else {
        if(profileImage!.isEmpty)
          context.showToastMessage="Please upload an image";
        Map<String, dynamic> model = {
          'Name': nameController.text,
          'Email': emailController.text,
          'Password': passwordController.text,
          'ProfilePicture': profileImage,
          'PhoneNumber':phoneNumber
        };
        await FirebaseUsersData.getInstance.updateSingleField(model);
        context.showToastMessage = "Data Updated Successfully";
        init();
      }
    }
  }







  Future<void> onDelete({required BuildContext context}) async {
    try {
      await FireBaseModel.instance.autUser!.delete();
      final auth = FireBaseModel.instance.autUser;
      await FirebaseUsersData.getInstance.delete(id: auth!.uid.toString());
      context.showToastMessage = "User Deleted";
      context.pushTo = Routes.LOGIN;
    }
    catch (_) {

    }
  }

    Future<void> onSignout({BuildContext? context}) async {
      await FirebaseAuth.instance.signOut();
      context!.pushTo = Routes.LOGIN;
    }
}
