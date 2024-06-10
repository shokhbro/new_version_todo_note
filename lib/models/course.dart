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
    List<Lesson> lessons = [];
    (json['lesson'] as List<dynamic>).forEach((lessonJson) {
      lessons.add(Lesson.fromJson(lessonJson));
    });

    return Course(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      lesson: lessons,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return _$CourseToJson(this);
  }
}
