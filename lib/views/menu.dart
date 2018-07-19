import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcapstone/components/datetimePicker.dart';
import 'package:kcapstone/models/cart.dart';
import 'package:kcapstone/models/menu.dart';
import 'package:kcapstone/models/restaurant.dart';

import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:kcapstone/views/payment.dart';

class MenuPage extends StatefulWidget {
  final Restaurant restaurant;

  MenuPage({Key key, @required this.restaurant}) : super(key: key);

  @override
  MenuState createState() {
    return MenuState(restaurant: restaurant);
  }
}

class MenuState extends State<MenuPage> {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  final Restaurant restaurant;
  Cart _cart;

  Icon _icon = Icon(Icons.timer);

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
        label: Text("ตั้งเวลา"),
        onPressed: () {
          print("Buy: " + _cart.toString());
          if (_cart.isOrderExist()) {
            // FIXME: update this code
            // https://marcinszalek.pl/flutter/flutter-fullscreendialog-tutorial-weighttracker-ii/
            showModalBottomSheet(
                context: context,
                builder: (_) {
                  return ListView(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.calendar_today),
                        title: DateTimeItem(
                          date: date,
                          time: time,
                          onChanged: (dateTime) => this.setState(() {
                                print(dateTime);

                                date = dateTime;
                                time = TimeOfDay.fromDateTime(dateTime);

                                _cart.setTime(dateTime);
                              }),
                        ),
                      ),
                      FlatButton.icon(
                        onPressed: () {
                          SingletonCart().add(_cart);

                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Payment()));
                        },
                        icon: Icon(Icons.add),
                        label: Text("ซื้อ"),
                      ),
                    ],
                  );
                });
            // _cart.setTime(dt);
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
}
