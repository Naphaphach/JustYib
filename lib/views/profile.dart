import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: new Container(
        child: new Center(
          child: new ListView(
            padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
            children: <Widget>[
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/4/4a/Profil_licnosti.png',
                width: 128.0,
                height: 128.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'ชื่อ',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'นามสกุล',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'เบอร์โทรศัพท์',
                ),
              ),
              Text('บัตรเครดิต'),
              ListTile(
                leading: Icon(Icons.credit_card),
                title: Text('**** **** **** 9999'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}