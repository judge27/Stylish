import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:stylish/features/auth/onboarding/controller/cubit/onboarding_controller_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingControllerCubit>(
        create: (context) => OnboardingControllerCubit(),
        child: BlocBuilder<OnboardingControllerCubit, OnboardingControllerState>(
            builder: (context, state) {
          OnboardingControllerCubit controller = context.read<OnboardingControllerCubit>();
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
              appBar: AppBar(
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.onSkipButton(context);
                      },
                      child:  Text(
                        AppLocalizations.of(context)!.skip,
                        style: const TextStyle(
                          color: Color(0xFF000000),
                          fontFamily: "Montserrat",
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              body: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: PageView(
                            onPageChanged: (index){
                              controller.pageIndex=index;
                              },
                        controller: controller.pageController,
                        children: List.generate(controller.pages.length, (index) {
                          return Column(
                            children: [
                              const Spacer(
                                flex: 1,
                              ),
                              Center(
                                child: Image.asset(
                                  controller.pages[index].image,
                                  width: 300,
                                  height: 300,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                               controller.pageIndex==0?
                               AppLocalizations.of(context)!.chooseproducts
                                   :controller.pageIndex==1?
                               AppLocalizations.of(context)!.makepayment
                                   : AppLocalizations.of(context)!.getorder,
                                style: const TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                               SizedBox(
                                  child: Text(
                               AppLocalizations.of(context)!.onbarding,
                                style: const TextStyle(
                                  color: Color(0xFFA8A8A9),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300,
                                ),
                                maxLines: 3,
                                textAlign: TextAlign.center,
                              )),
                              const Spacer(
                                flex: 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () => controller.changePrevPage(
                                        index: controller.pageIndex,
                                        context: context),
                                    child:  Text(
                                    controller.pageIndex==0?"":
                                    AppLocalizations.of(context)!.prev,
                                      style: const TextStyle(
                                        color: Color(0xFFF83758),
                                        fontFamily: "Montserrat",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      child: DotsIndicator(
                                    dotsCount: 3,
                                    position: index.toDouble(),
                                    reversed: false,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    decorator: DotsDecorator(
                                        size: const Size.square(9),
                                        activeColor: Colors.redAccent,
                                        activeSize: const Size(18.0, 9.0),
                                        activeShape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5),
                                        )),
                                  )),
                                   GestureDetector(
                                          onTap: () => controller.changeNextPage(
                                              index: controller.pageIndex, context: context),
                                          child:  Text(
                                          controller.pageIndex==2?
                                            AppLocalizations.of(context)!.getstarted:AppLocalizations.of(context)!.next,
                                            style: const TextStyle(
                                              color: Color(0xFFF83758),
                                              fontFamily: "Montserrat",
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                ],
                              )
                            ],
                          );
                        }),
                      )),
                    ],
                  )),
            ),
          );
        }));
  }
}
