import 'package:flutter/material.dart';
import 'package:kcapstone/components/cardList.dart';
import 'package:kcapstone/models/card.dart';
import 'package:kcapstone/models/menu.dart';

import 'package:http/http.dart' as http;
import 'package:kcapstone/models/restaurant.dart';

class Payment extends StatefulWidget {
  final List<Menu> menus;
  final List<int> numbers;
  final Restaurant restaurant;

  const Payment({Key key, this.menus, this.numbers, this.restaurant})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PaymentState(menus, numbers, restaurant);
  }
}

class PaymentState extends State<Payment> {
  final Restaurant restaurant;
  final List<Menu> menus;
  final List<int> numbers;

  PaymentState(this.menus, this.numbers, this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("การจ่ายเงิน"),
      ),
      body: FutureBuilder<List<CreditCard>>(
        future: CreditCard.fetchCreditCards(context, http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? CardList(
                  restaurant: this.restaurant,
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
