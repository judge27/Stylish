
import 'package:flutter/material.dart';
import 'package:stylish/const.dart';
import 'package:stylish/core/extension/context_extension.dart';

class CategoryListItemWidget extends StatelessWidget {
  const CategoryListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          SizedBox(
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
          SizedBox(
            width: context.width/24,
          ),
          SizedBox(
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
           SizedBox(
            width: context.width/24,
          ),
          SizedBox(
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
           SizedBox(
            width: context.width/24
          ),
          SizedBox(
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
           SizedBox(
            width: context.width/24,
          ),
          SizedBox(
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
                  'Womens',
                  style: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )
        ]));
  }
}
