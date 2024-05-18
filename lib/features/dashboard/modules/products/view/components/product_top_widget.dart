import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/models/textfield_model.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/features/auth/registration/view/component/textfield_widget.dart';
import 'package:stylish/features/dashboard/modules/products/controller/cubit/productscontroller_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductTopWidget extends StatelessWidget {
  const ProductTopWidget({super.key, required this.controller});

  final ProductscontrollerCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductscontrollerCubit>.value(
      value: controller,
      child: BlocBuilder<ProductscontrollerCubit, ProductscontrollerState>(
        builder: (context, state) {
          return Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.height / 12,
                  child: TextFieldWidget(
                    model: TextFieldModel(
                      onChange: (value) {
                        controller.searchProducts(value!);
                      },
                      textStyle: Core.instance.authTextStyle,
                      inputDecoration: Core.instance
                          .authInputDecoration(context)
                          .copyWith(
                          prefixIcon: const Icon(
                              CupertinoIcons.search),
                          hintText:
                          AppLocalizations.of(context)!.searchanyproduct,
                          hintStyle: const TextStyle(
                            color: Color(0xFFBBBBBB),
                            fontSize: 14.5,
                            fontWeight: FontWeight.w400,
                          ),
                         ),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.height / 36,
                ),
                SizedBox(
                  height: context.height / 12,
                  child: Row(
                    children: [
                      Text(
                        "${controller.products.length} " +
                            AppLocalizations.of(context)!.items,
                        style: TextStyle(
                            color: Theme
                                .of(context)
                                .hintColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          controller.sortProducts();
                        },
                        child: Container(
                          width: 70,
                          height: 30,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2),
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(4),
                            color: Colors.white,
                          ),
                          child:  Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.sort,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight:
                                    FontWeight.w400),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_upward_rounded,
                                size: 14,
                                color: Colors.black,
                              ),
                              const Icon(
                                Icons.arrow_downward_rounded,
                                size: 14,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        width: context.width / 20,
                      ),
                      Container(
                            width: 89 ,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: DropdownButton(
                                      underline: SizedBox(),
                                      items: controller.cateogries.map((String item) {
                                        return DropdownMenuItem(child:Center(child: Text(item),),value: item,);
                                      }).toList(),
                                      onChanged: (String? value) {
                                        controller.filterProducts(value!);
                                      },
                                      value: globalCategory,
                                      dropdownColor: Colors.white,
                                      iconSize: 0,style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.filter_alt_outlined,
                                  size: 17,
                                  color: Colors.black,
                                ),
                              ],
                            )
                        ),
                    ],
                  ),
                )
              ]);
        },
      ),
    );
  }
}
