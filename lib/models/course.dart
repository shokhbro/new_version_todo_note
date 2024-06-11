import 'package:json_annotation/json_annotation.dart';
import 'package:todo_note_project/models/lesson.dart';

part 'course.g.dart';

@JsonSerializable()
class Course {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<Lesson> lesson;
  final double price;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.lesson,
    required this.price,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return _$CourseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CourseToJson(this);
  }
}
