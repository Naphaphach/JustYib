import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';

import 'package:justyib/views/order.dart';
import 'package:justyib/views/foryou.dart';
import 'package:justyib/views/home.dart';
import 'package:justyib/views/profile.dart';
import 'package:justyib/views/setting.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics analytics = new FirebaseAnalytics();

    return new MaterialApp(
      title: 'Just-Yib',
      theme: new ThemeData(
          primaryColor: Colors.deepOrange.shade500,
          accentColor: Colors.blueAccent),
      home: new MyHomePage(title: 'Just-Yib'),
      navigatorObservers: [
        new FirebaseAnalyticsObserver(analytics: analytics),
      ],
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/home': (context) => MyHomePage(
              title: 'Just-Yib',
              index: 0,
            ),
        '/foryou': (context) => MyHomePage(
              title: 'Just-Yib',
              index: 1,
            ),
        '/profile': (context) => ProfileWidget(),
        '/setting': (context) => Setting(),
        '/order': (context) => Order(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final int index;

  MyHomePage({Key key, this.title, this.index}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState(index: index);
}

class _MyHomePageState extends State<MyHomePage> {
  int index;

  _MyHomePageState({index}) {
    if (index == null) {
      this.index = 0;
    } else {
      this.index = index;
    }
  }

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
                text: "หน้าหลัก",
              ),
              Tab(
                // icon: Icon(Icons.favorite),
                text: "สำหรับคุณ",
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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, "/order");
          },
          tooltip: 'Current order',
          icon: Icon(Icons.shopping_cart),
          label: Text("รายการของฉัน"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: BottomAppBar(
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.pushNamed(context, "/setting");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
