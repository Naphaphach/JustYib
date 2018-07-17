class Menu {
  final String picture;
  final String name;
  final int price;

  Menu({this.picture, this.name, this.price});

  factory Menu.fromJson(Map<String, dynamic> json) {
    // print(json);
    return Menu(
      picture: json['picture'] as String,
      name: json['name'] as String,
      price: json['price'] as int,
    );
  }
}
