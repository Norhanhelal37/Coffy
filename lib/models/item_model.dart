

class ItemModel {

  String title;

  String describtion;

  String imageurl;

  List<dynamic> ingridiants;

  int price;

  ItemModel(
      {required this.title,
      required this.describtion,
      required this.imageurl,
      required this.ingridiants,
      required this.price});

  factory ItemModel.fromjason(Map<String, dynamic> data) {
    return ItemModel(
        title: data["title"],
        describtion: data["description"],
        imageurl: data["image"],
        ingridiants: data["ingredients"],
        price: data["id"]);
  }
}
