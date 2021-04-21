import 'dart:convert';

import 'package:devquiz/common/models/question_model.dart';

enum Level {
  easy,
  medium,
  difficult,
  expert,
}

extension LevelStringExt on String {
  Level getLevel() => {
        'easy': Level.easy,
        'medium': Level.medium,
        'difficult': Level.difficult,
        'expert': Level.expert,
      }[this]!;
}

extension LevelExt on Level {
  String getString() => {
        Level.easy: 'easy',
        Level.medium: 'medium',
        Level.difficult: 'difficult',
        Level.expert: 'expert',
      }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionsAnswered;
  final String image;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionsAnswered = 0,
    required this.image,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionsAnswered': questionsAnswered,
      'image': image,
      'level': level.getString(),
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions'].map((x) => QuestionModel.fromMap(x))),
      questionsAnswered: map['questionsAnswered'] ?? 0,
      image: map['image'],
      level: map['level'].toString().getLevel(),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
