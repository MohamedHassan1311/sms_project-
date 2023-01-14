import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sms/util/extensions.dart';
import 'package:sms/view/pages/home_page/units/sms_card.dart';
import 'package:telephony/telephony.dart';

class ListSmssWidget extends ConsumerWidget {
  const ListSmssWidget({required this.listSmss, Key? key}) : super(key: key);

  final List<SmsMessage> listSmss;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (listSmss.isEmpty) {
      return const Center(
        child: Text('No SMS found'),
      );
    }

    return GroupedListView(
      elements: listSmss,
      groupBy: (sms) =>
          DateTime.fromMillisecondsSinceEpoch(sms.date!).dateFormat(),

      groupSeparatorBuilder: (String groupByValue) => Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(5)),
              child: Align(
                child: Text(
                  groupByValue,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
      itemBuilder: (context, SmsMessage element) {
        return SmsCard(
          sms: element,
        );
      },
      itemComparator: (sms1, sms2) =>
          DateTime.fromMillisecondsSinceEpoch(sms1.date!).compareTo(
              DateTime.fromMillisecondsSinceEpoch(sms2.date!)), // optional
      useStickyGroupSeparators: false, // optional
      floatingHeader: true, //

      order: GroupedListOrder.DESC, // optional
    );
  }
}
