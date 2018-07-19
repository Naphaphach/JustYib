import 'package:flutter/material.dart';

class PriceCard extends StatelessWidget {
  final int price;

  const PriceCard({Key key, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // leading: Icon(Icons.p),
        title: Text("ราคาทั้งหมด"),
        trailing: Text(price.toString() + " ฿"),
      ),
    );
  }
}
