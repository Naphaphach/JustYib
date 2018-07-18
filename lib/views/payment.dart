import 'package:flutter/material.dart';
import 'package:kcapstone/components/creditCardList.dart';
import 'package:kcapstone/models/card.dart';
import 'package:kcapstone/models/cart.dart';
import 'package:kcapstone/models/menu.dart';

import 'package:http/http.dart' as http;
import 'package:kcapstone/models/restaurant.dart';

class Payment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PaymentState();
  }
}

class PaymentState extends State<Payment> {
  PaymentState();

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

          // FIXME: mock cart
          return snapshot.hasData
              ? CreditCardList(
                  cart: SingletonCart().currentCart(),
                  cards: snapshot.data,
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
