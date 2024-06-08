import 'package:todo_note_project/models/course.dart';
import 'package:todo_note_project/services/course_http_servise.dart';

class CourseController {
  final courseController = CourseHttpServise();

  Future<List<Course>> getCourse() async {
    List<Course> courses = await courseController.fetchCourse();
    return courses;
  }
}
