import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/const.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/features/dashboard/controller/cubit/dashboardcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/home/controller/cubit/homecontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/home/model/view_all_model.dart';
import 'package:stylish/features/dashboard/modules/home/view/components/big_banner_item.dart';
import 'package:stylish/features/dashboard/modules/home/view/components/category_list_item.dart';
import 'package:stylish/features/dashboard/modules/home/view/components/home_product_item.dart';
import 'package:stylish/features/dashboard/modules/home/view/components/view_all_banner.dart';
import 'home_top_item.dart';

class HomeWidgetItem extends StatelessWidget {
  const HomeWidgetItem({super.key, required this.controller,required this.dashboardcontrollerCubit});
  final HomecontrollerCubit controller;
  final DashboardcontrollerCubit dashboardcontrollerCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: controller,
        child: SizedBox(
          height: context.height,
          width: context.width,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeTopWidget(
                     homeTitle: controller.homeTitle,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CategoryListItemWidget(dashboardcontrollerCubit: dashboardcontrollerCubit,),
                    const SizedBox(
                      height: 20,
                    ),
                    const BigBanner(),
                    const SizedBox(
                      height: 15,
                    ),
                    ViewAllBannerItem(
                      model: ViewAllModel(
                          prefixIcon: Icons.access_alarm,
                          backgroundColor: Colors.blue,
                          title: "Deal of the Day",
                          hintIconText: " 22h 55m 20s remaining "),
                    ),
                    // Stack(
                    //   alignment: Alignment.centerRight,
                    //   children: [
                    //     HomeProductItem(
                    //       itemScrollController: controller.itemScrollController,
                    //       productItem: controller.products1,
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.only(right: 8.0),
                    //       child: InkWell(
                    //         onTap: () => controller.onNext(
                    //             itemScrollController1:
                    //                 controller.itemScrollController,
                    //             pageIndex: controller.pageIndex1),
                    //         child: const CircleAvatar(
                    //           backgroundColor: Colors.grey,
                    //           child: Icon(
                    //             Icons.arrow_forward_ios_sharp,
                    //             color: Colors.black,
                    //             size: 20,
                    //           ),
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 172,
                      width: context.width,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 11,
                            height: 172,
                            decoration:
                                const BoxDecoration(color: Color(0xFFEFAD18)),
                          ),
                          Image.asset(kHeels),
                          Spacer(),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 40.0, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Flat and Heels",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Color(0xFF232327)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Stand a chance to get rewarded",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: Color(0xFF232327)),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 7),
                                  width: 100,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: const Color(0xFFF83758),
                                      border: Border.all(color: Colors.white)),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "View all",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_outlined,
                                        color: Colors.white,
                                        size: 15,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ViewAllBannerItem(
                      model: ViewAllModel(
                          prefixIcon: Icons.calendar_month_outlined,
                          backgroundColor: const Color(0xFFFD6E87),
                          title: "Trending Products ",
                          hintIconText: " Last Date 29/02/22 "),
                    ),
                    // Stack(
                    //   alignment: Alignment.centerRight,
                    //   children: [
                    //     HomeProductItem(
                    //       itemScrollController:
                    //           controller.itemScrollController2,
                    //       productItem: controller.products2,
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.only(right: 8.0),
                    //       child: InkWell(
                    //         onTap: () => controller.onNext(
                    //             itemScrollController1:
                    //                 controller.itemScrollController2,
                    //             pageIndex: controller.pageIndex2),
                    //         child: const CircleAvatar(
                    //           backgroundColor: Colors.grey,
                    //           child: Icon(
                    //             Icons.arrow_forward_ios_sharp,
                    //             color: Colors.black,
                    //             size: 20,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: context.width,
                      height: context.height/2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            kBanner2,
                            fit: BoxFit.fitWidth,
                            width: context.width,
                            height: context.height/3,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0,),
                            child: SizedBox(
                              height: context.height/6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "New Arrivals",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Summer’ 25 Collections",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,

                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 7),
                                        width: 100,
                                        height: 32,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: const Color(0xFFF83758),
                                            border:
                                                Border.all(color: Colors.white)),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "View all",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_outlined,
                                              color: Colors.white,
                                              size: 15,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                      width: context.width,
                      height: 398,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Sponserd",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400,
                              color: Colors.black)),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            kBanner3,
                            height: 292,
                            width: context.width,
                            fit: BoxFit.fitWidth,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("up to 50% Off",style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.black
                              ),),
                              Icon(Icons.arrow_forward_ios,size: 15,color: Colors.black,)
                              
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ));
  }
}
