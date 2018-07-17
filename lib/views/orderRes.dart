import 'package:flutter/material.dart';
import 'package:kcapstone/components/orderRes.dart';
import 'package:kcapstone/models/orderRes.dart';

import 'package:http/http.dart' as http;

class OrderRes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My menu"),
      ),
      body: FutureBuilder<List<OrderResModel>>(
        future: OrderResModel.fetchPhotos(context, http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? OrderResController(cate: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: () {
                  print("Filter");
                }),
            IconButton(
                icon: Icon(Icons.history),
                onPressed: () {
                  print("History");
                })
          ],
        ),
      ),
    );
  }
}
