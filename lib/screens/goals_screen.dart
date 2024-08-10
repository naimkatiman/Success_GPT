import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Goal {
  String title;
  bool isCompleted;

  Goal({required this.title, this.isCompleted = false});

  Map<String, dynamic> toJson() => {
    'title': title,
    'isCompleted': isCompleted,
  };

  factory Goal.fromJson(Map<String, dynamic> json) => Goal(
    title: json['title'],
    isCompleted: json['isCompleted'],
  );
}

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({Key? key}) : super(key: key);

  @override
  _GoalsScreenState createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  List<Goal> _goals = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadGoals();
  }

  void _loadGoals() async {
    final prefs = await SharedPreferences.getInstance();
    final goalsJson = prefs.getString('goals') ?? '[]';
    setState(() {
      _goals = (jsonDecode(goalsJson) as List)
          .map((goal) => Goal.fromJson(goal))
          .toList();
    });
  }

  void _saveGoals() async {
    final prefs = await SharedPreferences.getInstance();
    final goalsJson = jsonEncode(_goals.map((goal) => goal.toJson()).toList());
    await prefs.setString('goals', goalsJson);
  }

  void _addGoal() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _goals.add(Goal(title: _controller.text));
        _controller.clear();
      });
      _saveGoals();
    }
  }

  void _toggleGoal(int index) {
    setState(() {
      _goals[index].isCompleted = !_goals[index].isCompleted;
    });
    _saveGoals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goals'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter a new goal',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addGoal,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _goals.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _goals[index].title,
                    style: TextStyle(
                      decoration: _goals[index].isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  leading: Checkbox(
                    value: _goals[index].isCompleted,
                    onChanged: (_) => _toggleGoal(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}