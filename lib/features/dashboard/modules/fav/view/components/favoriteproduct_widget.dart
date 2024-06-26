import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/features/dashboard/modules/fav/controller/cubit/favoriteproduct_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/controller/cubit/productscontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/firebase_users_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoriteProductWidget extends StatelessWidget {
  const FavoriteProductWidget({super.key,required this.cubit});
  final FavoriteproductCubit cubit;
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value:  cubit,
      child: BlocBuilder<FavoriteproductCubit, FavoriteproductState>(
        builder: (context, state) {
          return state is FavoriteproductLoading?
          const Center(child:CircularProgressIndicator()):
          state is FavoriteproductEmpty?
          const Center(child: Icon(CupertinoIcons.nosign),):
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Text(
                    AppLocalizations.of(context)!.favoritelist,
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child:  SizedBox(
                    height: 20,
                  ),
                ),
                SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                        childCount: cubit.products.length,
                            (context, index) {
                          return Dismissible(
                            onDismissed: (direction)async {
                              await cubit.removeFromFav(cubit.products[index].id??"", 0, context);
                              },
                            key: UniqueKey(),
                            background: Container(
                              color: Theme.of(context).primaryColor,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(CupertinoIcons.delete,size: 25,),
                                  Icon(CupertinoIcons.delete,size: 25,),
                                ],
                              ),
                            ),
                            child: InkWell(
                              onTap: (){
                                Navigator.pushNamed(context,
                                    Routes.PRODUCTDETAILS,
                                    arguments: cubit.products[index]);
                              },
                              child: Container(
                                width: context.width,
                                height: 200,
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Hero(
                                          tag: cubit.products[index].id??"",
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(8),
                                              child:
                                              connected?
                                              Image(image: NetworkImage(
                                                cubit.products[index].productImage??"",
                                              ),width: 130,
                                                height: 125,
                                                fit: BoxFit.cover,
                                              ):
                                              Image.memory(cubit.products[index].image??Uint8List(1),width: 130,
                                                height: 125,
                                                fit: BoxFit.cover,)
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cubit.products[index].productName,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Variations : ",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Container(
                                                    width: 39,
                                                    height: 17,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(2),
                                                        border: Border.all(color: Colors.black)),
                                                    alignment: Alignment.center,
                                                    child: const Text(
                                                      "Black",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w500),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Container(
                                                    width: 39,
                                                    height: 17,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(2),
                                                        border: Border.all(color: Colors.black)),
                                                    alignment: Alignment.center,
                                                    child: const Text(
                                                      "Red",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "4.8",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w500,
                                                        color: Colors.black),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  SizedBox(
                                                      width: 80,
                                                      height: 10,
                                                      child: ListView.builder(
                                                          itemCount: 5,
                                                          scrollDirection: Axis.horizontal,
                                                          itemBuilder: (_, index) => const Icon(
                                                            Icons.star,
                                                            color: Colors.amber,
                                                            size: 14.5,
                                                          ))),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 84,
                                                    height: 29,
                                                    decoration: BoxDecoration(
                                                        border:
                                                        Border.all(color: const Color(0xFFCACACA))),
                                                    alignment: Alignment.center,
                                                    child:  Text(
                                                      cubit.products[index].productCurrentPrice.toString(),
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  cubit.products[index].isSale==1?
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'upto ${cubit.products[index].productSale.toString()}% off',
                                                        style: const TextStyle(
                                                            color: Color(0xFFEB3030),
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 14),
                                                      ),
                                                      Text(
                                                        '\$ ${cubit.products[index].productAcutalPrice.toString()}',
                                                        style: const TextStyle(
                                                            color: Color(0xFFA7A7A7),
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 14),
                                                      )
                                                    ],
                                                  ):SizedBox()
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    const Divider(
                                      indent: 10,
                                      endIndent: 10,
                                      thickness: 1.0,
                                      color: Color(0xFFBBBBBB),
                                    ),
                                   InkWell(
                                     onTap: ()async{
                                        cubit.addTOCart(cubit.products[index].id??"", 1);
                                         },
                                     child: Container(
                                       height: 35,
                                       alignment: Alignment.center,
                                       color: Theme.of(context).primaryColor,
                                       child: Text(
                                         AppLocalizations.of(context)!.addedtocart,
                                         style: const TextStyle(
                                             color:Colors.black,
                                             fontWeight: FontWeight.w800
                                         ),
                                       ),
                                     ),
                                   )
                                  ],
                                ),
                              ),
                            ),
                          );
                        } ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisExtent: 200,
                        mainAxisSpacing: 6
                    )
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

