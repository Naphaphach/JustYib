import 'package:flutter/material.dart';
import 'package:justyib/models/restaurant.dart';
import 'package:justyib/views/menu.dart';

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
            ),
            height: 130.0,
          ),
        );
      },
    );
  }
}
