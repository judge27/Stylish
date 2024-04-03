import 'package:flutter/material.dart';
import 'package:stylish/model/onboard_model.dart';
import 'package:stylish/view/signin.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({Key? key, required this.item, required this.index})
      : super(key: key);
  final List<OnBoardingModel> item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              item[index].pageNumber,
              style: const TextStyle(
                color: Color(0xFF000000),
                fontFamily: "Montserrat",
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "/3",
              style: TextStyle(
                color: Color(0xFFA0A0A1),
                fontFamily: "Montserrat",
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Signin.id);
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
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 1,
            ),
            Center(
              child: Image.asset(
                item[index].bannerImage,
                width: 300,
                height: 300,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              item[index].titleText,
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
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    item[index].prevText,
                    style: const TextStyle(
                      color: Color(0xFFC4C4C4),
                      fontFamily: "Montserrat",
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Image.asset(item[index].onBoardingImage),
                GestureDetector(
                  onTap: () {
                    if (item[index].nextPage ==  Signin()) {
                      Navigator.pushNamed(context, item[index].nextPage);
                    } else {
                      Navigator.pushNamed(context, item[index].nextPage);
                    }
                  },
                  child: Text(
                    item[index].nextText,
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
        ),
      ),
    );
  }
}
