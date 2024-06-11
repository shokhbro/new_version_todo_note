// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) {
  return Course(
    id: json['id'] as String? ?? "bush",
    title: json['title'] as String? ?? "bush",
    description: json['description'] as String? ?? "bush",
    imageUrl: json['imageUrl'] as String? ?? "bush",
    lesson: (json['lesson'] as List<dynamic>?)
            ?.map((e) => Lesson.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    price: (json['price'] as num?)?.toDouble() ?? 0.0,
  );
}

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'lesson': instance.lesson,
      'price': instance.price,
    };
