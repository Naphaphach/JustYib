import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<Setting> {
  bool _noti = false;
  bool _lang = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: new ListView(
        children: <Widget>[
          SwitchListTile(
            title: const Text('ตั้งค่าภาษา'),
            value: _lang,
            onChanged: (bool value) { setState(() { _lang = value; }); },
            secondary: const Icon(Icons.language),
          ),
          SwitchListTile(
            title: const Text('ตั้งค่าการแจ้งเตือน'),
            value: _noti,
            onChanged: (bool value) { setState(() { _noti = value; }); },
            secondary: const Icon(Icons.notifications_active),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('แก้ไขข้อมูลส่วนตัว'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('ช่วยเหลือ'),
            trailing: const Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('เกี่ยวกับเรา'),
            trailing: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}