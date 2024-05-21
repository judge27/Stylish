import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/firebase_users_data.dart';

part 'paymenyinfo_state.dart';

class PaymenyinfoCubit extends Cubit<PaymenyinfoState> {
  static PaymenyinfoCubit instance =PaymenyinfoCubit();
  PaymenyinfoCubit() : super(PaymenyinfoInitial());
  bool isLightTheme = false;
  String cardNumber = user.cardNumber??'';
  String expiryDate = user.expiryDate??'';
  String cardHolderName = user.cardHolderName??'';
  String cvvCode = user.cvvCode??'';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  bool useFloatingAnimation = true;
  final OutlineInputBorder border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey.withOpacity(0.7),
      width: 2.0,
    ),
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void change(){
    emit(PaymenyinfoChanged());
  }
  void saveUserCard({required BuildContext context})async{
    if(formKey.currentState!.validate()) {
     Map<String,dynamic> json =  {
       'cardHolderName': cardHolderName,
       'expiryDate': expiryDate,
       'cardNumber': cardNumber,
       'cvvCode': cvvCode,
     };
     await FirebaseUsersData.getInstance.updateSingleField(json);
     context.showToastMessage="Your Card Add Successfully";
     context.pop;
    }
  }
}
