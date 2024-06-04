// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quiz _$QuizFromJson(Map<String, dynamic> json) {
  return Quiz(
    id: json['id'] as String? ??"bush",
    title: json['title'] as String? ??"bush",
    answers: json['answers'] as List<dynamic>,
    correctAnswer: (json['correctAnswer'] as num).toInt(),
  );
}

Map<String, dynamic> _$QuizToJson(Quiz instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'answers': instance.answers,
      'correctAnswer': instance.correctAnswer,
    };
