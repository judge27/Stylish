import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/const.dart';
import 'package:stylish/core/utils/context_extension.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/features/auth/registration/controller/registrationcontroller_cubit.dart';

class BottomRegistrationWidget extends StatelessWidget {
  const BottomRegistrationWidget({super.key, required this.controller});

  final RegistrationcontrollerCubit controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.height / 2.55,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, ),
          child: Column(
            children: [
              BlocProvider<RegistrationcontrollerCubit>.value(
                value: controller,
                child: BlocBuilder<RegistrationcontrollerCubit, RegistrationcontrollerState>(
                  builder: (context, state) {
                    return InkWell(
                      onTap: () => controller.confirmRegistration(context),
                      child:
                      Padding(
                        padding: EdgeInsets.only(bottom: 25),
                        child:    Core.coreButton("Create Account"),
                      )
                    );
                  },
                ),
              ),
              SizedBox(height: 20,),
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
                    onTap: () {},
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
                    onTap: () {},
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
                    onTap: () {},
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
                      "I Already Have an Account",
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
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Login",
                          style: TextStyle(
                            color: Color(0xFFF83758),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}
