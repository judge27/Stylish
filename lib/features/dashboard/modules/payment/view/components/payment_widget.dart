import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/core/utils/validation.dart';
import 'package:stylish/features/auth/registration/model/textfield_model.dart';
import 'package:stylish/features/auth/registration/view/component/textfield_widget.dart';
import 'package:stylish/features/dashboard/modules/users/controller/cubit/usercontroller_cubit.dart';

import '../../../../../../const.dart';


class PaymentWidget extends StatelessWidget {
  const PaymentWidget({
    Key? key, // Add Key parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsercontrollerCubit>(
      create: (context) => UsercontrollerCubit(),
      child: BlocBuilder<UsercontrollerCubit, UsercontrollerState>(
        builder: (context, state) {
          UsercontrollerCubit controller = context.read<UsercontrollerCubit>();
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric( horizontal: 10),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40, right : context.width/11), // Add padding above the first row
                      child:
                      Row(
                        children: [
                          Container(
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 32,
                              color: Colors.black,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: const Text(
                                "Checkout",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: const Divider(
                        thickness: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                    Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                    "Order",
                     style: TextStyle(
                     fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFA8A8A9),
                                ),
                              ),
                            ),
                        const Spacer() , Padding(
                          padding: EdgeInsets.only(right: 25),
                          child: Text(
                            "7,000",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFA8A8A9),
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
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      "Shipping",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFA8A8A9),
                      ),
                    ),
                  ),
                  const Spacer() , Padding(
                    padding: EdgeInsets.only(right: 25),
                    child: Text(
                      "70",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFA8A8A9),
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
                          padding: EdgeInsets.only(left: 25),
                          child: Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF4C5059),
                            ),
                          ),
                        ),
                        const Spacer() , Padding(
                          padding: EdgeInsets.only(right: 25),
                          child: Text(
                            "7070",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF4C5059),
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
                      child: const Divider(
                        thickness: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        "Payment",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF222222),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 18, right: 18),
                      child:
                      TextFieldWidget(
                        model: TextFieldModel(
                          inputDecoration:
                          Core.instance.authInputDecoration(context).copyWith( hintText: "",  prefixIcon: Padding(
                            padding: const EdgeInsets.only(left : 10.0 , right: 15.0),
                            child: Image.asset(
                              kVISA, // Replace 'assets/logo.png' with the path to your image
                              width: 47.83, // Adjust the width of the image as needed
                              height: 20, // Adjust the height of the image as needed
                            ),
                          ),
                              labelStyle: TextStyle(color: Theme.of(context).hintColor , fontWeight: FontWeight.w600,
                                  fontSize: 20) ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 18, right: 18),
                      child:
                      TextFieldWidget(
                        model: TextFieldModel(
                          inputDecoration:
                          Core.instance.authInputDecoration(context).copyWith( hintText: "", prefixIcon: Padding(
                            padding: const EdgeInsets.only(left : 10.0 , right: 15.0),
                            child: Image.asset(
                              kPaypal, // Replace 'assets/logo.png' with the path to your image
                              width: 62.76, // Adjust the width of the image as needed
                              height: 20, // Adjust the height of the image as needed
                            ),
                          ),
                              labelStyle: TextStyle(color: Theme.of(context).hintColor , fontWeight: FontWeight.w600,
                                  fontSize: 20) ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 18, right: 18),
                      child:
                      TextFieldWidget(
                        model: TextFieldModel(
                          inputDecoration:
                          Core.instance.authInputDecoration(context).copyWith( hintText: "", prefixIcon: Padding(
                            padding: const EdgeInsets.only(left : 10.0 , right: 15.0),
                            child: Image.asset(
                              kMaestro, // Replace 'assets/logo.png' with the path to your image
                              width: 20, // Adjust the width of the image as needed
                              height: 20, // Adjust the height of the image as needed
                            ),
                          ),
                              labelStyle: TextStyle(color: Theme.of(context).hintColor , fontWeight: FontWeight.w600,
                                  fontSize: 20) ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 18, right: 18),
                      child:
                      TextFieldWidget(
                        model: TextFieldModel(
                          inputDecoration:
                          Core.instance.authInputDecoration(context).copyWith( hintText: "",prefixIcon: Padding(
                            padding: const EdgeInsets.only(left : 10.0 , right: 15.0),
                            child: Image.asset(
                              kApple, // Replace 'assets/logo.png' with the path to your image
                              width: 20, // Adjust the width of the image as needed
                              height: 20, // Adjust the height of the image as needed
                            ),
                          ),
                              labelStyle: TextStyle(color: Theme.of(context).hintColor , fontWeight: FontWeight.w600,
                                  fontSize: 20) ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 18, right: 18),
                      child: Container(
                        width: 400, // Set the width of the container
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  contentPadding: EdgeInsets.zero, // Remove default padding
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  backgroundColor: Colors.white, // Set background color to white
                                  content: Container(
                                    width: context.width, // Set the width of the container
                                    padding: EdgeInsets.all(45), // Add padding to the content
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          kStarsssssImage, // Path to your image asset
                                          width: 500, // Adjust width as needed
                                          height: 150, // Adjust height as needed
                                        ),
                                        SizedBox(height: 20), // Add some space between image and text
                                        Text(
                                          "Payment done successfully.",
                                          style: TextStyle(
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
                          },
                          child: Core.instance.coreButton(
                            buttonText: "Continue",
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