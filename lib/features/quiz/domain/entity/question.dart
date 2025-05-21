import 'package:code_queez/core/config/enum.dart';
import 'package:code_queez/features/quiz/domain/entity/answer.dart';
import 'package:code_queez/features/quiz/domain/entity/correct_answer.dart';
import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final int id;
  final String question;
  final String descrtiption;
  final Answer answers;
  final bool isMultipleAnswer;
  final CorrectAnswer correctAnswers;
  final String answer;
  final String? explanation;
  final String category;
  final DifficultyType difficulty;

  const Question({
    required this.id,
    required this.question,
    required this.descrtiption,
    required this.answers,
    required this.isMultipleAnswer,
    required this.correctAnswers,
    required this.answer,
    required this.explanation,
    required this.category,
    required this.difficulty,
  });

  @override
  List<Object?> get props => [
        id,
        question,
        descrtiption,
        answers,
        isMultipleAnswer,
        correctAnswers,
        answer,
        explanation,
        category,
        difficulty,
      ];
}
