class FoodsModel {
  List<Dishes>? dishes;

  FoodsModel({this.dishes});

  FoodsModel.fromJson(Map<String, dynamic> json) {
    if (json['dishes'] != null) {
      dishes = <Dishes>[];
      json['dishes'].forEach((v) {
        dishes!.add(Dishes.fromJson(v));
      });
    }
  }

}

class Dishes {
  int? id;
  String? name;
  int? price;
  int? weight;
  String? description;
  String? imageUrl;
  List<String>? tegs;

  Dishes(
      {this.id,
        this.name,
        this.price,
        this.weight,
        this.description,
        this.imageUrl,
        this.tegs});

  Dishes.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    name = json['name']??"";
    price = json['price']??0;
    weight = json['weight']??0;
    description = json['description']??"";
    imageUrl = json['image_url']??"";
    tegs = json['tegs'].cast<String>();
  }
}