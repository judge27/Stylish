
import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
class ProductModel {
  late String productName;
  late String? productDesc;
  late String productCategory;
  late int? productCurrentPrice;
  late int? productAcutalPrice;
  late int? productSale;
  late int? productAvailableQuantity;
  late int? isSale;
  late Uint8List? image;
  int? favorite, cart, demandQuantity;
  late String id;
  String? productImage;

  ProductModel({ this.productAcutalPrice,
    this.productCurrentPrice,
    required this.productCategory,
    this.productAvailableQuantity,
    required this.productName,
    this.productSale,
    this.productDesc,
    this.isSale,
    this.cart, this.demandQuantity,
    this.favorite,
    this.image,
    this.productImage,

  });

  ProductModel.fromJson(Map m) {
    log(m.toString());
    productName = m['productName'];
    image = m['image'];
    productCategory = m['productCategory'];
    productDesc = m['productDesc'];
    productCurrentPrice = m['productCurrentPrice'];
    productAcutalPrice = m['productAcutalPrice'];
    productSale = m['productSale'];
    demandQuantity = m['demandQuantity'];
    productAvailableQuantity = m['productAvailableQuantity'];
    cart = m['cart'];
    favorite = m['favorite'];
    id = m['id'].toString();
    isSale = m['isSale'];
    productImage = m['productImage'];
  }
}

