import 'package:flutter/material.dart';
import 'package:kcapstone/components/paymentCard.dart';
import 'package:kcapstone/components/priceCard.dart';
import 'package:kcapstone/components/purchaseMenu.dart';
import 'package:kcapstone/models/card.dart';
import 'package:kcapstone/models/cart.dart';
import 'package:kcapstone/constants/status.dart';

class Summary extends StatefulWidget {
  final Cart cart;

  const Summary({Key key, this.cart}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SummaryState(cart: cart);
  }
}

class SummaryState extends State<Summary> {
  final Cart cart;

  SummaryState({this.cart});

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];

    if (!cart.isStatus(Status.none)) {
      // FIXME: remove this in real project
      cart.next(); // for mock up only
      print("cart: " + cart.getStatus());

//      list.add(ListTile(
//        leading: Icon(Icons.code),
//        title: Text(cart.showCode()),
//      ));
      list.add(ListTile(
        leading: StatusHelper().getIcon(cart.getRawStatus()),
        title: Text(cart.showCode()),
        subtitle: Text(cart.getStatus()),
      ));
    }

    if (cart.payment != null) list.add(PaymentCard(creditCard: cart.payment));

    int i = 1;
    list.addAll(cart.getOrderMenus().map((menu) {
      int number = cart.getNumberByMenu(menu);
      if (number > 0) {
        return PurchaseMenuCard(
          index: i++,
          menu: menu,
          number: number,
        );
      }
    }));

    list.add(PriceCard(price: cart.getTotalPrice()));

    if (cart.isStatus(Status.none)) {
      list.add(Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: MaterialButton(
          height: 56.0,
          color: ThemeData.light().primaryColor,
          highlightColor: Colors.transparent,
          child: Text("จ่ายเงิน"),
          onPressed: () {
            print("paid -- done!");
            cart.order();
            Navigator.popUntil(context, ModalRoute.withName('/'));
            Navigator.pushNamed(context, "/order");
          },
          padding: EdgeInsets.symmetric(vertical: 7.0),
        ),
      ));

      list.add(Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: MaterialButton(
          height: 56.0,
          color: ThemeData.light().errorColor,
          highlightColor: Colors.transparent,
          child: Text("ยกเลิก"),
          onPressed: () {
            print("cancel!");
            SingletonCart().cancelCurrentCart();
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          padding: EdgeInsets.symmetric(vertical: 7.0),
        ),
      ));
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
