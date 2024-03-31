class CategoryNameModel {
  final String name;
  final String image;
  final int id;
  CategoryNameModel(
      {required this.id, required this.image, required this.name});

  factory CategoryNameModel.fromJson(jsonData) {
    return CategoryNameModel(
        image: jsonData['image'], name: jsonData['name'], id: jsonData['id']);
  }
}
