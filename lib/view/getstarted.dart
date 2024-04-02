import 'package:flutter/material.dart';
import 'package:stylish/const.dart';
import 'package:stylish/model/custombutton_model.dart';
import 'package:stylish/widgets/login/backgroundimage_item.dart';
import 'package:stylish/widgets/login/custombutton_item.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);
  static const String id = "GetStartedPage";
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackgroundImage(),
      Scaffold(
        backgroundColor: kPrimaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 55, vertical: 25),
              child: CustomButtonItem(
                item: CustomButtonModel(
                    fontSize: 24,
                    titleColor: Colors.white,
                    fillColor: const Color(0xFFF83758),
                    boderColor: const Color(0xFFF83758),
                    boderRadius: 4,
                    title: "Get Started",
                    height: 55),
              ),
            )
          ],
        ),
      )
    ]);
  }
}
