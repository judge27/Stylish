import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/core/utils/validation.dart';
import 'package:stylish/features/auth/phonenumber/controller/cubit/phonenumbercontroller_cubit.dart';


class PhoneNumberWidget extends StatelessWidget {
  const PhoneNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: BlocProvider<PhonenumbercontrollerCubit>(
              create: (context) => PhonenumbercontrollerCubit(),
              child: BlocBuilder<PhonenumbercontrollerCubit,
                  PhonenumbercontrollerState>(
                builder: (context, state) {
                  final PhonenumbercontrollerCubit controller =context.read<PhonenumbercontrollerCubit>();
                  return Form(
                      key: controller.phoneKey,
                      child: SizedBox(
                        height: context.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              "Mobile Number",
                              style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 35,
                                fontWeight: FontWeight.w700,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                            ),
                            const SizedBox(height: 20,),
                             SizedBox(
                              width: 350,
                              child: Text(
                                "Please enter your mobile phone Number",
                                style: TextStyle(
                                  color: Theme.of(context).splashColor,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w700,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            const SizedBox(
                              height: 80,
                            ),
                            // Phonefield with country code
                            IntlPhoneField(
                              autofocus: true,
                              initialCountryCode: 'EG',
                              validator: (value) {
                                Validation.instance.validatePhone(
                                    controller.phoneController.text);
                                return null;
                              },
                              controller: controller.phoneController,
                              onChanged: (data) {
                                controller.countrycode = data.countryCode;
                                controller.phoneController.text =
                                    data as String;
                              },
                              decoration: InputDecoration(
                                  labelText: "Phone Number",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                                  )),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            InkWell(
                              onTap: () async {
                                controller.confirmSubmitPhoneNumber(
                                    context: context,phoneNumberController: controller);
                              },
                              child: Core.instance.coreButton(buttonText: "Submit",context: context),
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
