import 'package:flutter/material.dart';
import 'package:search_highlight_text/search_highlight_text.dart';
import 'package:sms/util/extensions.dart';
import 'package:telephony/telephony.dart';


class SmsCard extends StatelessWidget {
  const SmsCard({Key? key, required this.sms}) : super(key: key);

  final SmsMessage sms;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(

      subtitle  : SearchHighlightText(
          sms.body!,

        ),
        title:Row(children: [
          Text(sms.address.toString()) ,
          Spacer(),
          Text(DateTime.fromMillisecondsSinceEpoch(sms.date!).dateTimeFormat())
        ],)



      ),
    );
  }
}