
import 'package:stylish/features/auth/verification/controller/verificationcontroller_cubit.dart';

class Validation {
  // Name validation method
  String? validateName(String? input) {
    final RegExp alphaExp = RegExp('[a-zA-Z]');
    if (alphaExp.hasMatch(input!)) {
      return null;
    } else {
      return 'Only Alphabets are allowed in a username';
    }
  }

  // Email validation method
  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Please enter Email';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter a valid email address';
      } else {
        return null;
      }
    }
  }

  // Password validation method
  String? validatePassword(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value!.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }
  // Phone Number validation method

  bool validatePhone(String? value){
    RegExp regExp=RegExp(r'^(?:[+0]9)?[0-9]{10}$');
    bool isPhoneValidated = false;
    if (value!.isEmpty) {
      return isPhoneValidated;
    } else {
      if(regExp.hasMatch(value)) {
        isPhoneValidated = true;
        return isPhoneValidated;
      }
      else{
        return isPhoneValidated;
    }
    }
  }

  //  smsCode validation method
  String? validateVerificationCode(String? value) {
    if (value!.length < 6) {
      return "Please Enter The Code";
    } else {
      return null;
    }
  }
}

