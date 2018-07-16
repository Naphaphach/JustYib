import 'package:flutter/material.dart';
import 'package:kcapstone/controllers/catalog.dart';
import 'package:kcapstone/models/restaurant.dart';

import 'package:http/http.dart' as http;

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order"),
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
