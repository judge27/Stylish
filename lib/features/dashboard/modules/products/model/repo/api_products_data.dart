import 'dart:typed_data';

import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';
import 'package:stylish/features/dashboard/modules/products/model/repo/parent_products_data.dart';

class ApiProductsData extends ParentProductsData {
  static ApiProductsData? _instance;
  ApiProductsData._init();
  static ApiProductsData get getInstance {
    _instance??=ApiProductsData._init();
    return _instance!;
  }


  @override
  void deleteProduct(String id) {
    // TODO: implement deleteProduct
  }

  @override
  Future<List<ProductModel>> fetchCartProducts() {
    // TODO: implement fetchCartProducts
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> fetchFavoriteProducts() {
    // TODO: implement fetchFavoriteProducts
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> fetchProducts() {
    // TODO: implement fetchProducts
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> fetchProductsWithCategory({required String productCategory}) {
    // TODO: implement fetchProductsWithCategory
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> fetchSearchProducts({required String productName}) {
    // TODO: implement fetchSearchProducts
    throw UnimplementedError();
  }

  @override
  Future<void> insertProduct({
    required String productName,
    required String productCategory,
    required String productDesc,
    int? demandQuantity,
    required int availableQuantity,
    Uint8List? image,
    required int? productCurrentPrice,
    int? productAcutalPrice,
    int? isSale,
    String? productImage
   }) {
    // TODO: implement insertProduct
    throw UnimplementedError();
  }

  @override
  void newPrice(int price, String id) {
    // TODO: implement newPrice
  }

  @override
  void newQuantity(int qnt, String id) {
    // TODO: implement newQuantity
  }

  @override
  Future<void> updateCart(int value, String id) {
    // TODO: implement updateCart
    throw UnimplementedError();
  }

  @override
  Future<void> updateFavorite(int value, String id) {
    // TODO: implement updateFavorite
    throw UnimplementedError();
  }

  @override
  Future<void> updateProductCategory(String productCategory, String id) {
    // TODO: implement updateProductCategory
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> fetchProductsWithSale() {
    // TODO: implement fetchProductsWithSale
    throw UnimplementedError();
  }

  @override
  Future<void> updateDemandQuantity(int value, String id) {
    // TODO: implement updateDemandQuantity
    throw UnimplementedError();
  }

}