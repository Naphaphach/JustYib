library singleton;

import 'package:kcapstone/models/menu.dart';

class Cart {
  Map<Menu, int> menus;

  Cart(List<Menu> menus, List<int> number) {
    this.menus = Map();

    for (var i = 0; i < menus.length; i++) {
      if (number[i] != 0) {
        this.menus.putIfAbsent(menus[i], () {
          return number[i];
        });
      }
    }
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

//class Singleton {
//  static final Singleton _singleton = new Singleton._internal();
//
//  factory Singleton() {
//    return _singleton;
//  }
//
//  Singleton._internal();
//}
