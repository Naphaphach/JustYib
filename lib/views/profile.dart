import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<Profile> {
  bool _noti = false;
  bool _lang = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: new ListView(
        children: <Widget>[
          SwitchListTile(
            title: const Text('ตั้งค่าภาษา'),
            value: _lang,
            onChanged: (bool value) { setState(() { _lang = value; }); },
            secondary: const Icon(Icons.language),
          ),
        ],
      ),
    );
  }
}