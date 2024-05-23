import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:pinput/pinput.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/core/firebase/firebase.dart';
import 'package:stylish/core/utils/validation.dart';
import 'package:stylish/features/auth/phonenumber/controller/cubit/phonenumbercontroller_cubit.dart';
import 'package:stylish/features/auth/verification/controller/cubit/verificationcontroller_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VerificationWidget extends StatelessWidget {
  const VerificationWidget({super.key, required this.controller2});

  final PhonenumbercontrollerCubit controller2;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: MultiBlocProvider(
              providers: [
                BlocProvider<VerificationcontrollerCubit>(
                  create: (context) => VerificationcontrollerCubit(),
                ),
                BlocProvider<PhonenumbercontrollerCubit>.value(
                  value: controller2,
                ),
              ],
              child: BlocBuilder<VerificationcontrollerCubit,
                  VerificationcontrollerState>(
                builder: (context, state) {
                  final VerificationcontrollerCubit controller =context.read< VerificationcontrollerCubit>();
                  return Form(
                      key: controller.verificationKey,
                      child: SizedBox(
                        height: context.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              AppLocalizations.of(context)!.verification,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 35,
                                fontWeight: FontWeight.w700,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 400,
                              child: Text(
                                  AppLocalizations.of(context)!.entersexdigit+ "${countryCode+phoneNumber}",
                                style: const TextStyle(
                                  color: Color(0xffB3B3B3),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            const SizedBox(
                              height: 95,
                            ),
                            Pinput(
                                length: 6,
                                animationDuration:
                                    const Duration(milliseconds: 300),
                                controller: controller.verificationController,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  print(value);
                                  controller.smsCode = value;
                                },
                                autofocus: true,
                                forceErrorState: true,
                                pinputAutovalidateMode:
                                    PinputAutovalidateMode.onSubmit,
                                validator:(value)=> Validation.instance.
                                validateVerificationCode(context: context,
                                    value:value ),
                                obscuringCharacter: '*',
                                obscureText: false,
                                onCompleted: (value) async {
                                  await controller.confirmVerification(
                                    context: context,
                                  );
                                }),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                   Text(
                                     AppLocalizations.of(context)!.resendcodeinzero,
                                    style: TextStyle(
                                        color: Color(0xFFB3B3B3),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  TweenAnimationBuilder(
                                    tween: Tween(begin: 60.0, end: 0),
                                    onEnd: () {
                                      resendCode =
                                          true;
                                    },
                                    duration: const Duration(seconds: 60),
                                    builder: (context, input, child) => Text(
                                      '${input.toInt()}',
                                      style: const TextStyle(
                                          color: Color(0xFFB3B3B3),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ]),
                            const SizedBox(
                              height: 34,
                            ),
                            InkWell(
                              onTap: () async {
                                controller.onResendCode(
                                    context: context,
                                    phoneNumberController: controller2);
                              },
                              child: Core.instance.coreButton(buttonText:  AppLocalizations.of(context)!.resend,context: context),
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
