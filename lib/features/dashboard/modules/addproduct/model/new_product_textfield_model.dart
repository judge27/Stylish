import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewProductTextFieldModel{
TextEditingController textEditingController;
TextInputType? textInputType;
InputDecoration inputDecoration;
NewProductTextFieldModel({required this.textEditingController,this.textInputType,required this.inputDecoration});


String? onValidate(String? value){
  if(value!.isEmpty){
    return "Required Data";
  }
}

}