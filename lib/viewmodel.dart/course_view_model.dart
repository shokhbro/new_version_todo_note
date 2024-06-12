import 'package:flutter/cupertino.dart';
import 'package:todo_note_project/models/course.dart';
import 'package:todo_note_project/services/course_http_servise.dart';

class CourseViewModel extends ChangeNotifier {
  final CourseHttpService courseHttpService = CourseHttpService();
  List<Course> _courses = [];
  List<Course> _favoriteCourses = [];
  List<Course> _cartCourses = [];

  List<Course> get courses => _courses;
  List<Course> get favoriteCourses => _favoriteCourses;
  List<Course> get cartCourses => _cartCourses;

  Future<void> fetchCourses() async {
    _courses = await courseHttpService.fetchCourse();
    _favoriteCourses = _courses.where((course) => course.isFavorite).toList();
    notifyListeners();
  }

  Future<void> addCourse(Course course) async {
    await courseHttpService.addCourse(course);
    await fetchCourses();
  }

  void toggleFavorite(String courseId) {
    int index = _courses.indexWhere((course) => course.id == courseId);
    if (index != -1) {
      _courses[index].isFavorite = !_courses[index].isFavorite;
      if (_courses[index].isFavorite) {
        _favoriteCourses.add(_courses[index]);
      } else {
        _favoriteCourses.removeWhere((course) => course.id == courseId);
      }
      notifyListeners();
    }
  }

  void updateCourse(Course updatedCourse) {
    int index = _courses.indexWhere((course) => course.id == updatedCourse.id);
    if (index != -1) {
      _courses[index] = updatedCourse;
      notifyListeners();
    }
  }

  void deleteCourse(String courseId) {
    _courses.removeWhere((course) => course.id == courseId);
    _favoriteCourses.removeWhere((course) => course.id == courseId);
    _cartCourses.removeWhere((course) => course.id == courseId);
    notifyListeners();
  }

  void addToCart(Course course) {
    if (!_cartCourses.any((c) => c.id == course.id)) {
      _cartCourses.add(course);
    }
    notifyListeners();
  }
}
