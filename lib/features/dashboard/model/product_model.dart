
import 'dart:developer';
import 'dart:typed_data';
class ProductModel {
  late String? productImage;
  late String productName;
  late String? productDesc;
  late int? productCurrentPrice;
  late int? productAcutalPrice;
  late int? productSale;
  late int productAvailableQuantity;
  late int? isSale;
  Uint8List? image;
  int? favorite, cart, id,  demandQuantity;

  ProductModel(
      { this.productAcutalPrice,
       this.productCurrentPrice,
       required this.productAvailableQuantity,
       this.productImage,
       required this.productName,
       this.productSale,
       this.productDesc,
       this.isSale,
        this.cart,this.demandQuantity,
        this.favorite

      });
  ProductModel.fromJson(Map m) {
    log(m.toString());
    productImage = m['productImage'];
    productName = m['productName'];
    productDesc = m['productDesc'];
    productCurrentPrice=m['productCurrentPrice'];
    productAcutalPrice=m['productAcutalPrice'];
    productSale=m['productSale'];
    demandQuantity = m['demandQuantity'];
    productAvailableQuantity = m['productAvailableQuantity'];
    cart = m['cart'];
    favorite = m['favorite'];
    id = m['id'];
    isSale=m['isSale'];
  }
}