import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/const.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/features/auth/login/controller/logincontroller_cubit.dart';

class BottomLoginWidget extends StatelessWidget {
  const BottomLoginWidget({super.key,required this.controller});
  final LogincontrollerCubit controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BlocProvider<LogincontrollerCubit>.value(
              value: controller,
              child: BlocBuilder<LogincontrollerCubit, LogincontrollerState>(
                builder: (context, state) {
                  return InkWell(
                      onTap: () {
                       controller.confirmLogin(context: context);
                      },
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 25),
                        child:    Core.coreButton("Login"),
                      )
                  );
                },
              ),
            ),
            SizedBox(height: 40,),
            Container(
              alignment: Alignment.center,
              child: const Text(
                "- OR Continue with -",
                style: TextStyle(
                  color: Color(0xFF575757),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){},
                  child: CircleAvatar(
                    radius: 33.5,
                    backgroundColor: const Color(0xFFF83758),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: const Color(0xFFFFFFFF),
                      child: Image.asset(kGoogle),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: (){},
                  child: CircleAvatar(
                    radius: 33.5,
                    backgroundColor: const Color(0xFFF83758),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: const Color(0xFFFFFFFF),
                      child: Image.asset(kApple),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 28,
                ),
                GestureDetector(
                  onTap: (){},
                  child: CircleAvatar(
                    radius: 33.5,
                    backgroundColor: const Color(0xFFF83758),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: const Color(0xFFFFFFFF),
                      child: Image.asset(kFacebook),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Create An Account",
                    style: TextStyle(
                      color: Color(0xFF575757),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, 'registration');
                    },
                    child: const Text("Sign Up",
                        style: TextStyle(
                          color: Color(0xFFF83758),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        )),
                  ),
                ),
              ],
            ),
          ],
        );
  }
}
