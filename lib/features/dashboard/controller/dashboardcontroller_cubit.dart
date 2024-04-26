import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/utils/firebase.dart';

part 'dashboardcontroller_state.dart';

class DashboardcontrollerCubit extends Cubit<DashboardcontrollerState> {
  DashboardcontrollerCubit() : super(DashboardcontrollerInitial());

  PageController pageController = PageController();
  int pageIndex=0;


  void onChangePage(int index){
    pageIndex=index;
    pageController.jumpToPage(pageIndex);
    emit(DashboardcontrollerInitial());
  }
}
