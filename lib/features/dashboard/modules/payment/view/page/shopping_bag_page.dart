import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/features/dashboard/controller/cubit/dashboardcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/payment/controller/cubit/paymentcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/payment/view/components/shopping_bag_widget.dart';
import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShoppingBagPage extends StatelessWidget {
  const ShoppingBagPage({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentcontrollerCubit>.value(
      value: PaymentcontrollerCubit.instance,
      child: BlocBuilder<PaymentcontrollerCubit, PaymentcontrollerState>(
  builder: (context, state) {
    final PaymentcontrollerCubit cubit = context.read<PaymentcontrollerCubit>();
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        bottomNavigationBar: Container(
          height: 138,
          width: context.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(35),topLeft: Radius.circular(35)),
            color: Colors.grey.withOpacity(0.25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("\$ ${cubit.deliveryFee+(productModel.productCurrentPrice!*cubit.Qty)}",style:  TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 25,
                fontWeight: FontWeight.w600
              ),),
              InkWell(
                onTap: () async{
                  user = await getUser;
                  if(user.cardNumber==null||user.cardNumber=="")
                    {
                      context.showToastMessage=AppLocalizations.of(context)!.pleaseaddcreditcardfirst;
                    }
                  else
                  Navigator.pushNamed(context, Routes.CHECKOUT,arguments: cubit);
                },
                child: Core.instance.coreButton(
                    buttonText: AppLocalizations.of(context)!.proccedtoPayment,
                    context: context
                )
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            AppLocalizations.of(context)!.shoppingBag,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Theme.of(context).hintColor),
          ),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: InkWell(
              onTap: () {
                context.pop;
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: InkWell(
                onTap: () {
                  if (productModel
                      .favorite ==
                      1) {
                    cubit!.addTOFav(
                        productModel.id ??"",
                        0,
                        context,
                    productModel);
                  } else {
                    cubit!.addTOFav(
                        productModel
                            .id ??"",
                        1,
                        context,productModel);
                  }
                },
                child: productModel
                    .favorite ==
                    1
                    ? const Icon(
                  CupertinoIcons.heart_fill,
                  color: Colors.redAccent,
                  size: 30,
                )
                    : const Icon(
                  CupertinoIcons.heart,
                  color: Colors.redAccent,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        body:  ShoppingBagWidegt(cubit: cubit, productModel: productModel,),
      );
  },
),
    );
  }
}
