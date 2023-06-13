class CategoryModel {
  List<Category> categories;

  CategoryModel({
    required this.categories,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    categories: List<Category>.from(json["сategories"].map((x) => Category.fromJson(x))),
  );

}

class Category {
  int id;
  String name;
  String imageUrl;

  Category({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"]??0,
    name: json["name"]??"",
    imageUrl: json["image_url"]??"",
  );

}
