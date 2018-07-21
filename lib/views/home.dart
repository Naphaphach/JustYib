import 'package:flutter/material.dart';
import 'package:justyib/components/catalog.dart';
import 'package:justyib/models/restaurant.dart';

import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Restaurant>>(
      future: Restaurant.fetchRestaurants(context, http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? CatalogList(catalog: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
