
import 'package:flutter/material.dart';
import 'package:stylish/const.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/features/dashboard/controller/cubit/dashboardcontroller_cubit.dart';

class CategoryListItemWidget extends StatelessWidget {
  const CategoryListItemWidget({super.key,required this.dashboardcontrollerCubit});
  final DashboardcontrollerCubit dashboardcontrollerCubit;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          InkWell(
            onTap: (){
              globalCategory="Beauty";
              dashboardcontrollerCubit.onChangePage(1);
            },
            child: SizedBox(
              width: context.width/6,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    radius: 35,
                    child: Image.asset(
                      kCategory1,
                    ),
                  ),
                  Text(
                    'Beauty',
                    style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: context.width/48,
          ),
          InkWell(
            onTap: (){
              globalCategory="Fashion";
              dashboardcontrollerCubit.onChangePage(1);
            },
            child: SizedBox(
              width: context.width/6,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    radius: 35,
                    child: Image.asset(
                      kCategory2,
                      width: 80,
                    ),
                  ),
                  Text(
                    'Fashion',
                    style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
           SizedBox(
            width: context.width/48,
          ),
          InkWell(
            onTap: (){
              globalCategory="Kids";
              dashboardcontrollerCubit.onChangePage(1);
            },
            child: SizedBox(
              width: context.width/6,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    radius: 35,
                    child: Image.asset(
                      kCategory3,
                      width: 80,
                    ),
                  ),
                  Text(
                    'Kids',
                    style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
           SizedBox(
            width: context.width/48
          ),
          InkWell(
            onTap: (){
              globalCategory="Mens";
              dashboardcontrollerCubit.onChangePage(1);
            },
            child: SizedBox(
              width: context.width/6,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    radius: 35,
                    child: Image.asset(
                      kCategory4,
                      width: 80,
                    ),
                  ),
                  Text(
                    'Mens',
                    style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
           SizedBox(
            width: context.width/48,
          ),
          InkWell(
            onTap: (){
              globalCategory="Women";
              dashboardcontrollerCubit.onChangePage(1);
            },
            child: SizedBox(
              width: context.width/6,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    radius: 35,
                    child: Image.asset(
                      kCategory5,
                      width: 80,
                    ),
                  ),
                  Text(
                    'Women',
                    style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
