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
  final String selectedAnswer;
  final Question question;
  final BuildContext context;

  const AnswerProccessingEvent({
    required this.question,
    required this.selectedAnswer,
    required this.context,
  });

  @override
  List<Object> get props => [
        question,
        selectedAnswer,
        context,
      ];
}

class ResetAnswerEvent extends QuizEvent {}

class NextQuestionEvent extends QuizEvent {
  final BuildContext context;
  final bool isReview;

  const NextQuestionEvent(
    this.context, {
    this.isReview = false,
  });

  @override
  List<Object> get props => [context];
}
