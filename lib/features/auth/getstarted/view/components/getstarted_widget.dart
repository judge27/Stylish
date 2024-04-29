import 'package:flutter/material.dart';
import 'package:stylish/const.dart';
import 'package:stylish/core/utils/context_extension.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/features/auth/getstarted/view/components/background_image_widget.dart';

class GetStartedWidget extends StatelessWidget {
  const GetStartedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackgroundImageWidget(),
      Scaffold(
          backgroundColor: kPrimaryColor,
          body: SizedBox(
            height: context.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(
                  flex: 10,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  child: const Text(
                    "You want Authentic, here you go!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 43,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                  ),
                ),
                const Text(
                  "Find it here, buy it now!",
                  style: TextStyle(
                    color: Color(0xFFF2F2F2),
                    fontSize: 20,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'dashboard');
                    },
                    child: Core().coreButton(buttonText: "Get Started", context: context),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ))
    ]);
  }
}
