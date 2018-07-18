import 'package:flutter/material.dart';
import 'package:kcapstone/models/card.dart';
import 'package:kcapstone/models/cart.dart';
import 'package:kcapstone/models/menu.dart';
import 'package:kcapstone/models/restaurant.dart';
import 'package:kcapstone/views/summary.dart';

class CreditCardList extends StatelessWidget {
  final Cart cart;
  final List<CreditCard> cards;

  const CreditCardList({Key key, this.cart, this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cards.length + 1,
      itemBuilder: (context, index) {
        if (index == cards.length) {
          return Card(
            margin: EdgeInsets.all(10.2),
            child: SizedBox(
                height: 150.0,
                child: IconButton(
                    icon: Icon(
                      Icons.add_circle_outline,
                      size: 40.0,
                    ),
                    onPressed: () {
                      print("Add credit card");
                    })),
          );
        }

        return new Card(
          margin: EdgeInsets.all(10.2),
          child: new SizedBox(
            child: ListTile(
              leading: Image.network(
                cards[index].picture,
                alignment: Alignment.bottomCenter,
                height: 400.0,
                width: 150.0,
              ),
              title: Text(cards[index].number),
              subtitle: Text(cards[index].expire),
              onTap: () {
                cart.pay(cards[index]);

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Summary(
                    cart: cart,
                  );
                }));
                print(cards[index]);
              },
              // trailing: IconButton(icon: Ico, onPressed: null),
            ),

            /// This is the one I want to be dynamic. The more items there are the more space it takes and the less space section 3 gets.
            height: 120.0,
          ),
        );
      },
    );
  }
}
