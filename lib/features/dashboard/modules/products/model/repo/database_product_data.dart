import 'dart:developer';
import 'dart:typed_data';

import 'package:sqflite/sqflite.dart';
import 'package:stylish/features/dashboard/modules/products/model/entity/product_model.dart';
import 'package:stylish/features/dashboard/modules/products/model/repo/parent_products_data.dart';

class DatabaseProductsData extends ParentProductsData {

  static DatabaseProductsData? _instance;
  DatabaseProductsData._init();

  static Future<DatabaseProductsData> get getInstance async {
    if (_instance == null) {
      await _initDB();
      _instance = DatabaseProductsData._init();
    }
    return _instance!;
  }

  static late Database _myObjectDB;

  static Future<void> _initDB() async {
    _myObjectDB = await openDatabase(
      (await getDatabasesPath()) + '/productDB.db',
      version: 8,
      onCreate: (db, version) async {
        await db.execute('''
  CREATE TABLE product (
             id INTEGER PRIMARY KEY AUTOINCREMENT,
             productName TEXT NOT NULL,
             productImage Text,
             productDesc TEXT, 
             productCategory TEXT, 
             image BLOB,
             productSale INTEGER,
             productCurrentPrice INTEGER,
             productAcutalPrice INTEGER,
             demandQuantity INTEGER,
             productAvailableQuantity INTEGER,
             favorite INTEGER,
             cart INTEGER,
             isSale INTEGER
              )''');
      },
    );


  }

  Future<List<ProductModel>> fetchProducts() async {
    return (await _myObjectDB.query('product')).map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<List<ProductModel>> fetchFavoriteProducts() async {
    return (await _myObjectDB.query('product', where: 'favorite=?', whereArgs: [1]))
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Future<List<ProductModel>> fetchCartProducts() async {
    return (await _myObjectDB.query('product', where: 'cart=?', whereArgs: [1]))
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }
  Future<List<ProductModel>> fetchSearchProducts({required String productName}) async {
    return (await _myObjectDB.query('product', where: 'productName=?', whereArgs: [productName]))
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Future<List<ProductModel>> fetchProductsWithCategory({required String productCategory}) async {
    return productCategory==""?await fetchProducts():(await _myObjectDB.query('product', where: 'productCategory=?', whereArgs: [productCategory]))
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }
  Future<List<ProductModel>> fetchProductsWithSale() async {
    return (await _myObjectDB.query('product', where: 'isSale=?', whereArgs: [1]))
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }


  Future<void> insertProduct({
    required String productName,
    required String productCategory,
    required String productDesc,
    int? demandQuantity,
    int? productSale,
    required int availableQuantity,
    Uint8List? image,
    required int? productCurrentPrice,
    int? productAcutalPrice
    ,int? isSale,
    String? productImage,
   }) async {

    await _myObjectDB.insert('product', {
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
      'productImage':productImage
    });

  }


  void newQuantity(int qnt, String id) {
    _myObjectDB.update(
        'product',
        {
          'availableQuantity': qnt,
        },
        where: 'id=?',
        whereArgs: [id]);
  }

  void newPrice(int price, String id) {
    _myObjectDB.update(
        'product',
        {
          'productCurrentPrice': price,
        },
        where: 'id=?',
        whereArgs: [id]);
  }

  Future<void> updateCart(int value, String id)async {
    await _myObjectDB.update(
        'product',
        {
          'cart': value,
        },
        where: 'id=?',
        whereArgs: [id]);
  }

  Future<void> updateFavorite(int value, String id) async {
    await _myObjectDB.update(
        'product',
        {
          'favorite': value,
        },
        where: 'id=?',
        whereArgs: [id]);
  }
  Future<void> updateProductCategory(String productCategory, String id) async {

    await _myObjectDB.update(
        'product',
        {
          'productCategory': productCategory,
        },
        where: 'id=?',
        whereArgs: [id]);
  }

  void deleteProduct(String id) {
    _myObjectDB.delete('product', where: 'id=?', whereArgs: [id]);
  }

  @override
  Future<void> updateDemandQuantity(int value, String id)async {
    await _myObjectDB.update(
        'product',
        {
          'demandQuantity': value,
        },
        where: 'id=?',
        whereArgs: [id]);
  }
}