import 'package:flutter/material.dart';
import 'package:static_mejakita/Pages/Jawaban.dart';
import 'package:static_mejakita/Pages/diskusipr.dart';
import 'package:static_mejakita/Pages/history.dart';
import 'package:static_mejakita/Pages/pertanyaan1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/homepage",
      debugShowCheckedModeBanner: false,
      routes: {
      '/homepage': (context) => const Diskusipr(),
      '/history': (context) => const History(),
      '/jawaban': (context) => const Jawaban(),
      '/pertanyaan': (context) => const Pertanyaan1(),
    },
      
    );
  }
}

