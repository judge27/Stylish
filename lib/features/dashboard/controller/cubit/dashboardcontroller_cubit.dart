import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'dashboardcontroller_state.dart';

class DashboardcontrollerCubit extends Cubit<DashboardcontrollerState> {
  DashboardcontrollerCubit() : super(DashboardcontrollerInitial());

  // controller object of pageView in dashboard Page
  PageController pageController = PageController();

  // current page  index variable
  int pageIndex = 0;

  // PageTitle List
  final List<String> pagesTitle = [
    'Home',
    'Servies',
    'Products',
    'Users',
  ];

  // change page of pageView Method
  void onChangePage(int index){
    pageIndex=index;
    pageController.jumpToPage(pageIndex);
    emit(DashboardcontrollerInitial());
  }

}
