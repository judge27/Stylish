import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/const.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/features/dashboard/controller/cubit/dashboardcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/home/controller/cubit/homecontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/home/model/view_all_model.dart';
import 'package:stylish/features/dashboard/modules/home/view/components/big_banner_item.dart';
import 'package:stylish/features/dashboard/modules/home/view/components/category_list_item.dart';
import 'package:stylish/features/dashboard/modules/home/view/components/view_all_banner.dart';
import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';
import 'package:stylish/features/dashboard/modules/products/modules/productdetails/view/components/similaritems_widget.dart';
import 'home_top_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeWidgetItem extends StatelessWidget {
  const HomeWidgetItem({super.key, required this.controller,});
  final HomecontrollerCubit controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: controller,
        child: BlocBuilder<HomecontrollerCubit, HomecontrollerState>(
        builder: (context, state) {
        return SizedBox(
          height: context.height,
          width: context.width,
          child: Padding(
            padding:
                const EdgeInsets.symmetric( horizontal: 20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeTopWidget(
                     homeTitle: controller.homeTitle,
                      cubit: controller,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CategoryListItemWidget(),
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
                          title:AppLocalizations.of(context)!.dealofday,
                          hintIconText: AppLocalizations.of(context)!.remaining+"22h 55m 20s"),
                    ),
                    const SizedBox(height: 15,),
                    controller.products.length!=0?
                    SizedBox(height: 300,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {

                            return InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, Routes.PRODUCTDETAILS,arguments: controller.products[index]);
                                },
                                child: SimilarItemsWidget(
                                  productModel: controller.products[index],
                                ));
                          }, separatorBuilder:(context, index){
                        return const SizedBox(width: 10,);
                      },
                          itemCount: controller.products.length),
                    ):const SizedBox(),
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
                          const Spacer(),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 40.0, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                 Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.flatandheels,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Color(0xFF232327)),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.standachancetogetrewarded,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: Color(0xFF232327)),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: (){
                                    controller.onTapViewAll();
                                  },
                                  child: Container(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 7),
                                    width: 100,
                                    height: 32,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: const Color(0xFFF83758),
                                        border: Border.all(color: Colors.white)),
                                    child:  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!.viewall,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const Icon(
                                          Icons.arrow_forward_outlined,
                                          color: Colors.white,
                                          size: 15,
                                        )
                                      ],
                                    ),
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
                          title: AppLocalizations.of(context)!.trendingproduct,
                          hintIconText: AppLocalizations.of(context)!.lastdate+" 29/02/22"),
                    ),
                    const SizedBox(height: 15,),
                    controller.products.length!=0?
                    SizedBox(height: 300,
                      child: ListView.separated(
                          reverse: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, Routes.PRODUCTDETAILS,arguments: controller.products[index]);

                                },
                                child: SimilarItemsWidget(
                                  productModel:controller.products[index],
                                ));
                          }, separatorBuilder:(context, index){
                        return const SizedBox(width: 10,);
                      },
                          itemCount: controller.products.length),
                    ):const SizedBox(),
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
                                   Text(
                                    AppLocalizations.of(context)!.newarrivals,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                       Text(
                                        AppLocalizations.of(context)!.summercollection,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,

                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          controller.onTapViewAll();
                                        },
                                        child: Container(
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
                                          child:  Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                AppLocalizations.of(context)!.viewall,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              const Icon(
                                                Icons.arrow_forward_outlined,
                                                color: Colors.white,
                                                size: 15,
                                              )
                                            ],
                                          ),
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
                           Text(AppLocalizations.of(context)!.sponserd,
                              style: const TextStyle(
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
                          InkWell(
                            onTap:()=>controller.onTapViewAll(),
                            child:  Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppLocalizations.of(context)!.upto+"50% "+AppLocalizations.of(context)!.off
                                  ,style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black
                                ),),
                                Icon(Icons.arrow_forward_ios,size: 15,color: Colors.black,)

                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        );
  },
));
  }
}
