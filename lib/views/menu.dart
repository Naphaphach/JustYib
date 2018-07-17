import 'package:flutter/material.dart';
import 'package:kcapstone/controllers/catalog.dart';
import 'package:kcapstone/models/restaurant.dart';

import 'package:http/http.dart' as http;

class MenuPage extends StatelessWidget {
  final Restaurant restaurant;

  // In the constructor, require a restaurant
  MenuPage({Key key, @required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('${restaurant.name}'),
      ),
    );
  }
}
