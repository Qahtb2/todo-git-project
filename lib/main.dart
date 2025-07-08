import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> tasks = [];
  final TextEditingController taskController = TextEditingController();

  void addTask() {
    final text = taskController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        tasks.add(text);
        taskController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ToDo List')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: const InputDecoration(
                      hintText: 'Enter new task',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: addTask,
                  child: const Text('Add'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: tasks.isEmpty
                  ? const Center(child: Text('No tasks yet'))
                  : ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tasks[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
