// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) {
  List<Lesson> lessons = [];
  (json['lessons'] as Map<String, dynamic>).forEach((key, value) {
    value['id'] = key;
    lessons.add(Lesson.fromJson(value));
  });

  return Course(
    id: json['id'] as String? ??"bush",
    title: json['title'] as String? ??"bush",
    description: json['description'] as String? ??"bush",
    imageUrl: json['imageUrl'] as String? ??"bush",
    lesson: lessons,
    price: (json['price'] as num).toDouble(),
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
