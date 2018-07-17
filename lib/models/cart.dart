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
}
