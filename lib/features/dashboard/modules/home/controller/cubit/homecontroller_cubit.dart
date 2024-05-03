import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:stylish/const.dart';
import 'package:stylish/features/dashboard/model/product_model.dart';

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

  List<ProductModel> products1 = [
    ProductModel(
      productImage:  kWomen,
      productName: "Women Printed Kurta",
      productDesc: "Neque porro quisquam est qui dolorem ipsum quia",
      isSale: 1,
      productCurrentPrice: 1500,
      productAcutalPrice: 2499,
      productSale: 40,
      productAvailableQuantity: 56890,
    ),
    ProductModel(
      productImage:  kShoes,
      productName: "HRX by Hrithik Roshan",
      productDesc: "Neque porro quisquam est qui dolorem ipsum quia",
      isSale: 1,
      productCurrentPrice: 2499,
      productAcutalPrice: 4999,
      productSale: 50,
      productAvailableQuantity: 344567,
    ),
    ProductModel(
      productImage:  kJacket,
      productName: "Black Jacket 12",
      productDesc: "This warm and comfortable jacket is great for learni",
      isSale: 0,
      productCurrentPrice: 2999,
      productAcutalPrice: 2999,
      productSale: 0,
      productAvailableQuantity: 223569
    ),
    ProductModel(
      productImage:  kWomen,
      productName: "Women Printed Kurta",
      productDesc: "Neque porro quisquam est qui dolorem ipsum quia",
      isSale: 1,

      productCurrentPrice: 1500,
      productAcutalPrice: 2499,
      productSale: 40,
      productAvailableQuantity: 56890,
    ),

  ];
  List<ProductModel> products2 = [
    ProductModel(
      productImage:  kWatch,
      productName: "IWC Schaffhausen",
      productDesc: "2021 Pilot's Watch \"SIHH 2019\" 44mm",
      isSale: 1,
      productCurrentPrice: 650,
      productAcutalPrice: 1599,
      productSale: 60,
      productAvailableQuantity: 5245,
    ),
    ProductModel(
      productImage:  kJordan2,
      productName: "NIke Sneakers",
      productDesc: "Nike Air Jordan Retro 1 Low Mystic Black",
      isSale: 0,
      productCurrentPrice: 1900,
      productAcutalPrice: 1900,
      productSale: 0,
      productAvailableQuantity: 344567,
    ),
    ProductModel(
      productImage:  kJordan3,
      productName: "NIke Sneakers",
      productDesc: "Mid Peach Mocha Shoes For Man White Black Pink S",
      isSale: 0,
      productCurrentPrice: 1900,
      productAcutalPrice: 2999,
      productSale: 0,
      productAvailableQuantity: 25685785,
    ),


  ];
}
