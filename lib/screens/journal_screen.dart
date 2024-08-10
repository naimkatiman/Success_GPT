import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({Key? key}) : super(key: key);

  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  final TextEditingController _controller = TextEditingController();
  String _savedReflection = '';

  @override
  void initState() {
    super.initState();
    _loadReflection();
  }

  void _loadReflection() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedReflection = prefs.getString('daily_reflection') ?? '';
      _controller.text = _savedReflection;
    });
  }

  void _saveReflection() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('daily_reflection', _controller.text);
    setState(() {
      _savedReflection = _controller.text;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Reflection saved successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Reflection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'What are you grateful for today?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: _controller,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your reflection here...',
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveReflection,
              child: const Text('Save Reflection'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}