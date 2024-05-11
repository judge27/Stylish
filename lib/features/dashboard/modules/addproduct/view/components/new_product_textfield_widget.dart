import 'package:flutter/material.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/features/dashboard/modules/addproduct/model/new_product_textfield_model.dart';

class NewProductTextFieldWidget extends StatelessWidget {
  const NewProductTextFieldWidget({super.key,required this.newProductTextFieldModel,});
 final NewProductTextFieldModel newProductTextFieldModel;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: newProductTextFieldModel.onValidate,
      controller: newProductTextFieldModel.textEditingController,
      keyboardType: newProductTextFieldModel.textInputType,
      decoration: newProductTextFieldModel.inputDecoration,
      style: Core.instance.authTextStyle,
    );
  }
}
