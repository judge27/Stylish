import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:path/path.dart';
import 'package:pinput/pinput.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/core/utils/validation.dart';
import 'package:stylish/features/dashboard/modules/users/modules/phonenumber/controller/cubit/changephonenumber_cubit.dart';

class ChangePhoneNumberWidget extends StatelessWidget {
  const ChangePhoneNumberWidget({super.key, required this.cubit});
  final ChangephonenumberCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangephonenumberCubit>.value(
        value: cubit,
        child: BlocBuilder<ChangephonenumberCubit, ChangephonenumberState>(
            builder: (context, state) {
          return SizedBox(

              width: context.width,
              child: Form(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: context.height / 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: context.height / 16,
                                  child: Text(
                                    "Change Phone Number",
                                    style: TextStyle(
                                        color: Theme.of(context).hintColor,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700),

                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: context.height / 16,
                            ),
                            // Phonefield with country code
                            SizedBox(
                              child: IntlPhoneField(
                                autofocus: true,
                                initialCountryCode:countryCode,
                                validator: (value) {
                                  Validation.instance.validatePhone(
                                      context: context,
                                      value: cubit.phoneController.text);
                                  return null;
                                },
                                controller: cubit.phoneController,
                                onChanged: (data) {
                                  countryCode = data.countryCode;
                                  cubit.phoneController.text = data as String;
                                },
                                decoration: InputDecoration(
                                    labelText:
                                        AppLocalizations.of(context)!.phonenumber,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: context.height / 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                               SizedBox(
                                    height: context.height/16,
                                    width: context.width/2,
                                    child: InkWell(
                                        onTap: (){
                                          cubit.onSendOTP(
                                              context: context,
                                              phoneNumberController: cubit
                                          );
                                        },
                                        child: Core.instance.coreButton(

                                            buttonText: " Send OTP ",
                                            context: context)
                                    ),
                                  ),
                                SizedBox(
                                  height: context.height / 16,
                                ),
                                Pinput(
                                  length: 6,
                                  animationDuration:
                                  const Duration(milliseconds: 300),
                                  controller: cubit.verificationController,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    print(value);
                                    cubit.smsCode = value;
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
                                ),

                              ],
                            )
                          ]))));
        }));
  }
}
