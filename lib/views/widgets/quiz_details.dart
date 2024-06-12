import 'package:flutter/material.dart';
import 'package:todo_note_project/models/quiz.dart';

class QuizDetailScreen extends StatefulWidget {
  final Quiz quiz;

  const QuizDetailScreen({required this.quiz});

  @override
  _QuizDetailScreenState createState() => _QuizDetailScreenState();
}

class _QuizDetailScreenState extends State<QuizDetailScreen> {
  int _selectedAnswer = -1;
  bool _answered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quiz.title),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          ...widget.quiz.answers.map((answer) {
            final index = widget.quiz.answers.indexOf(answer);
            return RadioListTile(
              title: Text(answer),
              value: index,
              groupValue: _selectedAnswer,
              onChanged: _answered
                  ? null
                  : (value) {
                      setState(() {
                        _selectedAnswer = value as int;
                      });
                    },
            );
          }).toList(),
          ElevatedButton(
            onPressed: _answered
                ? null
                : () {
                    setState(() {
                      _answered = true;
                    });
                  },
            child: const Text('Submit'),
          ),
          if (_answered)
            Text(
              _selectedAnswer == widget.quiz.correctAnswer
                  ? 'Correct!'
                  : 'Wrong! The correct answer is ${widget.quiz.answers[widget.quiz.correctAnswer]}',
            ),
        ],
      ),
    );
  }
}
