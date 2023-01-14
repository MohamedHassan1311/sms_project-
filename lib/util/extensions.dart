import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:sms/util/constant.dart';



extension DataTimeExtention on DateTime {
  String dateTimeFormat() {
    return DateFormat("yyyy-MM-dd hh:mm a").format(this);
  }
  String dateFormat() {
    return DateFormat("yyyy-MM ").format(this);
  }

  String dateFormat2() {
    return DateFormat("EE, d - MM- yyyy ").format(this);
  }

}
// get Amount From String by regExp
extension getAmountFromStr on String {
  int get getAmountFromStrEX {
    RegExp regExp = RegExp(r'\d+ AED');
    Iterable<Match> matches = regExp.allMatches(this);
    if(matches.isNotEmpty) {

      return int.parse(matches.first.group(0)!.replaceAll(currencySymble, "")!);
    }
    else return 0;
  }
}


