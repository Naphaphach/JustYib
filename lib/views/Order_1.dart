import 'package:flutter/material.dart';
import 'package:kcapstone/controllers/catesample.dart';
import 'package:kcapstone/models/mockupData.dart';

import 'package:http/http.dart' as http;

class Order_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sample>>(
      future: Sample.fetchPhotos(context, http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            // ignore: argument_type_not_assignable
            ? Catalogsample(catalog: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
