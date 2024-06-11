import 'package:flutter/material.dart';
import 'package:todo_note_project/models/course.dart';
import 'package:todo_note_project/services/course_http_servise.dart';

class CourseViewModel extends ChangeNotifier {
  final CourseHttpService courseHttpService = CourseHttpService();

  Future<List<Course>> fetchCourses() async {
    List<Course> courses = await courseHttpService.fetchCourse();
    return courses;
  }

  Future<void> addCourse(Course course) async {
    await courseHttpService.addCourse(course);
    await fetchCourses();
  }

  Future<void> updateCourse(String id, Course course) async {
    await courseHttpService.updateCourse(id, course);
    await fetchCourses();
  }

  Future<void> deleteCourse(String id) async {
    await courseHttpService.deleteCourse(id);
    await fetchCourses();
  }
}
