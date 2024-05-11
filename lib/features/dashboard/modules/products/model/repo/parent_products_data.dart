
import 'dart:typed_data';

import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';

abstract class ParentProductsData {
  Future<List<ProductModel>> fetchProducts();
  Future<List<ProductModel>> fetchFavoriteProducts();
  Future<List<ProductModel>> fetchCartProducts();
  Future<List<ProductModel>> fetchSearchProducts({required String productName});
  Future<List<ProductModel>> fetchProductsWithCategory({required String productCategory});
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

  });
  void newQuantity(int qnt, String id);
  void newPrice(int price, String id);
  Future<void> updateCart(int value, String id);
  Future<void> updateDemandQuantity(int value, String id);
  Future<void> updateFavorite(int value, String id);
  Future<void> updateProductCategory(String productCategory, String id);
  void deleteProduct(String id);
  Future<List<ProductModel>> fetchProductsWithSale();
}