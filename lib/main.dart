import 'package:flutter/material.dart';
import 'package:job/login/login.dart';

void main() {
  runApp(const MyApp());
}

// ignore: non_constant_identifier_names
final SERVER_IP = _localhost();

String _localhost() {
  // return "http://127.0.0.1:3000";
  return "http://localhost:3000";
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            // textTheme: GoogleFonts.aleo(),

            // colorSchemeSeed: const Color.fromARGB(255, 255, 153, 0)
            ),
        debugShowCheckedModeBanner: false,
        home: const LoginPage());
  }
}
