import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kcapstone/components/cartList.dart';
import 'package:kcapstone/models/cart.dart';
import 'package:kcapstone/views/history.dart';

import 'package:kcapstone/views/summary.dart';

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];

    list.add(Card(
      child: ListTile(
        // leading: Icon(Icons.control_point),
        title: Text("Just-Point: "),
        trailing: Text("2000 point"),
      ),
    ));

    // FIXME: Error in filter only some cart status
    list.addAll(SingletonCart().onlyNoneTakenCart().map((cart) {
      return CartList(cart);
      // return Text(cart.totalPrice().toString());
    }).toList());
    return Scaffold(
      appBar: AppBar(
        title: Text("รายการของฉัน"),
      ),
      body: ListView(
        children: list,
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
