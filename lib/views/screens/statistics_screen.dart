import 'package:flutter/material.dart';
import 'package:todo_note_project/controllers/todo_controller.dart';

class StatisticsScreen extends StatelessWidget {
  final TodoController todoController;

  const StatisticsScreen({
    Key? key,
    required this.todoController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stats = todoController.getStatistics();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Statistics",
          style: TextStyle(fontFamily: 'Lato'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Completed Tasks: ${stats['completed']}",
              style: const TextStyle(
                fontFamily: 'Lato',
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Pending Tasks: ${stats['pending']}",
              style: const TextStyle(
                fontFamily: 'Lato',
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
