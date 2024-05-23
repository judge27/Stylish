import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/features/dashboard/modules/payment/controller/cubit/paymentcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShoppingBagWidegt extends StatelessWidget {
  const ShoppingBagWidegt({super.key,required this.cubit,required this.productModel});
  final PaymentcontrollerCubit cubit;
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentcontrollerCubit>.value(
  value: cubit,
  child: BlocBuilder<PaymentcontrollerCubit, PaymentcontrollerState>(
  builder: (context, state) {
    return Container(
      height: context.height,
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: productModel.id??"",
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child:
                    connected?
                    Image(image: NetworkImage(
                      productModel.productImage??"",
                    ),width: 150,
                      height: 200,
                      fit: BoxFit.cover,
                    ):
                    Image.memory(productModel.image??Uint8List(1),
                      width: 150,
                      height: 200,
                      fit: BoxFit.cover,)
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    productModel.productName,
                    style:  TextStyle(
                      color: Theme.of(context).hintColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: context.width/1.8,
                    child: Text(
                      productModel.productDesc!,
                      style:  TextStyle(
                        color: Theme.of(context).hintColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        overflow: TextOverflow.clip
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: context.width/1.8,
                    child: Row(
                      children: [
                        Container(
                            width: 50,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Theme.of(context).primaryColor,
                            ),
                          child: Text(AppLocalizations.of(context)!.qty,),
                        ),
                        SizedBox(width: 12,),
                        InkWell(
                          onTap: (){
                            cubit.updateQty(cubit.Qty-1,productModel);
                          },
                          child: Container(
                              width: 22,
                              height: 22,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               color: Theme.of(context).primaryColor,
                              ),
                              child: Icon(CupertinoIcons.minus, size: 15,)),
                        ),
                        const SizedBox(width: 12,),
                         Text("${cubit.Qty}",style: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontWeight:  FontWeight.w800,
                            fontSize: 18
                        ),),
                        SizedBox(width: 12,),
                        InkWell(
                          onTap: (){
                            cubit.updateQty(cubit.Qty+1,productModel);
                          },
                          child: Container(
                              width: 22,
                              height: 22,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).primaryColor,
                              ),
                              child: Icon(CupertinoIcons.plus, size: 15,)),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: (){
                            cubit.updateQty(1,productModel);
                          },
                          child: Container(
                            width: 50,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Text(AppLocalizations.of(context)!.reset),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              ),

            ]
          ),
          SizedBox(
            height: context.height/32,
          ),
          const Divider(
            indent: 15,
            endIndent: 15,
            thickness: 1.1,
            color: Color(0xFFBBBBBB),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 25,),
                Text(AppLocalizations.of(context)!.orderpaymentdetails,style: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontSize: 19,
                    fontWeight: FontWeight.w500
                ),),
                const SizedBox(height: 18,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalizations.of(context)!.orderamounts,style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).hintColor
                    ),),
                    Text("\$ ${cubit.Qty*productModel.productCurrentPrice!}",style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).hintColor
                    ),),

                  ],
                ),
                const SizedBox(height: 18,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalizations.of(context)!.deliveryfee,style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).hintColor
                    ),),
                    Text(cubit.deliveryFee==0?AppLocalizations.of(context)!.free:"\$ ${cubit.deliveryFee}",style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).hintColor
                    ),),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.height/32,
          ),
          const Divider(
            indent: 15,
            endIndent: 15,
            thickness: 1.1,
            color: Color(0xFFBBBBBB),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 18,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalizations.of(context)!.ordertotal,style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).hintColor
                    ),),
                    Text("\$ ${((productModel.productCurrentPrice!*cubit.Qty)+cubit.deliveryFee)}",style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).hintColor
                    ),),

                  ],
                ),
                const SizedBox(height: 18,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalizations.of(context)!.custome,style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).hintColor
                    ),),
                    Text(user.name,style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).hintColor
                    ),),
                  ],
                ),
              ],
            ),
          )




        ],
      ),
    );
  },
),
);
  }
}
