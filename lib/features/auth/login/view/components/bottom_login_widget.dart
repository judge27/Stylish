import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/const.dart';
import 'package:stylish/core/utils/context_extension.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/features/auth/login/controller/logincontroller_cubit.dart';

class BottomLoginWidget extends StatelessWidget {
  const BottomLoginWidget({super.key, required this.controller});
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
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Core().coreButton(buttonText: "Login",  context: context),
                  ));
            },
          ),
        ),
        SizedBox(
          height: context.height/120,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            "- OR Continue with -",
            style: TextStyle(
              color: Theme.of(context).splashColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: context.height/20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async{
               await controller.handleGoogleSignin(context: context);
              },
              child: CircleAvatar(
                radius: 33.5,
                backgroundColor: Theme.of(context).primaryColor,
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: const Color(0xFFFFFFFF),
                  child: Image.asset(kGoogle),
                ),
              ),
            ),
             SizedBox(
              width: context.width/10,
            ),
            GestureDetector(
              onTap: () async{
               await controller.handleGoogleSignout(context:context);
              },
              child: CircleAvatar(
                radius: 33.5,
                backgroundColor: Theme.of(context).primaryColor,
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: const Color(0xFFFFFFFF),
                  child: Image.asset(kApple),
                ),
              ),
            ),
            SizedBox(
              width: context.width/10,
            ),
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 33.5,
                backgroundColor: Theme.of(context).primaryColor,
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: const Color(0xFFFFFFFF),
                  child: Image.asset(kFacebook),
                ),
              ),
            ),
          ],
        ),
         SizedBox(
           height: context.height/1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                "Create An Account",
                style: TextStyle(
                  color: Theme.of(context).splashColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
             SizedBox(
              width: 1,
            ),
            Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'registration');
                },
                child: Text("Sign Up",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
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
