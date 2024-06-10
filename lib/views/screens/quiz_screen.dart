import 'package:flutter/material.dart';
import 'package:todo_note_project/models/lesson.dart';
import 'package:todo_note_project/views/widgets/quiz_details.dart';

class QuizScreen extends StatelessWidget {
  final Lesson lesson;

  const QuizScreen({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: lesson.quizes.length,
        itemBuilder: (context, index) {
          final quiz = lesson.quizes[index];
          return ListTile(
            title: Text(quiz.title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizDetailScreen(quiz: quiz),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
