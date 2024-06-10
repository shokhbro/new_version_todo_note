import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_note_project/models/course.dart';

class CourseHttpService {
  final Uri url = Uri.parse(
    "https://course-8c4f2-default-rtdb.europe-west1.firebasedatabase.app/courses.json",
  );

Future<List<Course>> fetchCourse() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final dynamic data =
            jsonDecode(response.body); // `dynamic` deb o'zgartirdik
        if (data != null && data is Map<String, dynamic>) {
          // `data` ni tekshirishni o'zgartirdik
          List<Course> loadedCourse = [];
          data.forEach((key, value) {
            value['id'] = key;
            loadedCourse.add(Course.fromJson(value));
          });
          return loadedCourse;
        } else {
          // agar `data` bo'sh yoki javob JSON formatida emas bo'lsa, bo'sh ro'yxat qaytariladi
          return [];
        }
      } else {
        throw Exception('Failed to load courses');
      }
    } catch (e) {
      print(e);
      return [];
    }
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
