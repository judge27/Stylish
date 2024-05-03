import 'dart:developer';
import 'dart:typed_data';

import 'package:sqflite/sqflite.dart';
import 'package:stylish/features/dashboard/model/product_model.dart';

class DatabaseRepo {
  late Database myObjectDB;
  Future<void> initDB() async {
    myObjectDB = await openDatabase(
      (await getDatabasesPath()) + '/productDB.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
  CREATE TABLE product (
             id INTEGER PRIMARY KEY AUTOINCREMENT,
             productName TEXT NOT NULL,
             productDesc TEXT, 
             image BLOB,
             productImage String,
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
    log((await myObjectDB.getVersion()).toString());
    return (await myObjectDB.query('product')).map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<List<ProductModel>> fetchFavoriteProducts() async {
    return (await myObjectDB.query('product', where: 'favorite=?', whereArgs: [1]))
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Future<List<ProductModel>> fetchCartProducts() async {
    return (await myObjectDB.query('product', where: 'cart=?', whereArgs: [1]))
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Future<void> insertProduct({required String name, String? desc, int? demandQuantity, int? availableQuantity, Uint8List? image,required int productCurrentPrice,int? productAcutalPrice,int? isSale,required String productImage}) async {
    await myObjectDB.insert('product', {
      'productName': name,
      'productDesc': desc,
      'productImage': productImage,
      'productCurrentPrice':productCurrentPrice,
      'productAcutalPrice':productAcutalPrice,
      'demandQuantity': demandQuantity,
      'productAvailableQuantity': availableQuantity,
      'favorite': 0,
      'cart': 0,
      'isSale':0,
    });
  }

  void newQuantity(int qnt, int id) {
    myObjectDB.update(
        'product',
        {
          'availableQuantity': qnt,
        },
        where: 'id=?',
        whereArgs: [id]);
  }

  void updateCart(int value, int id) {
    myObjectDB.update(
        'product',
        {
          'cart': value,
        },
        where: 'id=?',
        whereArgs: [id]);
  }

  Future<void> updateFavorite(int value, int id) async {
    await myObjectDB.update(
        'product',
        {
          'favorite': value,
        },
        where: 'id=?',
        whereArgs: [id]);
  }

  void deleteProduct(int id) {
    myObjectDB.delete('product', where: 'id=?', whereArgs: [id]);
  }
}