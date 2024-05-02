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
      productTitle: "Neque porro quisquam est qui dolorem ipsum quia",
      isSale: true,
      productCurrentPrice: 1500,
      productAcutalPrice: 2499,
      productSale: 40,
      productDemandNum: "56890",
    ),
    ProductModel(
      productImage:  kShoes,
      productName: "HRX by Hrithik Roshan",
      productTitle: "Neque porro quisquam est qui dolorem ipsum quia",
      isSale: true,
      productCurrentPrice: 2499,
      productAcutalPrice: 4999,
      productSale: 50,
      productDemandNum: "344567",
    ),
    ProductModel(
      productImage:  kJacket,
      productName: "Black Jacket 12",
      productTitle: "This warm and comfortable jacket is great for learni",
      isSale: false,
      productCurrentPrice: 2999,
      productAcutalPrice: 2999,
      productSale: 0,
      productDemandNum: "2,23,569",
    ),
    ProductModel(
      productImage:  kWomen,
      productName: "Women Printed Kurta",
      productTitle: "Neque porro quisquam est qui dolorem ipsum quia",
      isSale: true,

      productCurrentPrice: 1500,
      productAcutalPrice: 2499,
      productSale: 40,
      productDemandNum: "56890",
    ),

  ];
  List<ProductModel> products2 = [
    ProductModel(
      productImage:  kWatch,
      productName: "IWC Schaffhausen",
      productTitle: "2021 Pilot's Watch \"SIHH 2019\" 44mm",
      isSale: true,
      productCurrentPrice: 650,
      productAcutalPrice: 1599,
      productSale: 60,
      productDemandNum: "",
    ),
    ProductModel(
      productImage:  kJordan2,
      productName: "NIke Sneakers",
      productTitle: "Nike Air Jordan Retro 1 Low Mystic Black",
      isSale: false,
      productCurrentPrice: 1900,
      productAcutalPrice: 1900,
      productSale: 0,
      productDemandNum: "344567",
    ),
    ProductModel(
      productImage:  kJordan3,
      productName: "NIke Sneakers",
      productTitle: "Mid Peach Mocha Shoes For Man White Black Pink S",
      isSale: false,
      productCurrentPrice: 1900,
      productAcutalPrice: 2999,
      productSale: 0,
      productDemandNum: "2,56,890",
    ),


  ];
}
