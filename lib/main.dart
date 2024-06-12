import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_note_project/viewmodel.dart/course_view_model.dart';
import 'package:todo_note_project/utils/routes.dart';
import 'package:todo_note_project/views/screens/admin_panel.dart';
import 'package:todo_note_project/views/screens/cours_screen.dart';
import 'package:todo_note_project/views/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CourseViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Course App',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const HomeScreen(),
        routes: {
          RoutesNames.course: (context) => CourseScreen(),
          RoutesNames.adminPanel: (context) => AdminPanel(),
        },
      ),
    );
  }
}
