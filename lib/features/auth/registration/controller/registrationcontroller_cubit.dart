import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/utils/firebase.dart';

part 'registrationcontroller_state.dart';

class RegistrationcontrollerCubit extends Cubit<RegistrationcontrollerState> {
  RegistrationcontrollerCubit() : super(RegistrationcontrollerInitial());

  GlobalKey<FormState> formKey = GlobalKey();

  late String email;

  late String name;

  late String password;


  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();


  void confirmRegistration(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      FireBaseModel.getInstance().email = emailController.text;
      FireBaseModel.getInstance().password = passwordController.text;
      try {
        await  FireBaseModel.getInstance().createUser();
        FireBaseModel.getInstance().showToast(context, message: "Email & Password are Registered.");
        Navigator.pushNamed(context, 'phonenumber');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          FireBaseModel.getInstance().showToast(context,
              message: "The password provided is too weak.");
        } else if (e.code == 'email-already-in-use') {
          FireBaseModel.getInstance().showToast(context,
              message: "The account already exists for that email.");
        }
      } catch (e) {
        print(e);
      }
    }
  }



  Future<void> handleGoogleSignin({required BuildContext context})async{
    await  FireBaseModel.getInstance().handleGoogleSignIn();
    FireBaseModel.getInstance().showToast(context, message: "Google Signed In");
    Navigator.pushNamed(context, 'getstarted');
  }



  Future<void> handleGoogleSignout({required BuildContext context}) async{
    await FireBaseModel.getInstance().handleGoogleSignout(context: context);
    FireBaseModel.getInstance().showToast(context, message: "Google Signed Out");
    Navigator.pop(context);
  }
}
