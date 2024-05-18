import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/firebase_users_data.dart';

part 'changepassword_state.dart';

class ChangepasswordCubit extends Cubit<ChangepasswordState> {
  ChangepasswordCubit() : super(ChangepasswordInitial());

  // key object of the registrationPage form
  GlobalKey<FormState> formKey = GlobalKey();

  // controller object of currnetPassowrd textField
  TextEditingController currentPasswordController = TextEditingController();

  // controller object of newPassword textField
  TextEditingController newPasswordController = TextEditingController();

  // controller object of repeatNewPassword textField
  TextEditingController repeatNewPasswordController = TextEditingController();

  // CurrentPassword showen & hiden variable
  bool obscureCurrentPassword = true;

  // NewPassword showen & hiden variable
  bool obscureNewPassword = true;

  // RepeatNewPassword showen & hiden variable
  bool obscureRepeatNewPassword = true;

  // Show & Hide Password Method
  void toggleCurrentPassword() {
    obscureCurrentPassword = !obscureCurrentPassword;
    emit(ChangepasswordSecured());
  }
  // Show & Hide Password Method
  void toggleNewPassword() {
    obscureNewPassword = !obscureNewPassword;
    emit(ChangepasswordSecured());
  }
  // Show & Hide Password Method
  void toggleRepeatNewPassword() {
    obscureRepeatNewPassword = !obscureRepeatNewPassword;
    emit(ChangepasswordSecured());
  }
  void onSaveChanges({required BuildContext context})async{
    if(formKey.currentState!.validate()){
      if(currentPasswordController.text==user.password) {
        if (user.password != newPasswordController.text) {
          await auth.currentUser!.updatePassword(newPasswordController.text);
          user.password = newPasswordController.text;
          Map<String, dynamic> model = {
            'Password': newPasswordController.text,
          };
          await FirebaseUsersData.getInstance.updateSingleField(model);
          context.showToastMessage = "Password Updated Successfully";
          context.pop;
        }
        else {
          context.showToastMessage = "Enter New Password";

        }
      }
      else {
        context.showToastMessage="Current Password is not Correct";
      }
    }

  }

}
