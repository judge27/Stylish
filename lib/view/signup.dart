import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stylish/const.dart';
import 'package:stylish/model/auth_model.dart';
import 'package:stylish/model/custombutton_model.dart';
import 'package:stylish/model/textinput_model.dart';
import 'package:stylish/model/websiteslogo_model.dart';
import 'package:stylish/widgets/login/backgroundimage_item.dart';
import 'package:stylish/widgets/login/custombutton_item.dart';
import 'package:stylish/widgets/login/passwordinput_item.dart';
import 'package:stylish/widgets/login/textinput_item.dart';
import 'package:stylish/widgets/login/websitesicons_item.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Signup extends StatefulWidget {
  const Signup({
    Key? key,
  }) : super(key: key);

  static const String id = "SignupPage";

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
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
                        height: 50,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextInput(
                                  item: TextInputModel(
                                    onChange: (data) {
                                      AuthModel.email = data;
                                    },
                                    contentPadding: 15,
                                    boderColor: Colors.transparent,
                                    borderRadius: 16,
                                    hintColor: Colors.white,
                                    hintsize: 17,
                                    prefixIconColor: Colors.white,
                                    fillBorderColor:
                                    Colors.grey[600]!.withOpacity(0.5),
                                    inputType: TextInputType.emailAddress,
                                    inputAction: TextInputAction.next,
                                    hint: "Username or Email",
                                    prefixIcon: Icons.email,
                                  ),
                                ),
                                const SizedBox(height: 22),
                                PasswordInput(
                                  item: TextInputModel(
                                    onChange: (data) {
                                      AuthModel.password = data;
                                    },
                                    fillBorderColor:
                                    Colors.grey[600]!.withOpacity(0.5),
                                    prefixIcon: Icons.lock_outline_rounded,
                                    inputAction: TextInputAction.done,
                                    hint: "Password",
                                    contentPadding: 15,
                                    boderColor: Colors.transparent,
                                    borderRadius: 16,
                                    hintColor: Colors.white,
                                    hintsize: 17,
                                    prefixIconColor: Colors.white,
                                    inputType: TextInputType.emailAddress,
                                    obscureText: true,
                                    suffixIcon: CupertinoIcons.eye_slash_fill,
                                  ),
                                ),
                                const SizedBox(height: 22),
                                PasswordInput(
                                  item: TextInputModel(
                                    onChange: (data) {
                                      AuthModel.password2 = data;
                                    },
                                    fillBorderColor:
                                    Colors.grey[600]!.withOpacity(0.5),
                                    prefixIcon: Icons.lock_outline_rounded,
                                    inputAction: TextInputAction.done,
                                    hint: "Confirm Password",
                                    contentPadding: 15,
                                    boderColor: Colors.transparent,
                                    borderRadius: 16,
                                    hintColor: Colors.white,
                                    hintsize: 17,
                                    prefixIconColor: Colors.white,
                                    inputType: TextInputType.emailAddress,
                                    obscureText: true,
                                    suffixIcon: CupertinoIcons.eye_slash_fill,
                                  ),
                                ),
                              ],
                            ),
                             SizedBox(height: 30,),
                             Column(
                                children: [
                                  Container(
                                    child: CustomButtonItem(
                                      item: CustomButtonModel(
                                        fontSize: 20,
                                        onTap: () async {
                                          if (formKey.currentState!
                                              .validate()) {
                                            setState(() {
                                              isLoading = true;
                                            });
                                            try {
                                              await AuthModel.createUser();
                                              AuthModel.showSnackBar(context,
                                                  message: "Success.");
                                            } on FirebaseAuthException catch (e) {
                                              if (e.code == 'weak-password') {
                                                AuthModel.showSnackBar(context,
                                                    message:
                                                    "The password provided is too weak.");
                                              } else if (e.code ==
                                                  'email-already-in-use') {
                                                AuthModel.showSnackBar(context,
                                                    message:
                                                    "The account already exists for that email.");
                                              }
                                            } catch (e) {
                                              print(e);
                                            }
                                            setState(() {
                                              isLoading = false;
                                            });
                                          }
                                        },
                                        titleColor: Colors.white,
                                        fillColor: const Color(0xFFFF5656),
                                        boderColor: const Color(0xFFFF5656),
                                        boderRadius: 10,
                                        title: "Create Account",
                                        height: 55,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  WebsitesLogoItem(
                                    item: WebsitesLogoModel(

                                      accountText: "I Already Have an Account",
                                      signinText: "Login",
                                      accountColor: Colors.white,
                                      siginColor: const Color(0xFFF83758),
                                      onSignTaped: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
