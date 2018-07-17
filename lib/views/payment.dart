import 'package:flutter/material.dart';
import 'package:kcapstone/components/cardList.dart';
import 'package:kcapstone/models/card.dart';
import 'package:kcapstone/models/menu.dart';

import 'package:http/http.dart' as http;

class Payment extends StatefulWidget {
  final List<Menu> menus;
  final List<int> numbers;

  const Payment({Key key, this.menus, this.numbers}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PaymentState(menus, numbers);
  }
}

class PaymentState extends State<Payment> {
  final List<Menu> menus;
  final List<int> numbers;

  PaymentState(this.menus, this.numbers);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
      ),
      body: FutureBuilder<List<CreditCard>>(
        future: CreditCard.fetchCreditCards(context, http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? CardList(
                  menus: this.menus,
                  numbers: this.numbers,
                  cards: snapshot.data,
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
