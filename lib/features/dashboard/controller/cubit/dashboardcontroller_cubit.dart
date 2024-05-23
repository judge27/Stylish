import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/firebase/firebase.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/firebase_users_data.dart';

part 'dashboardcontroller_state.dart';

class DashboardcontrollerCubit extends Cubit<DashboardcontrollerState> {
  static DashboardcontrollerCubit instance = DashboardcontrollerCubit();
  DashboardcontrollerCubit() : super(DashboardcontrollerInitial()){
  init();
  }

  Future<void> init() async {
  user = await FirebaseUsersData.getInstance.fetech(id: FireBaseModel.instance.autUser!.uid);
  }
  // controller object of pageView in dashboard Page
  PageController pageController = PageController();

  // current page  index variable
  int pageIndex = 0;


  // change page of pageView Method
  void onChangePage(int index){

    print("***********************************${user.name}*************************");
    pageIndex=index;
    pageController.jumpToPage(pageIndex);
    emit(DashboardcontrollerInitial());
  }

}
