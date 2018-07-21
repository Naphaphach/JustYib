import 'package:flutter/material.dart';
import 'package:justyib/models/cart.dart';
import 'package:justyib/views/summary.dart';

class CartList extends StatelessWidget {
  Cart _cart;

  CartList(cart, {Key key}) : super(key: key) {
    this._cart = cart;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // leading: Image.network(
        //   cart.restaurant.picture,
        //   alignment: Alignment.bottomCenter,
        //   height: 400.0,
        //   width: 150.0,
        // ),
        title: Text(_cart.getRestaurant().name),
        subtitle: Text("ราคาทั้งหมด: ${_cart.getTotalPrice()} ฿"),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print("Show purchase product (" + _cart.toString() + ")");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Summary(
                    cart: _cart,
                  ),
            ),
          );
        },
      ),
    );
  }
}
