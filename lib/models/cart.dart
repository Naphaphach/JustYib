import 'package:kcapstone/models/menu.dart';
import 'package:kcapstone/models/restaurant.dart';

class Cart {
  Restaurant restaurant;
  Map<Menu, int> menus;

  Cart(Restaurant restaurant, List<int> number) {
    this.restaurant = restaurant;
    this.menus = Map();

    for (var i = 0; i < restaurant.menus.length; i++) {
      if (number[i] != 0) {
        this.menus.putIfAbsent(restaurant.menus[i], () {
          return number[i];
        });
      }
    }
  }

  String shopName() {
    return restaurant.name;
  }

  int totalPrice() {
    return menus.keys.fold(
      0,
      (i, menu) {
        int unit = menus.putIfAbsent(menu, () {
          return 0;
        });
        return i + (menu.price * unit);
      },
    );
  }
}

class SingletonCart {
  static final SingletonCart _singleton = new SingletonCart._internal();

  List<Cart> carts;

  factory SingletonCart() {
    return _singleton;
  }

  SingletonCart._internal() {
    carts = [];
  }

  add(Cart cart) {
    carts.add(cart);
  }
}
