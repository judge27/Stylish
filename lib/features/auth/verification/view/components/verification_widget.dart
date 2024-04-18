import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:stylish/const.dart';
import 'package:stylish/core/utils/context_extension.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/core/utils/navigation.dart';
import 'package:stylish/features/auth/verification/controller/verificationcontroller_cubit.dart';

class VerificationWidget extends StatelessWidget {
  const VerificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var code;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
        child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: BlocProvider<VerificationcontrollerCubit>(
              create: (context) => VerificationcontrollerCubit(),
              child: BlocBuilder<VerificationcontrollerCubit,
                  VerificationcontrollerState>(
                builder: (context, state) {
                  final VerificationcontrollerCubit controller =
                      VerificationcontrollerCubit();
                  return Form(
                      key: controller.formKey,
                      child: Container(
                        height: context.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(
                              flex: 3,
                            ),
                            // Screen title Text // Input Phone Number!
                            Image.asset(
                              kAuth,
                              width: 180,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Phone Number",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            // Phonefield with country code
                            Pinput(
                              onChanged: (value) {
                                code = value;
                              },
                              pinputAutovalidateMode:
                                  PinputAutovalidateMode.onSubmit,
                              showCursor: true,
                              length: 6,
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            InkWell(
                              onTap: () async {
                                await controller.confirmVerification(
                                    context: context, code: code);
                              },
                              child: Core.coreButton("Verifiy"),
                            ),
                            const Spacer(
                              flex: 5,
                            ),
                          ],
                        ),
                      ));
                },
              ),
            )));
  }
}
