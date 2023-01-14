import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sms/theme/light_theme.dart';
import 'package:sms/view/pages/home_page/home_page.dart';

void main() {



  runApp(const SmsApp());


}

class SmsApp extends StatelessWidget {
  const SmsApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Sms Demo',
        theme: light(),
      debugShowCheckedModeBanner: false,
        home: const HomePageScreen(),
      ),
    );
  }
}

