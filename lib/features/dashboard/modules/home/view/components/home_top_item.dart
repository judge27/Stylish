import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/models/textfield_model.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/features/auth/registration/view/component/textfield_widget.dart';
import 'package:stylish/features/dashboard/modules/home/controller/cubit/homecontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/products/controller/cubit/productscontroller_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeTopWidget extends StatelessWidget {
  const HomeTopWidget(
      {super.key, required this.homeTitle, required this.cubit});

  final HomecontrollerCubit cubit;

  final String homeTitle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomecontrollerCubit>.value(
        value: cubit,
        child: BlocBuilder<HomecontrollerCubit, HomecontrollerState>(
            builder: (context, state) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  child: TextFieldWidget(
                    model: TextFieldModel(
                      onSubmit: (_) async{
                        cubit.searchProducts(cubit.searchController.text);
                      },
                      controller: cubit.searchController,
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
                const SizedBox(
                  height: 20,
                ),
                Row(children: [
                  Text(
                    AppLocalizations.of(context)!.allfeatured,
                    style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      cubit.sortProducts();
                    },
                    child: Container(
                      width: 70,
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.sort,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
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
                      width: 89,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: DropdownButton(
                              underline: const SizedBox(),
                              items: cubit.cateogriesFilter.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Center(
                                    child: Text(item),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                cubit.filterProducts(value!);
                                globalCategory=value;
                              },
                              value: globalCategory,
                              dropdownColor: Colors.white,
                              iconSize: 0,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 15),
                            ),
                          ),
                          const Icon(
                            Icons.filter_alt_outlined,
                            size: 17,
                            color: Colors.black,
                          ),
                        ],
                      ))
                ])
              ]);
        }));
  }
}
