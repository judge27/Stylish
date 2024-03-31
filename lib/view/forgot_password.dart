import 'package:flutter/material.dart';
import 'package:stylish/model/custombutton_model.dart';
import 'package:stylish/model/textinput_model.dart';
import 'package:stylish/widgets/login/backgroundimage_item.dart';
import 'package:stylish/widgets/login/custombutton_item.dart';
import 'package:stylish/widgets/login/textinput_item.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackgroundImage(),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                Container(
                  height: 150,
                  child: const Center(
                    child: Text(
                      "Stylish",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: TextInput(
                    item: TextInputModel(
                      contentPadding: 15,
                      boderColor: Colors.transparent,
                      borderRadius: 16,
                      hintColor: Colors.white,
                      hintsize: 17,
                      prefixIconColor: Colors.white,
                      fillBorderColor: Colors.grey[600]!.withOpacity(0.5),
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.done,
                      hint: "Enter your email address",
                      prefixIcon: Icons.email,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 35),
                    child: Text(
                      "* We will send you a message to set or reset your new password",
                      style: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                    )),
                Column(
                  children: [
                    const SizedBox(
                      height: 63,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 35),
                      child: CustomButtonItem(
                        item: CustomButtonModel(
                            fontSize: 20,
                            titleColor: Colors.white,
                            fillColor: const Color(0xFFFF5656),
                            boderColor: const Color(0xFFFF5656),
                            boderRadius: 10,
                            title: "Submit",
                            height: 55),
                      ),
                    ),
                  ],
                )
              ]))))
    ]);
  }
}
