import 'package:flutter/material.dart';
import 'package:kcapstone/components/paymentCard.dart';
import 'package:kcapstone/components/priceCard.dart';
import 'package:kcapstone/components/purchaseMenu.dart';
import 'package:kcapstone/models/card.dart';
import 'package:kcapstone/models/cart.dart';
import 'package:kcapstone/constants/status.dart';

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
    // print(payment.number);
    print(cart.getRestaurant().name);

    List<Widget> list = [];
    if (!cart.isStatus(Status.none)) {
      list.add(ListTile(
        leading: StatusHelper().getIcon(cart.getRawStatus()),
        title: Text(cart.getStatus()),
      ));
    }

    if (payment != null) list.add(PaymentCard(creditCard: payment));

    int i = 0;
    list.addAll(cart.getOrderMenus().map((menu) {
      return PurchaseMenuCard(
        index: i++,
        menu: menu,
        number: cart.getNumberByMenu(menu),
      );
    }));

    list.add(PriceCard(price: cart.getTotalPrice()));

    if (payment != null) {
      list.add(
        RaisedButton(
          child: Text("จ่ายเงิน"),
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
        title: Text("สรุป"),
      ),
      body: ListView(
        children: list,
      ),
    );
  }
}
