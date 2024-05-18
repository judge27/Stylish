import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';
import 'package:stylish/features/dashboard/modules/products/model/repo/parent_products_data.dart';

class FirebaseProductsData extends ParentProductsData {
  static FirebaseProductsData? _instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseProductsData._init();
  static FirebaseProductsData get getInstance {
    _instance??=FirebaseProductsData._init();
    return _instance!;
  }




  @override
  void deleteProduct(String id)async {
    CollectionReference products = FirebaseFirestore.instance.collection('products');
    await products.doc(id.toString()).delete().then((_) => print("Product Deleted")).catchError((error)=>print("Failed to delete Product $error"));;
  }

  @override
  Future<List<ProductModel>> fetchCartProducts() async{
    return await FirebaseFirestore.instance.collection('products').where('cart',isEqualTo: 1).get().then((QuerySnapshot querySnapshot) {
      return querySnapshot.docs.map((e) {
        final Map data = e.data() as Map;

        Map m = {
          'productName': data.containsKey('productName') ? data['productName'] : "affsfda",
          'image': data.containsKey('image') ? data['image'] : "XXXX",
          'productSale': data.containsKey('productSale') ? data['productSale'] : 0,
          'productDesc': data.containsKey('productDesc') ? data['productDesc'] : "asffsa",
          'productCurrentPrice': data.containsKey('productCurrentPrice') ? data['productCurrentPrice'] : 0,
          'productCategory': data.containsKey('productCategory') ? data['productCategory'] : "XXXX",
          'productAvailableQuantity': data.containsKey('productAvailableQuantity') ? data['productAvailableQuantity'] : 0,
          'productAcutalPrice': data.containsKey('productAcutalPrice') ? data['productAcutalPrice'] : 0,
          'isSale': data.containsKey('isSale') ? data['isSale'] : 0,
          'favorite': data.containsKey('favorite') ? data['favorite'] : 0,
          'cart': data.containsKey('cart') ? data['cart']: 0,
          'demandQuantity': data.containsKey('demandQuantity') ? data['demandQuantity'] : 0,
          'productImage':data.containsKey('productImage')? data['productImage']:"",
          'id': e.reference.id,
        };
        return ProductModel.fromJson(m);
      }).toList();
    });
  }

  @override
  Future<List<ProductModel>> fetchFavoriteProducts() async {
    return await FirebaseFirestore.instance.collection('products').where('favorite',isEqualTo: 1).get().then((QuerySnapshot querySnapshot) {
      return querySnapshot.docs.map((e) {
        final Map data = e.data() as Map;

        Map m = {
          'productName': data.containsKey('productName') ? data['productName'] : "affsfda",
          'image': data.containsKey('image') ? data['image'] : "XXXX",
          'productSale': data.containsKey('productSale') ? data['productSale'] : 0,
          'productDesc': data.containsKey('productDesc') ? data['productDesc'] : "asffsa",
          'productCurrentPrice': data.containsKey('productCurrentPrice') ? data['productCurrentPrice'] : 0,
          'productCategory': data.containsKey('productCategory') ? data['productCategory'] : "XXXX",
          'productAvailableQuantity': data.containsKey('productAvailableQuantity') ? data['productAvailableQuantity'] : 0,
          'productAcutalPrice': data.containsKey('productAcutalPrice') ? data['productAcutalPrice'] : 0,
          'isSale': data.containsKey('isSale') ? data['isSale'] : 0,
          'favorite': data.containsKey('favorite') ? data['favorite'] : 0,
          'cart': data.containsKey('cart') ? data['cart'] : 0,
          'demandQuantity': data.containsKey('demandQuantity') ? data['demandQuantity'] : 0,
          'productImage':data.containsKey('productImage')? data['productImage']:"",
          'id': e.reference.id,
        };
        return ProductModel.fromJson(m);
      }).toList();
    });
  }



  @override
  Future<void> insertProduct({
    required String productName,
    required String productCategory,
    required String productDesc,
    int? demandQuantity,
    int? productSale,
    required int availableQuantity,
    Uint8List? image,
    required int? productCurrentPrice,
    int? productAcutalPrice,
    int? isSale,
    String? productImage
    }) async {
    CollectionReference products = FirebaseFirestore.instance.collection('products');
    await products.add({
      'productName': productName,
      'productSale':productSale,
      'productDesc': productDesc,
      'productCategory':productCategory,
      'productCurrentPrice':productCurrentPrice,
      'productAcutalPrice':productAcutalPrice,
      'demandQuantity': demandQuantity,
      'productAvailableQuantity': availableQuantity,
      'favorite': 0,
      'cart': 0,
      'isSale':isSale,
      'image':image,
      'productImage':productImage,
    }).then((value) => print("Product Inserted")).catchError((error)=>print("Failed to insert Product $error"));


  }

