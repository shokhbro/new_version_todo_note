import 'package:todo_note_project/views/screens/cours_screen.dart';
import 'package:todo_note_project/views/screens/home_screen.dart';
import 'package:todo_note_project/views/screens/profile__screen.dart';
import 'package:todo_note_project/views/screens/todo_screen.dart';

class AppRoutes {
  static final routes = {
    RoutesNames.home: (ctx) => const HomeScreen(),
    RoutesNames.course: (ctx) => CoursScreen(),
    RoutesNames.todoScreen: (ctx) => const TodoScreen(),
    RoutesNames.profileScreen: (ctx) => const ProfileScreen(),
  };
}

class RoutesNames {
  static String home = '/';
  static String course = '/course';
  static String todoScreen = '/todo';
  static String profileScreen = '/profile';
}
