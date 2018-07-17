import 'package:flutter/material.dart';

import 'package:kcapstone/views/order.dart';
import 'package:kcapstone/views/foryou.dart';
import 'package:kcapstone/views/home.dart';
import 'package:kcapstone/views/setting.dart';

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
      home: new MyHomePage(title: 'JustForU'),
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: new AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                // icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                // icon: Icon(Icons.favorite),
                text: "For you",
              ),
            ],
          ),
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
                  print("Notification");
                })
          ],
        ),
        body: TabBarView(
          children: [
            Home(),
            ForYou(),
          ],
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
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Setting()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
