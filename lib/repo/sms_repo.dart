import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:telephony/telephony.dart';

class SMSRepoController {
  final Telephony telephony = Telephony.instance;
  Future<List<SmsMessage>> searchSms(String? query) async {
    // get sms from phone
    final sms = await getSms(query);

    // filter sms by query
print(sms.first.body);
    if (query == null || query.isEmpty) {
      return sms;
    }

    final filteredSms = sms.where((sms) {
      final titleLower = sms.body!.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower);
    }).toList();
    return filteredSms;
  }

  Future<List<SmsMessage>> getSms(query) async {

    return  await telephony.getInboxSms(

    );
  }

}