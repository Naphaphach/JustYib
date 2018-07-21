import 'package:flutter/material.dart';
import 'package:justyib/models/profile.dart';

import 'package:http/http.dart' as http;

class ProfileWidget extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<ProfileWidget> {
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
            FutureBuilder<Profile>(
              future: Profile.fetchProfile(context, http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);

                return snapshot.hasData
                    ? _ProfileForm(
                        profile: snapshot.data,
                      )
                    : Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileForm extends StatelessWidget {
  final Profile profile;

  const _ProfileForm({Key key, this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(20.0),
      child: new Form(
        child: new Column(
          children: <Widget>[
            Image.network(
              profile.picture,
              width: 128.0,
              height: 128.0,
            ),
            TextFormField(
              initialValue: profile.firstname,
              decoration: InputDecoration(
                labelText: 'ชื่อ',
              ),
            ),
            TextFormField(
              initialValue: profile.lastname,
              decoration: InputDecoration(
                labelText: 'นามสกุล',
              ),
            ),
            TextFormField(
              initialValue: profile.telephone,
              decoration: InputDecoration(
                labelText: 'เบอร์โทรศัพท์',
              ),
            ),
            Padding(padding: const EdgeInsets.all(8.0)),
            RaisedButton(
              onPressed: () {
                print('Save');
                Navigator.popAndPushNamed(context, "/setting");
              },
              child: Text('บันทึก'),
            ),
          ],
        ),
      ),
    );
  }
}
