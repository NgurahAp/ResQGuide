import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resq_guide/helpers/contact.dart';
import 'package:resq_guide/screen/ai/ai_screen.dart.dart';
import 'package:resq_guide/screen/emergencyContact/contact_screen.dart';
import 'package:resq_guide/screen/guide/burns.dart';
import 'package:resq_guide/screen/guide/choking.dart';
import 'package:resq_guide/screen/guide/cuts.dart';
import 'package:resq_guide/screen/guide/faint.dart';
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
      theme: ThemeData(
        fontFamily: 'sfmono',
        primaryColor: const Color.fromARGB(255, 223, 127, 80),
        hintColor: const Color.fromARGB(255, 223, 127, 80),
      ),
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => const HomePage(),
        '/ai': (context) => const AIScreen(),
        '/guide0': (context) => const FaintPage(),
        '/guide1': (context) => const CutsPage(),
        '/guide2': (context) => const ChokingPage(),
        '/guide3': (context) => const BurnsPage(),
        '/contact': (context) => ChangeNotifierProvider(
              create: (_) => UserProvider(),
              child: const ContactScreen(),
            ),
      },
    );
  }
}
