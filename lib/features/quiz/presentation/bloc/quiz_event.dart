part of 'quiz_bloc.dart';

class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

class GetQuizQuestionsEvent extends QuizEvent {
  final Category category;
  final DifficultyType difficulty;

  const GetQuizQuestionsEvent({
    required this.category,
    required this.difficulty,
  });

  @override
  List<Object> get props => [category, difficulty];
}

class AnswerProccessingEvent extends QuizEvent {
  final String answer;
  final Question question;

  const AnswerProccessingEvent({
    required this.question,
    required this.answer,
  });

  @override
  List<Object> get props => [question, answer];
}
