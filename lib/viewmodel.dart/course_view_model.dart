import 'package:flutter/material.dart';
import 'package:todo_note_project/models/course.dart';
import 'package:todo_note_project/services/course_http_servise.dart';

class CourseViewModel extends ChangeNotifier {
  final CourseHttpService _courseHttpService = CourseHttpService();
  List<Course> _courses = [];

  List<Course> get courses => _courses;

  Future<void> fetchCourses() async {
    _courses = await _courseHttpService.fetchCourse();
    notifyListeners();
  }

  Future<void> addCourse(Course course) async {
    await _courseHttpService.addCourse(course);
    await fetchCourses();
  }

  Future<void> updateCourse(String id, Course course) async {
    await _courseHttpService.updateCourse(id, course);
    await fetchCourses();
  }

  Future<void> deleteCourse(String id) async {
    await _courseHttpService.deleteCourse(id);
    await fetchCourses();
  }
}
