import 'dart:math';

import 'package:kcapstone/models/card.dart';
import 'package:kcapstone/models/menu.dart';
import 'package:kcapstone/models/restaurant.dart';
import 'package:kcapstone/constants/status.dart';

class Cart {
  Restaurant _restaurant;
  Map<Menu, int> _menus;
  Status _status;
  DateTime _pickup;

  CreditCard payment;

  String _code;

  Cart(this._restaurant) {
    this._menus = Map();
    this._status = Status.none;
  }

  add(Menu menu, int number) {
    // exist
    if (_menus.containsKey(menu)) {
      // update current + new
      number = _menus.putIfAbsent(menu, () => 0) + number;
    }
    _menus[menu] = number;
  }

  remove(Menu menu, int number) {
    // exist
    if (_menus.containsKey(menu)) {
      // update current + new
      int current = _menus.putIfAbsent(menu, () => 0);
      if (current > 0) {
        number = current - number;
      } else {
        _menus.remove(menu);
      }
    }
  }

  List<Menu> getOrderMenus() {
    return _menus.keys.toList();
  }

  Map<Menu, int> getMapOrderMenus() {
    return _menus;
  }

  int getNumberByMenu(Menu menu) {
    if (_menus.containsKey(menu)) {
      return _menus[menu];
    }
    return 0;
  }

  int getNumberMenu() {
    return _menus.keys.length;
  }

  int getTotalNumberMenu() {
    return _menus.values.fold(0, (prev, current) {
      return prev + current;
    });
  }

  bool isOrderExist() {
    return _menus.values.any((e) => e > 0);
  }

  setPayment(CreditCard payment) {
    this.payment = payment;
    // SingletonCart().add(this);
  }

  setTime(DateTime time) {
    this._pickup = time;
  }

  /// set to waiting
  order() {
    _status = Status.waiting;

    // abcdefghijklmnopqrstuvwxyz
    List<String> list = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split("");
    list.shuffle(Random());

    _code = list.join().substring(0, 7);
  }

  /// set to processing
  confirm() {
    _status = Status.processing;
  }

  /// set to finished
  finish() {
    _status = Status.finished;
  }

  /// set to taken
  done() {
    _status = Status.taken;
  }

  /// MOCK UP METHOD
  /// don't use this in real product
  next() {
    if (Status.values.length - 1 > _status.index) {
      _status = Status.values[_status.index + 1];
      print("Warning: update status" + " (to): " + _status.toString());
    }
  }

  String showCode() {
    if (!isStatus(Status.none)) return _code;
    return null;
  }

  Restaurant getRestaurant() {
    return _restaurant;
  }

  bool isStatus(Status s) {
    return s == _status;
  }

  String getStatus() {
    return _status.toString();
  }

  int getTotalPrice() {
    return _menus.keys.fold(
      0,
      (i, menu) {
        int unit = _menus.putIfAbsent(menu, () {
          return 0;
        });
        return i + (menu.price * unit);
      },
    );
  }

  Status getRawStatus() {
    return _status;
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
    carts.insert(0, cart);
  }

  Cart currentCart() {
    return carts.first;
  }

  List<Cart> onlyNoneTakenCart() {
    return carts
        .skipWhile((e) => e.isStatus(Status.taken) && e.isStatus(Status.none))
        .toList();
  }

  List<Cart> onlyTakenCart() {
    return carts.takeWhile((e) => e.isStatus(Status.taken)).toList();
  }

  List<Cart> getCartByRestaurant(Restaurant restaurant) {
    return carts.where((e) {
      return e.getRestaurant().name == restaurant.name;
    });
  }

  List<Cart> getNotPurchaseCart() {
    return carts.where((cart) => cart.isStatus(Status.none));
  }

  Cart getCurrentCartByRestaurant(Restaurant restaurant) {
    return getCartByRestaurant(restaurant).first;
  }

  void cancelCurrentCart() {
    carts.removeAt(0);
  }
}
