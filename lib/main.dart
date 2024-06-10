import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todo_note_project/services/auth_http_services.dart';
import 'package:todo_note_project/utils/routes.dart';
import 'package:todo_note_project/views/screens/login_screen.dart';
import 'package:todo_note_project/views/screens/register_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  bool isCheked = false;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    isChecked();
    super.initState();
  }

  void isChecked() async {
    widget.isCheked = await AuthHttpServices.chekAut();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute:
          widget.isCheked ? '/todo' : const RegisterScreen().toString(),
      routes: AppRoutes.routes,
    );
  }
}
