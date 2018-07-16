import 'package:flutter/material.dart';

import 'package:kcapstone/controllers/catalog.dart';
import 'package:kcapstone/views/for-you.dart';
import 'package:kcapstone/models/restaurant.dart';

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
  int index = 0;

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
      body: FutureBuilder<List<Restaurant>>(
        future: Restaurant.fetchPhotos(context, http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? CatalogList(catalog: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
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
              onPressed: () {
                print("Home");
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                print("Favorite");
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                print("Settings");
              },
            ),
          ],
        ),
      ),
    );
  }
}
