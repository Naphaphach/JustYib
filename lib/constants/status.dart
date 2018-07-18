import 'package:flutter/material.dart';

enum Status {
  none, // ยังไม่ได้จ่ายเงิน
  waiting, // กำลังรอตอบรับ
  processing, // กำลังทำงาน
  finished, // เสร็จแล้ว
  taken, // รับแล้ว
}

class StatusHelper {
  static StatusHelper _instance;

  factory StatusHelper() => _instance ??= new StatusHelper._();

  StatusHelper._();

  Icon getIcon(Status s) {
    switch (s) {
      case Status.none:
        return Icon(Icons.remove);
      case Status.waiting:
        return Icon(Icons.timer);
      case Status.processing:
        return Icon(Icons.restaurant_menu);
      case Status.finished:
        return Icon(Icons.done);
      case Status.taken:
        return Icon(Icons.done_all);
    }
    return Icon(Icons.remove);
  }
}
