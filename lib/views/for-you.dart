import 'package:flutter/material.dart';

class ForYouPage extends StatefulWidget {
  @override
  _ForYouState createState() {
    return _ForYouState();
  }
}

class _ForYouState extends State<ForYouPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("For you"),
      ),
      body: Text("Hello world"),
    );
  }
}
