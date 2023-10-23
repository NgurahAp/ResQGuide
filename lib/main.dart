import 'package:flutter/material.dart';
import 'package:resq_guide/screen/home_screen.dart';
import 'package:resq_guide/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Management',
      theme: ThemeData(fontFamily: 'sfmono'),
      routes: {
        '/': (context) => HomePage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
