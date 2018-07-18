import 'package:flutter/material.dart';
import 'package:kcapstone/models/card.dart';

class PaymentCard extends StatelessWidget {
  final CreditCard creditCard;

  const PaymentCard({Key key, this.creditCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.payment),
        title: Text(creditCard.number),
        subtitle: Text(creditCard.expire),
      ),
    );
  }
}
