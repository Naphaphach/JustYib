import 'package:flutter/material.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: Text("Summary"),
      ),
    );
  }
}
