import 'package:flutter/material.dart';
import 'package:kcapstone/main.dart';
import 'package:kcapstone/models/card.dart';
import 'package:kcapstone/models/cart.dart';
import 'package:kcapstone/views/payment.dart';

class Summary extends StatefulWidget {
  final CreditCard payment;
  final Cart cart;

  const Summary({Key key, this.payment, this.cart}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SummaryState(payment: payment, cart: cart);
  }
}

class SummaryState extends State<Summary> {
  final CreditCard payment;
  final Cart cart;

  SummaryState({this.payment, this.cart});

  @override
  Widget build(BuildContext context) {
    print(payment.number);
    print(cart.menus);
    int i = 0;

    List<Widget> list = [
      Card(
        child: ListTile(
          leading: Icon(Icons.payment),
          title: Text(payment.number),
          subtitle: Text(payment.expire),
        ),
      )
    ];

    list.addAll(cart.menus
        .map<int, Widget>((menu, size) {
          return MapEntry(
            i++,
            ListTile(
              title: Text(menu.name),
              subtitle: Text("Price: " + menu.price.toString()),
              trailing: Text(size.toString() + " unit"),
            ),
          );
        })
        .values
        .toList());

    list.add(Card(
      child: ListTile(
        leading: Icon(Icons.play_arrow),
        title: Text("total price"),
        trailing: Text(cart.totalPrice().toString() + " ฿"),
      ),
    ));

    list.add(
      RaisedButton(
        child: Text("Checkout"),
        onPressed: () {
          print("done!");
          Navigator.popUntil(context, ModalRoute.withName('/'));
        },
        padding: EdgeInsets.symmetric(vertical: 7.0),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Summary"),
      ),
      body: ListView(
        children: list,
      ),
    );
  }
}
