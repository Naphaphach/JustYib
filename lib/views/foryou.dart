import 'package:flutter/material.dart';
import 'package:kcapstone/controllers/catalog.dart';
import 'package:kcapstone/models/restaurant.dart';

import 'package:http/http.dart' as http;

class ForYou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Restaurant>>(
      future: Restaurant.fetchPhotos(context, http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? CatalogList(catalog: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
