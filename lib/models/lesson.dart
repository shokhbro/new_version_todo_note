import 'package:json_annotation/json_annotation.dart';
import 'package:todo_note_project/models/quiz.dart';

part 'lesson.g.dart';

@JsonSerializable()
class Lesson {
  final String id;
  final String courseld;
  final String title;
  final String description;
  final String videoUrl;
  final List<Quiz> quizes;

  Lesson({
    required this.id,
    required this.courseld,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.quizes,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return _$LessonFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$LessonToJson(this);
  }
}
