import 'package:flutter/material.dart';
import 'package:kcapstone/models/order.dart';

class OrderController extends StatelessWidget {
  final List<OrderModel> catalog;

  OrderController({Key key, this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: catalog.length,
      itemBuilder: (context, index) {
        return new Card(
          margin: EdgeInsets.all(10.2),
          child: new SizedBox(
            child: ListTile(
              leading: Image.network(
                catalog[index].picture,
                alignment: Alignment.center,
                height: 300.0,
                width: 150.0,
              ),
              title: Text(catalog[index].name),
              subtitle: Text("สถานะ: " + catalog[index].status),

              onTap: () {
                print(index);
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
