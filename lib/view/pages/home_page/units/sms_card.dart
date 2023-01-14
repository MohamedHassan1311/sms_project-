import 'package:flutter/material.dart';
import 'package:search_highlight_text/search_highlight_text.dart';
import 'package:sms/util/extensions.dart';
import 'package:telephony/telephony.dart';
import 'package:sms/util/constant.dart';

class SmsCard extends StatelessWidget {
  const SmsCard({Key? key, required this.sms}) : super(key: key);

  final SmsMessage sms;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        title: Column(
          children: [
            Row(
              children: [
                Text(sms.address.toString(),     style: TextStyle(fontWeight: FontWeight.bold),),
                Spacer(),
                Text(DateTime.fromMillisecondsSinceEpoch(sms.date!)
                    .dateTimeFormat(),maxLines: 1, overflow: TextOverflow.ellipsis,)
              ],
            ),
            SizedBox(
              height: 5,
            ),
            if (sms.body!.getAmountFromStrEX != 0)
              Row(
                children: [
                  Text(
                    sms.body!.getAmountFromStrEX.toString() + currencySymble,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
          ],
        ),
        subtitle: SearchHighlightText(
          sms.body!,
        ),
      ),
    );
  }
}
