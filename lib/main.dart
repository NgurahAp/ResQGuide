import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resq_guide/viewModel/service/contact.dart';
import 'package:resq_guide/view/ai/ai_screen.dart.dart';
import 'package:resq_guide/view/emergencyContact/contact_screen.dart';
import 'package:resq_guide/view/guide/burns.dart';
import 'package:resq_guide/view/guide/choking.dart';
import 'package:resq_guide/view/guide/cuts.dart';
import 'package:resq_guide/view/guide/faint.dart';
import 'package:resq_guide/view/home_screen.dart';
import 'package:resq_guide/view/login_screen.dart';

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
