import 'dart:convert';

import 'package:todo_note_project/models/course.dart';
import 'package:http/http.dart' as http;

class CourseHttpServise {
  Future<List<Course>> fetchCourse() async {
    Uri url = Uri.parse(
      "https://course-8c4f2-default-rtdb.europe-west1.firebasedatabase.app/courses.json",
    );
    try {
      final response = await http.get(url);
      final data = jsonDecode(response.body);

      List<Course> loadedCourse = [];

      if (data != null) {
        (data).forEach((key, value) {
          value['id'] = key;
          loadedCourse.add(Course.fromJson(value));
        });
      }
      return loadedCourse;
    } catch (e) {
      print(e);
    }
    return [];
  }
}
