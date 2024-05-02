import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish/const.dart';
import 'package:stylish/core/extension/context_extension.dart';

class BigBanner extends StatelessWidget {
  const BigBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
        Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.asset(kBanner,width: context.width,fit: BoxFit.fitWidth,),
          Positioned(
            left: context.width/18,
            top: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "50-40% OFF",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Now in (product)",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "All colours",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  width: 100,
                  height: 32,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shop Now",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_outlined,
                        size: 18,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
        ),
          DotsIndicator(
            dotsCount: 3,
            position:1,
            reversed: false,
            mainAxisAlignment: MainAxisAlignment.center,
            decorator: DotsDecorator(
                size: const Size.square(7),
                activeColor: Colors.redAccent,
                activeSize: const Size(10.0, 10.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
          )
        ]);
  }
}