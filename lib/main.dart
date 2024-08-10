import 'package:flutter/material.dart';
import 'daily_reflection.dart';

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
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SuccessGPT'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Welcome to SuccessGPT!'),
              ),
            ),
            const DailyReflection(),
          ],
        ),
      ),
    );
  }
}