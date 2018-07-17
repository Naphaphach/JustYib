import 'package:flutter/material.dart';
import 'package:kcapstone/models/restaurant.dart';
import 'package:kcapstone/views/menu.dart';

class CatalogList extends StatelessWidget {
  final List<Restaurant> catalog;

  CatalogList({Key key, this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: catalog.length,
      itemBuilder: (context, index) {
        Restaurant restaurant = catalog[index];
        return new Card(
          child: new SizedBox(
            child: ListTile(
              leading: Image.network(
                restaurant.picture,
                alignment: Alignment.center,
                height: 400.0,
                width: 150.0,
              ),
              title: Text(restaurant.name),
              subtitle: Text(restaurant.location),
              trailing: Text(restaurant.priceRate),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuPage(restaurant: restaurant),
                  ),
                );
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
