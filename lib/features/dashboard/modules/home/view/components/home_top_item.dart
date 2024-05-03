import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/features/auth/registration/model/textfield_model.dart';
import 'package:stylish/features/auth/registration/view/component/textfield_widget.dart';
import 'package:stylish/features/dashboard/modules/home/controller/cubit/homecontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/controller/cubit/productscontroller_cubit.dart';

class HomeTopWidget extends StatelessWidget {
  const HomeTopWidget({super.key,required this.homeTitle});
  final String homeTitle;
  @override
  Widget build(BuildContext context) {
    return  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  child: TextFieldWidget(
                    model: TextFieldModel(
                        textStyle: Core.instance.authTextStyle,
                        inputDecoration:
                            Core.instance.authInputDecoration(context).copyWith(
                                prefixIcon: const Icon(CupertinoIcons.search),
                                hintText: "Search any Product..",
                                hintStyle: const TextStyle(
                                  color: Color(0xFFBBBBBB),
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w400,
                                ),
                                suffixIcon: const Icon(CupertinoIcons.mic))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                       homeTitle ,
                      style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Container(

                      width: 70,
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),

                        color:Colors.white,
                      ),
                      child: const Row(
                        children: [
                          Text(
                            "Sort",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_upward_rounded,
                            size: 14,
                            color: Colors.black,
                          ),
                          Icon(
                            Icons.arrow_downward_rounded,
                            size: 14,
                            color: Colors.black,

                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    Container(
                      width: 70,
                      height: 30,
                      margin: const EdgeInsets.only(right: 4),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                      child: const Row(
                        children: [
                          Text(
                            "Filter",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Spacer(),
                          Icon(
                            Icons.filter_alt_outlined,
                            size: 17,
                            color: Colors.black,

                          ),
                        ],
                      ),
                    ),
                  ],
                )
    ]);
  }
}
