import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_note_project/models/course.dart';

class CourseHttpService {
  final Uri url = Uri.parse(
    "https://course-8c4f2-default-rtdb.europe-west1.firebasedatabase.app/courses.json",
  );

  Future<List<Course>> fetchCourse() async {
    final response = await http.get(url);
    final data = jsonDecode(response.body) as Map<String, dynamic>;

    List<Course> loadedCourses = [];
    data.forEach((courseId, courseData) {
      loadedCourses.add(Course.fromJson({...courseData, 'id': courseId}));
    });
    return loadedCourses;
  }

  Future<void> addCourse(Course course) async {
    try {
      final response = await http.post(
        url,
        body: jsonEncode(course.toJson()),
      );
      if (response.statusCode == 200) {
        print('Course added successfully');
      } else {
        throw Exception('Failed to add course');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateCourse(String id, Course course) async {
    try {
      final updateUrl = Uri.parse("$url/$id.json");
      final response = await http.put(
        updateUrl,
        body: jsonEncode(course.toJson()),
      );
      if (response.statusCode == 200) {
        print('Course updated successfully');
      } else {
        throw Exception('Failed to update course');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteCourse(String id) async {
    try {
      final deleteUrl = Uri.parse("$url/$id.json");
      final response = await http.delete(deleteUrl);
      if (response.statusCode == 200) {
        print('Course deleted successfully');
      } else {
        throw Exception('Failed to delete course');
      }
    } catch (e) {
      print(e);
    }
  }
}
