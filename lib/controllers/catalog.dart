import 'package:flutter/material.dart';
import 'package:kcapstone/models/restaurant.dart';

class CatalogList extends StatelessWidget {
  final List<Restaurant> catalog;

  CatalogList({Key key, this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: catalog.length,
      itemBuilder: (context, index) {
        return new Card(
          child: new SizedBox(
            child: ListTile(
              leading: Image.network(
                catalog[index].picture,
                alignment: Alignment.bottomCenter,
                height: 400.0,
                width: 150.0,
              ),
              title: Text(catalog[index].name),
              subtitle: Text(catalog[index].location + catalog[index].priceRate.toString()),

              onTap: () {
                print(index);
              },
              // trailing: IconButton(icon: Ico, onPressed: null),
            ),

            /// This is the one I want to be dynamic. The more items there are the more space it takes and the less space section 3 gets.
            height: 130.0,
          ),
        );
      },
    );
  }
}
