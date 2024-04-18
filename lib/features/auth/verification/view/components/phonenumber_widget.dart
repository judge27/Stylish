import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:stylish/core/utils/context_extension.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/core/utils/firebase.dart';
import 'package:stylish/core/utils/validation.dart';
import 'package:stylish/features/auth/verification/controller/verificationcontroller_cubit.dart';

import '../../../../../const.dart';

class PhoneNumberWidget extends StatelessWidget {
  const PhoneNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                            IntlPhoneField(
                              controller: controller.phoneController,
                              onChanged: (data) {
                                controller.temp = data.countryCode;
                                controller.phoneController.text =
                                    data as String;
                              },
                              decoration: const InputDecoration(
                                  labelText: "Phone Number",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  )),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            InkWell(
                              onTap: () async {
                                controller.confirmSubmitPhoneNumber(
                                    context: context, controller: controller);
                              },
                              child: Core.coreButton("Submit"),
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
