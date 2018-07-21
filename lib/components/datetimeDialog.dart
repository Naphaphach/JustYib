import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:justyib/models/cart.dart';
import 'package:justyib/views/payment.dart';
import 'package:meta/meta.dart';

// import 'package:numberpicker/numberpicker.dart';

class DateTimeDialog extends StatefulWidget {
  final DateTime dateTime;
  final Cart cart;

  DateTimeDialog.add(this.dateTime, this.cart);

  @override
  _DateTimeDialogState createState() {
    return _DateTimeDialogState(this.cart, dateTime, null);
  }
}

class _DateTimeDialogState extends State<DateTimeDialog> {
  Cart _cart;

  DateTime _dateTime;
  String _note;
  TextEditingController _textController;

  _DateTimeDialogState(this._cart, this._dateTime, this._note);

  Widget _createAppBar(BuildContext context) {
    return new AppBar(
      title: const Text("ตั้งค่าการซื้อ"),
      actions: [
        new FlatButton(
          onPressed: () {
            SingletonCart().add(_cart);

            _cart.setTime(_dateTime);
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => Payment()));
          },
          child: new Text('บันทึก',
              style: Theme
                  .of(context)
                  .textTheme
                  .subhead
                  .copyWith(color: Colors.white)),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _textController = new TextEditingController(text: _note);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _createAppBar(context),
      body: new Column(
        children: [
          new ListTile(
            leading: new Icon(Icons.today, color: Colors.grey[500]),
            title: new DateTimeItem(
              dateTime: _dateTime,
              onChanged: (dateTime) => setState(() => _dateTime = dateTime),
            ),
          ),
          new ListTile(
            leading: new Icon(Icons.speaker_notes, color: Colors.grey[500]),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: 'ความเห็นเพิ่มเติม',
              ),
              controller: _textController,
              onChanged: (value) => _note = value,
            ),
          ),
        ],
      ),
    );
  }
}

class DateTimeItem extends StatelessWidget {
  DateTimeItem({Key key, DateTime dateTime, @required this.onChanged})
      : assert(onChanged != null),
        date = dateTime == null
            ? new DateTime.now()
            : new DateTime(dateTime.year, dateTime.month, dateTime.day),
        time = dateTime == null
            ? new DateTime.now()
            : new TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        super(key: key);

  final DateTime date;
  final TimeOfDay time;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Expanded(
          child: new InkWell(
            onTap: (() => _showDatePicker(context)),
            child: new Padding(
                padding: new EdgeInsets.symmetric(vertical: 8.0),
                child: new Text(new DateFormat('EEEE, MMMM d').format(date))),
          ),
        ),
        new InkWell(
          onTap: (() => _showTimePicker(context)),
          child: new Padding(
              padding: new EdgeInsets.symmetric(vertical: 8.0),
              child: new Text('${time.hour}:${time.minute}')),
        ),
      ],
    );
  }

  Future _showDatePicker(BuildContext context) async {
    DateTime dateTimePicked = await showDatePicker(
        context: context,
        initialDate: date.add(Duration(minutes: 30)),
        firstDate: date,
        lastDate: date.add(Duration(days: 7)));

    if (dateTimePicked != null) {
      onChanged(new DateTime(dateTimePicked.year, dateTimePicked.month,
          dateTimePicked.day, time.hour, time.minute));
    }
  }

  Future _showTimePicker(BuildContext context) async {
    TimeOfDay timeOfDay =
        await showTimePicker(context: context, initialTime: time);

    if (timeOfDay != null) {
      onChanged(new DateTime(
          date.year, date.month, date.day, timeOfDay.hour, timeOfDay.minute));
    }
  }
}
