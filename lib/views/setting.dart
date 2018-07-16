import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: new ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.language),
            title: Text('ตั้งค่าภาษา'),
          ),
          ListTile(
            leading: Icon(Icons.notifications_active),
            title: Text('ตั้งค่าการแจ้งเตือน'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('แก้ไขข้อมูลส่วนตัว'),
            trailing: const Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.library_books),
            title: Text('แนะนำการใช้งาน'),
            trailing: const Icon(Icons.arrow_forward),
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
//          SwitchListTile(
//            title: const Text('Lights'),
//            value: _lights,
//            onChanged: (bool value) { setState(() { _lights = value; }); },
//            secondary: const Icon(Icons.lightbulb_outline),
//          )
        ],
      ),
    );
  }
}