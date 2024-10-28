import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:static_mejakita/Pages/Login.dart';
import 'package:static_mejakita/Pages/Otp.dart';
import 'package:static_mejakita/Pages/Profile.dart';
import 'package:static_mejakita/Pages/ResetPassword.dart';
import 'package:static_mejakita/Pages/Signup.dart';
import 'package:static_mejakita/Pages/diskusipr.dart';
import 'package:static_mejakita/MaybeUnUssed/pertanyaan1.dart';
import 'package:static_mejakita/Pages/forgot.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await Hive.initFlutter();
  await Hive.openBox('Boxis');
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
        '/pertanyaan': (context) => const Pertanyaan1(),
        '/login': (context) => const Login(),
        '/Signup': (context) => const Sign(),
        '/Forgot': (context) => const Forgot(),
        '/Reset': (context) => const Reset(),
        '/OTP': (context) => const Otp(),
      },
    );
  }
}
