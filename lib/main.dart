// lib/main.dart
import 'package:flutter/material.dart';

// Conditional imports:
// Jika dijalankan pada Web (dart:html tersedia), gunakan home_page_web.dart.
// Jika dijalankan pada IO (mobile/desktop), gunakan home_page_mobile.dart.
// Jika tidak, fallback ke stub.
import 'home_page_stub.dart'
    if (dart.library.html) 'home_page_web.dart'
    if (dart.library.io) 'home_page_mobile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sendec Secure',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // Mengacu pada HomePage yang dipilih secara kondisional.
      debugShowCheckedModeBanner: false,
    );
  }
}
