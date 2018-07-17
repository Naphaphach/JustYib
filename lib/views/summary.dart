import 'package:flutter/material.dart';
import 'package:kcapstone/models/card.dart';
import 'package:kcapstone/models/cart.dart';

class Summary extends StatefulWidget {
  final CreditCard payment;
  final Cart cart;
  final String status;

  const Summary({Key key, this.payment, this.cart, this.status})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SummaryState(payment: payment, cart: cart, status: status);
  }
}

class SummaryState extends State<Summary> {
  final CreditCard payment;
  final Cart cart;
  final String status;

  SummaryState({this.status, this.payment, this.cart});

  @override
  Widget build(BuildContext context) {
    // print(payment.number);
    print(cart.menus);
    int i = 0;

    List<Widget> list = [];
    if (status != null) {
      list.add(ListTile(
        leading: Icon(Icons.restaurant),
        title: Text(status),
      ));
    }

    if (payment != null) {
      list.add(Card(
        child: ListTile(
          leading: Icon(Icons.payment),
          title: Text(payment.number),
          subtitle: Text(payment.expire),
        ),
      ));
    }

    list.addAll(cart.menus
        .map<int, Widget>((menu, size) {
          return MapEntry(
            i++,
            ListTile(
              title: Text("${i.toString()}) " + menu.name),
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

    if (payment != null) {
      list.add(
        RaisedButton(
          child: Text("Checkout"),
          onPressed: () {
            print("done!");
            SingletonCart().add(cart);

            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          padding: EdgeInsets.symmetric(vertical: 7.0),
        ),
      );
    }

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
