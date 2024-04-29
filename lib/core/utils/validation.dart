
class Validation {

  static Validation instance = Validation._init();

  Validation._init();

  // Name validation method
  String? validateName(String? value) {
    if(value==null || value.isEmpty){
      return 'Password is required.';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    return null;
  }

  // Email validation method
  String? validateEmail(String? value) {

    if(value==null || value.isEmpty){
      return 'Email is required.';
    }

    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

    final regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Invalid email address.';
   }
    return null;

  }

  // Password validation method
  String? validatePassword(String? value) {

    if(value==null || value.isEmpty){
      return 'Password is required.';
    }

    if(value.length<6) {
      return 'Password must be at least 6 characters long.';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    return null;
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
      return "Code is Required";
    } else {
      return null;
    }
  }

}

