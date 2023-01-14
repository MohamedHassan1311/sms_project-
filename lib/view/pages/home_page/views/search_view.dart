import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_highlight_text/search_highlight_text.dart';

import '../../../../controller/search_controler.dart';
import '../units/list_sms.dart';
import '../units/search_field.dart';
import '../units/total_card.dart';

class SearchView extends ConsumerWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch(searchController);

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Search sms'),
          leading: IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => controller.refresh(),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SearchField(
                controller: controller,
              ),
              Expanded(
                child: controller.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SearchTextInheritedWidget(
                        searchText: controller
                            .searchText, // <-- Here we pass the search text to the widget tree to be used by the SearchHighlightText widget
                        child: ListSmssWidget(
                          listSmss: controller.sms,
                        ),
                      ),
              ),
              TotalCard(value: controller.smsAmount),
            ],
          ),
        ),
      ),
    );
  }
}