  @override
  void newPrice(int price, String id) async {
    CollectionReference products = FirebaseFirestore.instance.collection('products');
    await products.doc(id.toString()).update({
      'productAcutalPrice': price
    }).then((_) => print("Price Updated")).catchError((error)=>print("Failed to update Product Price $error"));

  }
  @override
  void newImage(String imageUrl, String id) async {
    CollectionReference products = FirebaseFirestore.instance.collection('products');
    await products.doc(id.toString()).update({
      'productImage': imageUrl
    }).then((_) => print("Image Updated")).catchError((error)=>print("Failed to update Product Image $error"));

  }
  @override
  void newQuantity(int qnt, String id)async {
    CollectionReference products = FirebaseFirestore.instance.collection('products');
    await products.doc(id.toString()).update({
      'availableQuantity': qnt
    }).then((_) => print("Quantity Updated")).catchError((error)=>print("Failed to update Product Qnt $error"));;
  }

  @override
  Future<void> updateCart(int value, String id)async {
    CollectionReference products = FirebaseFirestore.instance.collection('products');
    await products.doc(id.toString()).update({
      'cart': value
    }).then((_) => print("Cart Updated")).catchError((error)=>print("Failed to update Product Cart $error"));;
  }

  @override
  Future<void> updateFavorite(int value, String id) async {
    CollectionReference products = FirebaseFirestore.instance.collection('products');
    await products.doc(id.toString()).update({
      'favorite': value
    }).then((_) => print("Fav Updated")).catchError((error)=>print("Failed update Product Fav $error"));;
  }


  @override
  Future<void> updateProductCategory(String productCategory, String id)async {
    CollectionReference products = FirebaseFirestore.instance.collection('products');
    await products.doc(id.toString()).update({
      'productCategory': productCategory
    }).then((_) => print("ProductCategory Updated")).catchError((error)=>print("Failed to update Product $error"));;
  }

  @override
  Future<List<ProductModel>> fetchProductsWithSale() async {
    return await FirebaseFirestore.instance.collection('products').where('isSale',isEqualTo: 1).get().then((QuerySnapshot querySnapshot) {
      return querySnapshot.docs.map((e) {
        final Map data = e.data() as Map;

        Map m = {
          'productName': data.containsKey('productName') ? data['productName'] : "affsfda",
          'image': data.containsKey('image') ? data['image'] : "XXXX",
          'productSale': data.containsKey('productSale') ? data['productSale'] : 0,
          'productDesc': data.containsKey('productDesc') ? data['productDesc'] : "asffsa",
          'productCurrentPrice': data.containsKey('productCurrentPrice') ? data['productCurrentPrice'] : 0,
          'productCategory': data.containsKey('productCategory') ? data['productCategory'] : "XXXX",
          'productAvailableQuantity': data.containsKey('productAvailableQuantity') ? data['productAvailableQuantity'] : 0,
          'productAcutalPrice': data.containsKey('productAcutalPrice') ? data['productAcutalPrice'] : 0,
          'isSale': data.containsKey('isSale') ? 1 : 1,
          'favorite': data.containsKey('favorite') ? data['favorite'] : 0,
          'cart': data.containsKey('cart') ? data['cart'] : 0,
          'demandQuantity': data.containsKey('demandQuantity') ? data['demandQuantity'] : 0,
          'productImage':data.containsKey('productImage')? data['productImage']:"",
          'id': e.reference.id,
        };
        return ProductModel.fromJson(m);
      }).toList();
    });
  }

