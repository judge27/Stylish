import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Validation {

  static Validation instance = Validation._init();

  Validation._init();

  // Name validation method
  String? validateName({required BuildContext context,String? value}) {
    if(value==null || value.isEmpty){
      return AppLocalizations.of(context)!.namerequired;
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return AppLocalizations.of(context)!.nameatleastupper;
    }
    return null;
  }

  // Email validation method
  String? validateEmail({required BuildContext context,String? value}) {

    if(value==null || value.isEmpty){
      return AppLocalizations.of(context)!.emailrequired;
    }

    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

    final regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return AppLocalizations.of(context)!.emailinvalid;
   }
    return null;

  }

  // Password validation method
  String? validatePassword({required BuildContext context,String? value}) {

    if(value==null || value.isEmpty){
      return AppLocalizations.of(context)!.passwordrequired;
    }

    if(value.length<6) {
      return AppLocalizations.of(context)!.passwordatleastsix;
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return AppLocalizations.of(context)!.passwordatleastuppercase;
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return AppLocalizations.of(context)!.passwordatleastonenumber;
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return AppLocalizations.of(context)!.passwordatleastspecial;
    }
    return null;
  }
  // Phone Number validation method

  bool validatePhone({required BuildContext context,String? value}){
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
  String? validateVerificationCode({required BuildContext context,String? value}) {
    if (value!.length < 6) {
      return "Code is Required";
    } else {
      return null;
    }
  }

}

