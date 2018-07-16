import 'package:flutter/material.dart';

//import 'package:kcapstone/card.dart';
import 'package:kcapstone/catalog.dart';

//import 'package:kcapstone/list.dart';
import 'package:kcapstone/nearby.dart';

import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'AppName'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

//  ListModel<int> _list;
//  int _selectedItem;
//  int _nextItem; // The next item inserted when the user presses the '+' button.

  @override
  void initState() {
    super.initState();
//    _list = ListModel<int>(
//      listKey: _listKey,
//      initialItems: <int>[0, 1, 2],
//      removedItemBuilder: _buildRemovedItem,
//    );
//    _nextItem = 3;
  }

//  Widget _buildRemovedItem(
//      int item, BuildContext context, Animation<double> animation) {
//    return CardItem(
//      animation: animation,
//      item: item,
//      selected: false,
//      // No gesture detector here: we don't want removed items to be interactive.
//    );
//  }

  // Insert the "next item" into the list model.
//  void _insert() {
//    final int index =
//        _selectedItem == null ? _list.length : _list.indexOf(_selectedItem);
//    _list.insert(index, _nextItem++);
//  }

  // Remove the selected item from the list model.
//  void _remove() {
//    if (_selectedItem != null) {
//      _list.removeAt(_list.indexOf(_selectedItem));
//      setState(() {
//        _selectedItem = null;
//      });
//    }
//  }

  // Used to build list items that haven't been removed.
//  Widget _buildItem(
//      BuildContext context, int index, Animation<double> animation) {
//    return CardItem(
//      animation: animation,
//      item: _list[index],
//      selected: _selectedItem == _list[index],
//      onTap: () {
//        setState(() {
//          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
//        });
//      },
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("Search");
              }),
          new IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                print("Settings");
              })
        ],
      ),
      body: FutureBuilder<List<Nearby>>(
        future: Nearby.fetchPhotos(context, http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? CatalogList(catalog: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
//      body: new Center(
//        child: Padding(
//          padding: const EdgeInsets.all(16.0),
//          child: AnimatedList(
//            key: _listKey,
//            initialItemCount: _list.length,
//            itemBuilder: _buildItem,
//          ),
//        ),
//      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          print("Hello world");
        },
        tooltip: 'Current order',
        child: new Icon(Icons.list),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