  @override
  Future<List<ProductModel>> fetchProducts() async{
    return await FirebaseFirestore.instance.collection('products').get().then((QuerySnapshot querySnapshot) {
      return querySnapshot.docs.map((e) {
        final Map data = e.data() as Map;

        Map m = {
          'productName': data.containsKey('productName') ? data['productName'] : "affsfda",
          'image': data.containsKey('image') ? data['image'] : "XXXX",
          'productSale': data.containsKey('productSale') ? data['productSale'] : 0,
          'productDesc': data.containsKey('productDesc') ? data['productDesc'] : "asffsa",
          'productCurrentPrice': data.containsKey('productCurrentPrice') ? data['productCurrentPrice'] : 0,
          'productCategory': data.containsKey('productCategory') ? data['productCategory'] : "XXXX",
          'productAvailableQuantity': data.containsKey('productAvailableQuantity') ? data['productAvailableQuantity'] : 0,
          'productAcutalPrice': data.containsKey('productAcutalPrice') ? data['productAcutalPrice'] : 0,
          'isSale': data.containsKey('isSale') ? data['isSale'] : 0,
          'favorite': data.containsKey('favorite') ? data['favorite'] : 0,
          'cart': data.containsKey('cart') ? data['cart'] : 0,
          'demandQuantity': data.containsKey('demandQuantity') ? data['demandQuantity'] : 0,
          'productImage':data.containsKey('productImage')? data['productImage']:"",
        'id': e.reference.id,
        };
        return ProductModel.fromJson(m);
      }).toList();
    });
  }

  @override
  Future<List<ProductModel>> fetchProductsWithCategory({required String productCategory}) async {
    return await FirebaseFirestore.instance.collection('products').where('productCategory', isEqualTo: productCategory).get().then((QuerySnapshot querySnapshot) {
      return querySnapshot.docs.map((e) {
        final Map data = e.data() as Map;
        Map m = {
          'productName': data.containsKey('productName') ? data['productName'] : "affsfda",
          'image': data.containsKey('image') ? data['image'] : "XXXX",
          'productSale': data.containsKey('productSale') ? data['productSale'] : 0,
          'productDesc': data.containsKey('productDesc') ? data['productDesc'] : "asffsa",
          'productCurrentPrice': data.containsKey('productCurrentPrice') ? data['productCurrentPrice'] : 0,
          'productCategory': data.containsKey('productCategory') ? data['productCategory'] : "",
          'productAvailableQuantity': data.containsKey('productAvailableQuantity') ? data['productAvailableQuantity'] : 0,
          'productAcutalPrice': data.containsKey('productAcutalPrice') ? data['productAcutalPrice'] : 0,
          'isSale': data.containsKey('isSale') ? data['isSale'] : 0,
          'favorite': data.containsKey('favorite') ? data['favorite'] : 0,
          'cart': data.containsKey('cart') ? data['cart'] : 0,
          'demandQuantity': data.containsKey('demandQuantity') ? data['demandQuantity'] : 0,
          'productImage':data.containsKey('productImage')? data['productImage']:"",
          'id': e.reference.id,
        };
        return ProductModel.fromJson(m);
      }).toList();
    });
  }

  @override
  Future<List<ProductModel>> fetchSearchProducts({required String productName}) async {
    return await FirebaseFirestore.instance.collection('products').where('productName', isEqualTo: productName).get().then((QuerySnapshot querySnapshot) {
      return querySnapshot.docs.map((e) {
        final Map data = e.data() as Map;
        Map m = {
          'productName': data.containsKey('productName') ? data['productName']: "" ,
          'image': data.containsKey('image') ? data['image'] : "XXXX",
          'productSale': data.containsKey('productSale') ? data['productSale'] : 0,
          'productDesc': data.containsKey('productDesc') ? data.containsValue(productName) : data.containsValue(productName),
          'productCurrentPrice': data.containsKey('productCurrentPrice') ? data['productCurrentPrice'] : 0,
          'productCategory': data.containsKey('productCategory') ? data.containsValue(productName) : data.containsValue(productName),
          'productAvailableQuantity': data.containsKey('productAvailableQuantity') ? data['productAvailableQuantity'] : 0,
          'productAcutalPrice': data.containsKey('productAcutalPrice') ? data['productAcutalPrice'] : 0,
          'isSale': data.containsKey('isSale') ? data['isSale'] : 0,
          'favorite': data.containsKey('favorite') ? data['favorite'] : 0,
          'cart': data.containsKey('cart') ? data['cart'] : 0,
          'demandQuantity': data.containsKey('demandQuantity') ? data['demandQuantity'] : 0,
          'productImage':data.containsKey('productImage')? data['productImage']:"",
          'id': e.reference.id,
        };
        return ProductModel.fromJson(m);
      }).toList();
    });
  }

  @override
  Future<void> updateDemandQuantity(int value, String id) async {
    CollectionReference products = FirebaseFirestore.instance.collection('products');
    await products.doc(id.toString()).update({
      'demandQuantity': value
    }).then((_) => print("Fav Updated")).catchError((error)=>print("Failed update Product Fav $error"));;

  }

}