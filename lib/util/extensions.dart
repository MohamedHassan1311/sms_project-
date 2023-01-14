import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

//make first letter capital
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}


extension DataTimeExtention on DateTime {
  String dateTimeFormat() {
    return DateFormat("yyyy-MM-dd hh:mm").format(this);
  }
  String dateFormat() {
    return DateFormat("yyyy-MM ").format(this);
  }

  String dateFormat2() {
    return DateFormat("EE, d - MM- yyyy ").format(this);
  }

}

