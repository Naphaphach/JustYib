import 'package:flutter/material.dart';
import 'package:kcapstone/components/cartList.dart';
import 'package:kcapstone/models/cart.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ประวัติของฉัน"),
      ),
      body: ListView(
        children: SingletonCart().onlyTakenCart().map((cart) {
          return CartList(cart);
          // return Text(cart.totalPrice().toString());
        }).toList(),
      ),
    );
  }
}
