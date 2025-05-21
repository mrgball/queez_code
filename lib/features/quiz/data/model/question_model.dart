import 'package:code_queez/core/config/enum.dart';
import 'package:code_queez/features/quiz/data/model/answer_model.dart';
import 'package:code_queez/features/quiz/data/model/correct_answer_model.dart';
import 'package:code_queez/features/quiz/domain/entity/question.dart';

class QuestionModel extends Question {
  const QuestionModel({
    required super.id,
    required super.question,
    required super.descrtiption,
    required super.answers,
    required super.isMultipleAnswer,
    required super.correctAnswers,
    required super.answer,
    required super.explanation,
    required super.category,
    required super.difficulty,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'] ?? 0,
      question: json['question'] ?? '',
      descrtiption: (json['description'] == null ||
              (json['description'] as String).isEmpty)
          ? '-'
          : json['description'],
      answers: (json['answers'] != null && json['answers'].isNotEmpty)
          ? AnswerModel.fromJson(json['answers'])
          : const AnswerModel(
              A: '-',
              B: '-',
              C: '-',
              D: '-',
              E: null,
              F: null,
            ),
      isMultipleAnswer:
          json['multiple_correct_answers']?.toLowerCase() == 'true',
      correctAnswers: (json['correct_answers'] != null)
          ? CorrectAnswerModel.fromJson(json['correct_answers'])
          : const CorrectAnswerModel(
              correctA: false,
              correctB: false,
              correctC: false,
              correctD: false,
              correctE: false,
              correctF: false,
            ),
      answer: json['correct_answer'] ?? '',
      explanation: (json['explanation'] == null) ? '-' : json['explanation'],
      category: json['category'] ?? '-',
      difficulty: (json['difficulty'] == "Easy")
          ? DifficultyType.easy
          : (json['difficulty'] == "Medium")
              ? DifficultyType.medium
              : (json['difficulty'] == "Hard")
                  ? DifficultyType.hard
                  : DifficultyType.easy,
    );
  }
}
