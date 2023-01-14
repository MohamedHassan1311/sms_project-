import 'package:flutter/material.dart';
import 'package:search_highlight_text/search_highlight_text.dart';
import 'package:sms/util/extensions.dart';
import 'package:telephony/telephony.dart';


class TotalCard extends StatelessWidget {
  const TotalCard({Key? key, required this.value}) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: true,
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            width: double.infinity,
            alignment: Alignment.center,
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Text(
                  "value approx",
                  style: TextStyle(color: Colors.white),
                ),
                Spacer(),
                Text(
                  value.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ))
      ],
    ));
  }
}