import 'package:flutter/material.dart';
import 'package:kcapstone/components/order.dart';
import 'package:kcapstone/models/order.dart';
import 'package:http/http.dart' as http;

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order"),
      ),
      body: FutureBuilder<List<OrderModel>>(
        future: OrderModel.fetchPhotos(context, http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? OrderController(catalog: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Order()),
          );
        },
        tooltip: 'Current order',
        child: new Icon(Icons.list),
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
