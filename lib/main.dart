import 'package:flutter/material.dart';
import 'package:static_mejakita/Pages/Jawaban.dart';
import 'package:static_mejakita/Pages/Login.dart';
import 'package:static_mejakita/Pages/Profile.dart';
import 'package:static_mejakita/Pages/Signup.dart';
import 'package:static_mejakita/Pages/diskusipr.dart';
import 'package:static_mejakita/MaybeUnUssed/pertanyaan1.dart';
import 'package:static_mejakita/Pages/forgot.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/login",
      debugShowCheckedModeBanner: false,
      routes: {
        '/homepage': (context) => const Diskusipr(),
        '/history': (context) => const Profile(),
        '/jawaban': (context) => const Jawaban(),
        '/pertanyaan': (context) => const Pertanyaan1(),
        '/login': (context) => const Login(),
        '/Signup': (context) => const Sign(),
        '/Forgot': (context) => const Forgot(),

      },
    );
  }
}
