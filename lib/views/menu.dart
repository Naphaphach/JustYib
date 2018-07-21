import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justyib/components/datetimeDialog.dart';
import 'package:justyib/models/cart.dart';
import 'package:justyib/models/menu.dart';
import 'package:justyib/models/restaurant.dart';
import 'package:justyib/views/payment.dart';

class MenuPage extends StatefulWidget {
  final Restaurant restaurant;

  MenuPage({Key key, @required this.restaurant}) : super(key: key);

  @override
  MenuState createState() {
    return MenuState(restaurant: restaurant);
  }
}

class MenuState extends State<MenuPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _textEditingController;

  final Restaurant restaurant;
  Cart _cart;

  String _note;

  Icon _icon = Icon(Icons.timer);

  @override
  void initState() {
    _textEditingController = new TextEditingController(text: _note);
    super.initState();
  }

  // In the constructor, require a restaurant
  MenuState({@required this.restaurant}) {
    _cart = Cart(restaurant);
  }

  _add(menus, index) {
    print("add: " + menus[index].name);
    this.setState(() {
      _cart.add(menus[index], 1);
    });
  }

  _remove(menus, index) {
    print("remove: " + menus[index].name);
    this.setState(() {
      _cart.remove(menus[index], 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Menu> menus = restaurant.menus;

    return Scaffold(
      appBar: AppBar(
        title: Text('${restaurant.name}'),
      ),
      body: ListView.builder(
        itemCount: menus.length,
        itemBuilder: (context, index) {
          Menu menu = menus[index];
          return new GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return new Container(
                    height: 150.0,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Image.network(
                            menu.picture,
                            alignment: Alignment.center,
                            height: 300.0,
                            width: 150.0,
                          ),
                          title: Text(
                              menu.name + " " + menu.price.toString() + " ฿"),
                          subtitle: Text(
                            menu.description,
                            overflow: TextOverflow.clip,
                            maxLines: 3,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Image.network(
                      menu.picture,
                      alignment: Alignment.center,
                      height: 300.0,
                      width: 150.0,
                    ),
                    title: Text(menu.name),
                    subtitle: Text("ราคา ${menu.price.toString()} ฿"),
                  ),
                  ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.remove),
                          splashColor: Colors.transparent,
                          onPressed: () {
                            _remove(menus, index);
                          },
                        ),
                        Text(_cart.getNumberByMenu(menu).toString()),
                        IconButton(
                          icon: Icon(Icons.add),
                          splashColor: Colors.transparent,
                          onPressed: () {
                            _add(menus, index);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: _icon,
        label: Text("ตั้งค่าการซื้อ"),
        onPressed: () {
          print("Buy: " + _cart.toString());
          if (_cart.isOrderExist()) {
            // FIXME: update this code
            // https://marcinszalek.pl/flutter/flutter-fullscreendialog-tutorial-weighttracker-ii/
            _openAddEntryDialog();
          } else {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return new Container(
                  child: new Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: new Text(
                      'ต้องเลือกอย่างน้อย 1 เมนู',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 24.0),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future _openAddEntryDialog() async {
    Navigator.of(context).push(
          MaterialPageRoute<DateTime>(
              builder: (BuildContext context) {
                return DateTimeDialog.add(DateTime.now(), _cart);
              },
              fullscreenDialog: true),
        );
  }
}

class WeightEntry {}
