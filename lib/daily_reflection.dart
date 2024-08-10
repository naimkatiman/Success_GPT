import 'package:flutter/material.dart';

class DailyReflection extends StatefulWidget {
  @override
  _DailyReflectionState createState() => _DailyReflectionState();
}

class _DailyReflectionState extends State<DailyReflection> {
  final TextEditingController _reflectionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Daily Reflection',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 16),
          TextField(
            controller: _reflectionController,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Write your daily reflection here...',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _saveReflection,
            child: Text('Save Reflection'),
          ),
        ],
      ),
    );
  }

  void _saveReflection() {
    // TODO: Implement saving reflection to local storage or backend
    print('Reflection saved: ${_reflectionController.text}');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Reflection saved successfully!')),
    );
    _reflectionController.clear();
  }

  @override
  void dispose() {
    _reflectionController.dispose();
    super.dispose();
  }
}