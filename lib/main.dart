import 'package:flutter/material.dart';

void main() {
  runApp(SuccessGPTApp());
}

class SuccessGPTApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SuccessGPT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SuccessGPT'),
      ),
      body: Center(
        child: Text('Welcome to SuccessGPT!'),
      ),
    );
  }
}