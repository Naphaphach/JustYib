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
        title: Text("ข้อมูลของฉัน"),
      ),
      body: new SingleChildScrollView(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(20.0),
              child: new Form(
                child: new Column(
                  children: <Widget>[
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/4/4a/Profil_licnosti.png',
                      width: 128.0,
                      height: 128.0,
                    ),
                    TextFormField(
                      initialValue: "Just",
                      decoration: InputDecoration(
                        labelText: 'ชื่อ',
                      ),
                    ),
                    TextFormField(
                      initialValue: "Yip",
                      decoration: InputDecoration(
                        labelText: 'นามสกุล',
                      ),
                    ),
                    TextFormField(
                      initialValue: "098-765-4321",
                      decoration: InputDecoration(
                        labelText: 'เบอร์โทรศัพท์',
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(8.0)),
                    RaisedButton(
                      onPressed: () {
                        print('Save');
                      },
                      child: Text('บันทึก'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
