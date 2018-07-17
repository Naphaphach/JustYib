import 'package:flutter/material.dart';
import 'package:kcapstone/models/card.dart';

class CardList extends StatelessWidget {
  final List<CreditCard> cards;

  CardList({Key key, this.cards}) : super(key: key);

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
