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
import 'package:stylish/const.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/firebase/firebase.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/firebase_users_data.dart';
import 'package:stylish/features/dashboard/modules/users/model/user_model.dart';
part 'profilecontroller_state.dart';



class ProfilecontrollerCubit extends Cubit<ProfilecontrollerState> {
  static ProfilecontrollerCubit instance = ProfilecontrollerCubit();
  ProfilecontrollerCubit() : super(ProfileLoading()) {
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
  TextEditingController phoneController = TextEditingController();


  // UserModel user = UserModel.empty();

  final firebaseUserData = FirebaseUsersData.getInstance;

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  final FirebaseStorage _storage = FirebaseStorage.instance;

  String? profileImage;

  XFile? image;


  // Show & Hide Password Method
  void togglePassword() {
    obscurePassword = !obscurePassword;
    emit(ProfileScured());
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

  }
  Future<String> uploadImageToStorage() async {
    String uniqueFileName=DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = _storage.ref().child('image').child(uniqueFileName);
    String imageurl =await pickImage();
    try {
      await ref.putFile(File(imageurl));
      profileImage= await ref.getDownloadURL();
      emit(ProfileImage());
      return profileImage??"";
    }
    catch(error){
      print(error);
      return "Error Occured";
    }

  }


// Initilize the user page
  Future<void> init() async {
    emit(ProfileLoading());
    try {
      user = await getUser;
      nameController.text = user.name;
      emailController.text = user.email;
      phoneController.text = user.phoneNumber;
      profileImage= await user.profilePicture??"";
      emit(ProfileLoaded());
    } catch (_) {
      user = UserModel.empty();
    }
  }


  Future<void> onSave({required BuildContext context}) async {
    if (formKey.currentState!.validate()) {
       if(user.email!=emailController.text)
         {
           await auth.currentUser?.updateEmail(emailController.text);
         }
        Map<String, dynamic> model = {

          'ProfilePicture': profileImage??"",

        };
        await FirebaseUsersData.getInstance.updateSingleField(model);
        context.pop;
      }
  }







  Future<void> onDelete() async {
    profileImage="";
    emit(ProfileImage());
  }

  Future<void> onSignout({BuildContext? context}) async {
    await FirebaseAuth.instance.signOut();
    context!.pushTo = Routes.LOGIN;
  }
}
