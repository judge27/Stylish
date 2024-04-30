import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/features/dashboard/controller/cubit/dashboardcontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/users/view/page/user_page.dart';

import '../../modules/wishlist/view/page/wishlist_page.dart';

class DashboardBodyWidget extends StatelessWidget {
  const DashboardBodyWidget({super.key,required this.controller});
 final DashboardcontrollerCubit controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardcontrollerCubit>.value(
      value: controller,
      child: BlocBuilder<DashboardcontrollerCubit, DashboardcontrollerState>(
        builder: (context, state) {
          return PageView(
            controller:controller.pageController,
            onPageChanged:controller.onChangePage,
            children:  [
              Center(child:IconButton(icon: Icon(CupertinoIcons.home,size: 50,),onPressed:(){
               context.pushTo=Routes.LOGIN;
                FirebaseAuth.instance.signOut();},)),
              const Center(child:Text("Service",style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.w700
              ),) ,),
              WishlistPage(),
              UserPage(),
            ],
          );
        },
      ),
    );
  }
}
