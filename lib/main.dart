import 'package:flutter/material.dart';
import 'package:whatsapp_sender/whatsapp_sender_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whatsapp Sender',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const WhatsappSenderPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

extension StringExtensions on String {
  String onlyDigits() => replaceAll(RegExp(r'[^0-9]'), '');
}
