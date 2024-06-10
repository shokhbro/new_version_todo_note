import 'package:flutter/material.dart';
import 'package:todo_note_project/models/course.dart';
import 'package:todo_note_project/views/screens/quiz_screen.dart';

class LessonScreen extends StatelessWidget {
  final Course course;

  const LessonScreen({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: course.lesson.length,
        itemBuilder: (context, index) {
          final lesson = course.lesson[index];
          return ListTile(
            title: Text(lesson.title),
            subtitle: Text(lesson.description),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizScreen(lesson: lesson),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
