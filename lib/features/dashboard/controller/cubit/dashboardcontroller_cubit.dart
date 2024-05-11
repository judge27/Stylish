import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish/core/constants/constants.dart';

part 'dashboardcontroller_state.dart';

class DashboardcontrollerCubit extends Cubit<DashboardcontrollerState> {
  static DashboardcontrollerCubit instance = DashboardcontrollerCubit();
  DashboardcontrollerCubit() : super(DashboardcontrollerInitial()){
    init();
  }


  void init() async {
    user = await getUser;
  }
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
