import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:stylish/features/auth/onboarding/controller/onbarding_controller_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingWidget extends StatelessWidget {
  OnboardingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnbardingControllerCubit>(
        create: (context) => OnbardingControllerCubit(),
        child: BlocBuilder<OnbardingControllerCubit, OnbardingControllerState>(
            builder: (context, state) {
          OnbardingControllerCubit controller = OnbardingControllerCubit();
          return Scaffold(
            appBar: AppBar(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      controller.onSkipButton(context);
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(
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
                      controller: controller.pageController,
                      children: List.generate(controller.body.length, (index) {
                        return Column(
                          children: [
                            const Spacer(
                              flex: 1,
                            ),
                            Center(
                              child: Image.asset(
                                controller.body[index].image,
                                width: 300,
                                height: 300,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              controller.body[index].title,
                              style: const TextStyle(
                                color: Color(0xFF000000),
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const SizedBox(
                                child: Text(
                              "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit",
                              style: TextStyle(
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
                                const SizedBox(),
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
                                index == controller.body.length - 1
                                    ? GestureDetector(
                                        onTap: () => controller.changeNextPage(
                                            index: index, context: context),
                                        child: const Text(
                                          "Next",
                                          style: TextStyle(
                                            color: Color(0xFFF83758),
                                            fontFamily: "Montserrat",
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            )
                          ],
                        );
                      }),
                    )),
                  ],
                )),
          );
        }));
  }
}
