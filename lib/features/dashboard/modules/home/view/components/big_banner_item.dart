import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish/const.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/features/dashboard/modules/home/controller/cubit/homecontroller_cubit.dart';

class BigBanner extends StatelessWidget {
  const BigBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Image.asset(kBanner,width: context.width,fit: BoxFit.fitWidth,),
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