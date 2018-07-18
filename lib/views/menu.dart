import 'package:flutter/material.dart';
import 'package:kcapstone/models/menu.dart';
import 'package:kcapstone/models/restaurant.dart';

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
  final Restaurant restaurant;
  List<int> _n;

  // In the constructor, require a restaurant
  MenuState({@required this.restaurant}) {
    _n = List.generate(restaurant.menus.length, (e) {
      return 0;
    });
  }

  _add(menus, index) {
    print("add: " + menus[index].name);
    this.setState(() {
      _n[index]++;
    });
  }

  _remove(menus, index) {
    print("remove: " + menus[index].name);
    this.setState(() {
      if (_n[index] > 0) {
        _n[index]--;
      }
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
                        Text(_n[index].toString()),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Buy");
          if (_n.any((i) {
            return i > 0;
          })) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Payment(
                      restaurant: restaurant,
                      menus: menus,
                      numbers: _n,
                    ),
              ),
            );
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
        tooltip: "Buy",
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
