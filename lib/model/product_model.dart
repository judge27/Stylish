class ProductModel {
  final String name;
  final String? image;
  final String price;
  final String? description;
  final String? category;
  final int id;
  List<String> images;
  bool isInfav;
  bool isInCart;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.category,
    this.isInfav = false,
    this.isInCart = false,
    required this.images,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      images: jsonData['images'],
      name: jsonData['name'],
      image: jsonData['image'],
      price: jsonData['price'],
      description: jsonData['description'],
      category: jsonData['category'],
    );
  }
}

//  //class RatingModel {
//   final double rate;
//   final int count;
//   RatingModel({required this.rate, required this.count});

//   factory RatingModel.fromJson(jsonData) {
//     return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
//   }
// }
