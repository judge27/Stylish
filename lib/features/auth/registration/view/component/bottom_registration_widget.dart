import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/const.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/features/auth/registration/controller/cubit/registrationcontroller_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomRegistrationWidget extends StatelessWidget {
  const BottomRegistrationWidget({super.key, required this.controller});

  final RegistrationcontrollerCubit controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.height / 2.5,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width / 25),
          child: BlocProvider<RegistrationcontrollerCubit>.value(
            value: controller,
            child: BlocBuilder<RegistrationcontrollerCubit,
                RegistrationcontrollerState>(
              builder: (context, state) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.confirmRegistration(context);
                      },
                      child: SizedBox(
                        height: context.height / 12,
                        child: Core.instance.coreButton(
                            buttonText: AppLocalizations.of(context)!.signup, context: context),
                      ),
                    ),
                    SizedBox(
                      height: context.height / 72,
                    ),
                    Container(
                      height: context.height / 18,
                      alignment: Alignment.center,
                      child: Text(
                        AppLocalizations.of(context)!.or,
                        style: TextStyle(
                          color: Theme.of(context).splashColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.height / 72,
                    ),
                    SizedBox(
                      height: context.height / 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await controller.handleGoogleSignin(
                                  context: context);
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
                            width: context.width / 8,
                          ),
                          GestureDetector(
                            onTap: () async {
                              await controller.handleGoogleSignout(
                                  context: context);
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
                            width: context.width / 8,
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
                    ),
                    SizedBox(height: context.height / 72),
                    SizedBox(
                      height: context.height / 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              AppLocalizations.of(context)!.haveaccount,
                              style: TextStyle(
                                color: Theme.of(context).splashColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.width / 25,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(AppLocalizations.of(context)!.login,
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
                    ),
                    SizedBox(
                      height: context.height / 72,
                    )
                  ],
                );
              },
            ),
          ),
        ));
  }
}
