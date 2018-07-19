import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kcapstone/components/cartList.dart';
import 'package:kcapstone/models/cart.dart';
import 'package:kcapstone/views/history.dart';

import 'package:kcapstone/views/summary.dart';

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("รายการของฉัน"),
      ),
      body: ListView(
        children: SingletonCart().onlyNoneTakenCart().map((cart) {
          return CartList(cart);
          // return Text(cart.totalPrice().toString());
        }).toList(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: () {
                  print("Filter");
                }),
            IconButton(
                icon: Icon(Icons.history),
                onPressed: () {
                  print("History");
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => History()));
                })
          ],
        ),
      ),
    );
  }
}
