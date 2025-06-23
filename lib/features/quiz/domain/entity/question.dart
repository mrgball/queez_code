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

  Question copyWith({
    int? id,
    String? question,
    String? descrtiption,
    Answer? answers,
    bool? isMultipleAnswer,
    CorrectAnswer? correctAnswers,
    String? answer,
    String? explanation,
    String? category,
    DifficultyType? difficulty,
  }) {
    return Question(
      id: id ?? this.id,
      question: question ?? this.question,
      descrtiption: descrtiption ?? this.descrtiption,
      answers: answers ?? this.answers,
      isMultipleAnswer: isMultipleAnswer ?? this.isMultipleAnswer,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      answer: answer ?? this.answer,
      explanation: explanation ?? this.explanation,
      category: category ?? this.category,
      difficulty: difficulty ?? this.difficulty,
    );
  }

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
