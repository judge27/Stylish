import 'package:flutter/material.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/features/dashboard/modules/home/controller/cubit/homecontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/home/model/view_all_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ViewAllBannerItem extends StatelessWidget {
  const ViewAllBannerItem({super.key,required this.model});
  final ViewAllModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: 70,
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: model.backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title!,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Icon(
                    model.prefixIcon!,
                    size: 22,
                    color: Colors.white,
                  ),
                  Text(
                    model.hintIconText!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
          InkWell(
            onTap: ()=>HomecontrollerCubit.instance.onTapViewAll(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              width: 100,
              height: 32,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.viewall,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  const Icon(
                    Icons.arrow_forward_outlined,
                    size: 18,
                    color: Colors.white,
                  )
                ],
              ),
            ),),
        ],
      ),
    );
  }
}