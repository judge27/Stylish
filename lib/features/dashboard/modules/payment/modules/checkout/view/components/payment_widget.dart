import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/models/textfield_model.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/core/utils/validation.dart';
import 'package:stylish/features/auth/registration/view/component/textfield_widget.dart';
import 'package:stylish/features/dashboard/controller/cubit/dashboardcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/payment/controller/cubit/paymentcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/users/controller/cubit/usercontroller_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../../../const.dart';

class PaymentWidget extends StatelessWidget {
   PaymentWidget({Key? key, required this.cubit}) : super(key: key);
   PaymentcontrollerCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentcontrollerCubit>.value(
  value: cubit,
  child: BlocBuilder<PaymentcontrollerCubit, PaymentcontrollerState>(
  builder: (context, state) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          // key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(
                width: double.infinity,
                child: Divider(
                  thickness: 1.1,
                  color: Theme.of(context).hintColor,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
               Row(
                children: [
                   Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      AppLocalizations.of(context)!.order,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Text(
                      (cubit.prodcutPrice*cubit.Qty).toString(),
                      style:  TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
               Row(
                children: [
                   Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      AppLocalizations.of(context)!.shipping,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Text(
                      cubit.deliveryFee.toString(),
                      style:  TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
               Row(
                children: [
                   Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      AppLocalizations.of(context)!.total,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Text("${cubit.deliveryFee+(cubit.prodcutPrice*cubit.Qty)}",
                      style:  TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
               SizedBox(
                width: double.infinity,
                child: Divider(
                  thickness: 2,
                  endIndent: 10,
                  indent: 10,
                  color: Theme.of(context).hintColor,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
               Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  AppLocalizations.of(context)!.payment,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: TextFieldWidget(
                  model: TextFieldModel(
                    readOnly: true,
                    textAlign: TextAlign.end,

                    inputDecoration: Core.instance
                        .authInputDecoration(context)
                        .copyWith(
                        suffixIcon: Padding(
                          padding: const EdgeInsetsDirectional.only(end: 5.0,top: 10),
                          child: Text(
                            user.cardNumber!=null?"*********"+user.cardNumber.toString().substring(user.cardNumber.toString().length - 4):"No Card Number",
                            style: const TextStyle(
                              color: Color(0xFF6E7179),
                              fontSize: 15,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                            hintText: "",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 15.0),
                              child: Image.asset(
                                kVISA, // Replace 'assets/logo.png' with the path to your image
                                width:
                                    47.83, // Adjust the width of the image as needed
                                height:
                                    20, // Adjust the height of the image as needed
                              ),
                            ),
                            labelStyle: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 20)),
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: TextFieldWidget(
                  model: TextFieldModel(
                    readOnly: true,
                    textAlign: TextAlign.end,

                    inputDecoration: Core.instance
                        .authInputDecoration(context)
                        .copyWith(
                        suffixIcon: Padding(
                          padding: const EdgeInsetsDirectional.only(end: 5.0,top: 10),
                          child: Text(
                            user.cardNumber!=null?"*********"+user.cardNumber.toString().substring(user.cardNumber.toString().length - 4):"No Card Number",
                            style: const TextStyle(
                                color: Color(0xFF6E7179),
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        hintText: "",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 15.0),
                              child: Image.asset(
                                kPaypal, // Replace 'assets/logo.png' with the path to your image
                                width:
                                    62.76, // Adjust the width of the image as needed
                                height:
                                    20, // Adjust the height of the image as needed
                              ),
                            ),
                            labelStyle: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 20)),
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: TextFieldWidget(
                  model: TextFieldModel(
                    readOnly: true,
                    textAlign: TextAlign.end,
                    inputDecoration: Core.instance
                        .authInputDecoration(context)
                        .copyWith(
                        suffixIcon: Padding(
                          padding: const EdgeInsetsDirectional.only(end: 5.0,top: 10),
                          child: Text(
                            user.cardNumber!=null?"*********"+user.cardNumber.toString().substring(user.cardNumber.toString().length - 4):"No Card Number",
                            style: const TextStyle(
                                color: Color(0xFF6E7179),
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        hintText: "",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 15.0),
                              child: Image.asset(
                                kMaestro, // Replace 'assets/logo.png' with the path to your image
                                width:
                                    20, // Adjust the width of the image as needed
                                height:
                                    20, // Adjust the height of the image as needed
                              ),
                            ),
                            labelStyle: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 20)),
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: TextFieldWidget(
                  model: TextFieldModel(
                    readOnly: true,
                    textAlign: TextAlign.end,

                    inputDecoration: Core.instance
                        .authInputDecoration(context)
                        .copyWith(
                        suffixIcon: Padding(
                          padding: const EdgeInsetsDirectional.only(end: 5.0,top: 10),
                          child: Text(
                            user.cardNumber!=null?"*********"+user.cardNumber.toString().substring(user.cardNumber.toString().length - 4):"No Card Number",
                            style: const TextStyle(
                                color: Color(0xFF6E7179),
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        hintText: "",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 15.0),
                              child: Image.asset(
                                kApple, // Replace 'assets/logo.png' with the path to your image
                                width:
                                    20, // Adjust the width of the image as needed
                                height:
                                    20, // Adjust the height of the image as needed
                              ),
                            ),
                            labelStyle: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 20)),
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  width: 400, // Set the width of the container
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () {
                      if(user.cardNumber!=null || user.cardNumber!="") {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {

                            return AlertDialog(
                              contentPadding:
                              EdgeInsets.zero, // Remove default padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              backgroundColor:
                              Colors.white, // Set background color to white
                              content: Container(
                                width: context
                                    .width, // Set the width of the container
                                padding: const EdgeInsets.all(
                                    45), // Add padding to the content
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      kStarsssssImage,
                                      // Path to your image asset
                                      width: 500, // Adjust width as needed
                                      height: 150, // Adjust height as needed
                                    ),
                                    const SizedBox(
                                        height:
                                        20),
                                    // Add some space between image and text
                                    Text(
                                      AppLocalizations.of(context)!.paymentdonesuccessfully,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                        Timer(const Duration(seconds: 1), () {
                          DashboardcontrollerCubit.instance.pageIndex=0;
                          Navigator.pushNamedAndRemoveUntil(context, Routes.DASHBOARD, (route) => false);
                        }
                        );

                      }
                    },
                    child: Core.instance.coreButton(
                      buttonText: AppLocalizations.of(context)!.gettcontinue,
                      context: context,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  },
),
);
  }
}
