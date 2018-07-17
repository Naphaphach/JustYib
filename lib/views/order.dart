import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kcapstone/models/cart.dart';

import 'package:kcapstone/views/summary.dart';

class Order extends StatelessWidget {
  final List<String> randomStatus = ["กำลังปรุง", "ปรุงสำเร็จ", "รอคอนเฟิร์ม"];

  String random() {
    randomStatus.shuffle(Random());
    return randomStatus.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("รายการของฉัน"),
      ),
      body: ListView(
        children: SingletonCart().carts.map((cart) {
          return Card(
            child: ListTile(
              leading: Image.network(
                cart.restaurant.picture,
                alignment: Alignment.bottomCenter,
                height: 400.0,
                width: 150.0,
              ),
              title: Text(cart.shopName()),
              subtitle:
                  Text("ราคาทั้งหมด: " + cart.totalPrice().toString() + " ฿"),
              onTap: () {
                print("Show purchase product (" + cart.toString() + ")");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Summary(
                          status: random(),
                          cart: cart,
                        ),
                  ),
                );
              },
            ),
          );
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
                })
          ],
        ),
      ),
    );
  }
}
