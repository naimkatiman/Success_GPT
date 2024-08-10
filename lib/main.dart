import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/journal_screen.dart';
import 'screens/goals_screen.dart';
import 'screens/quotes_screen.dart';

void main() {
  runApp(const SuccessGPTApp());
}

class SuccessGPTApp extends StatelessWidget {
  const SuccessGPTApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SuccessGPT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
      routes: {
        '/journal': (context) => const JournalScreen(),
        '/goals': (context) => const GoalsScreen(),
        '/quotes': (context) => const QuotesScreen(),
      },
    );
  }
}