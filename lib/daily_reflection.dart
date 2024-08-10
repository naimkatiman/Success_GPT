import 'package:flutter/material.dart';

class DailyReflection extends StatefulWidget {
  const DailyReflection({Key? key}) : super(key: key);

  @override
  _DailyReflectionState createState() => _DailyReflectionState();
}

class _DailyReflectionState extends State<DailyReflection> {
  final TextEditingController _reflectionController = TextEditingController();

  @override
  void dispose() {
    _reflectionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Daily Reflection',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _reflectionController,
            maxLines: 5,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your reflection here',
            ),
          ),
        ],
      ),
    );
  }
}