import 'package:flutter/material.dart';
import 'package:justyib/models/menu.dart';

class PurchaseMenuCard extends StatelessWidget {
  final int index;
  final Menu menu;
  final int number;

  const PurchaseMenuCard({Key key, this.menu, this.number, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${index.toString()}) " + menu.name),
      subtitle: Text("ราคา: " + menu.price.toString()),
      trailing: Text(number.toString() + " unit"),
    );
  }
}
