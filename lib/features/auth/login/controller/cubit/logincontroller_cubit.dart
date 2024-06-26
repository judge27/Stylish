import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/firebase/firebase.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/features/dashboard/controller/cubit/dashboardcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/firebase_users_data.dart';
import 'package:stylish/features/dashboard/modules/users/modules/profile/controller/cubit/profilecontroller_cubit.dart';

part 'logincontroller_state.dart';

class LogincontrollerCubit extends Cubit<LogincontrollerState> {
  LogincontrollerCubit() : super(LogincontrollerInitial());

  // key object of the login page form
  GlobalKey<FormState> formKey = GlobalKey();


  // controller object of email textField
  TextEditingController emailController = TextEditingController();

  // controller object of password textField
  TextEditingController passwordController = TextEditingController();

  // password showen & hiden variable
  bool obscurePassword = true;

  bool showindcator =false;
  // Show & Hide Password Method
  void togglePassword(){
    obscurePassword = !obscurePassword;
    emit(LogincontrollerSecured());
  }


  // Login  with email and password method
  void confirmLogin({required BuildContext context}) async {
    if (formKey.currentState!.validate()) {
          showindcator=true;
        try {
          UserCredential userCredential= await auth.signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

          user=await FirebaseUsersData.getInstance.fetech(id:userCredential.user!.uid);
           ProfilecontrollerCubit.instance.init();
           DashboardcontrollerCubit.instance.pageIndex=0;
           showindcator=false;
          context.showToastMessage = "Let's Start Our Journey.";
          Navigator.pushNamedAndRemoveUntil(context, Routes.GETSTARTED, (_) => true);

        } on FirebaseAuthException catch (e) {
          context.showToastMessage = e.code;
          throw(e.code);
        } catch (_) {
          context.showToastMessage = 'something went wrong ,please try again';
          rethrow;
        }

    }
  }
  // Login With Google Account Method
  Future<void> handleGoogleSignin({required BuildContext context}) async {
    await FireBaseModel.instance.handleGoogleSignIn(context: context);
  }

  // Logout From Google Account Method
  Future<void> handleGoogleSignout({required BuildContext context}) async {
    await FireBaseModel.instance.handleGoogleSignout(context: context);
  }
}
