// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lesson _$LessonFromJson(Map<String, dynamic> json) {
  return Lesson(
    id: json['id'] as String? ?? "bush",
    courseld: json['courseld'] as String? ?? "bush",
    title: json['title'] as String? ?? "bush",
    description: json['description'] as String? ?? "bush",
    videoUrl: json['videoUrl'] as String? ?? "bush",
    quizes: (json['quizes'] as List<dynamic>?)
            ?.map((e) => Quiz.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'id': instance.id,
      'courseld': instance.courseld,
      'title': instance.title,
      'description': instance.description,
      'videoUrl': instance.videoUrl,
      'quizes': instance.quizes,
    };
