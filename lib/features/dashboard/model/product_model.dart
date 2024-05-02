class ProductModel {
  late String productImage;
  late String productName;
  late String productTitle;
  late int productCurrentPrice;
  late int productAcutalPrice;
  late int productSale;
  late String productDemandNum;
  late bool isSale;
  ProductModel(
      {required this.productAcutalPrice,
      required this.productCurrentPrice,
      required this.productDemandNum,
      required this.productImage,
      required this.productName,
      required this.productSale,
      required this.productTitle,
      required this.isSale,
      });
}
