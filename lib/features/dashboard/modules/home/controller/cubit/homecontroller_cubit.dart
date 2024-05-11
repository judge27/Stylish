import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:stylish/const.dart';
import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';

part 'homecontroller_state.dart';

class HomecontrollerCubit extends Cubit<HomecontrollerState> {
  HomecontrollerCubit() : super(HomecontrollerInitial());
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemScrollController itemScrollController2 = ItemScrollController();

  String homeTitle = "All Featured";
  int pageIndex1 = 0;
  int pageIndex2 = 0;
  void onNext({required ItemScrollController itemScrollController1,required int pageIndex}) {
    pageIndex += 2;
    itemScrollController1.scrollTo(
        index: pageIndex,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOutCubic);
    emit(HomecontrollerInitial());
  }


}
