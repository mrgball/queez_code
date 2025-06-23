part of 'quiz_bloc.dart';

class QuizState extends Equatable {
  final BlocStatus status;
  final List<Question> questions;
  final int currentQuestionIndex;

  const QuizState({
    this.status = BlocStatus.initial,
    this.questions = const [],
    this.currentQuestionIndex = 0,
  });

  QuizState copyWith({
    BlocStatus? status,
    List<Question>? questions,
    int? currentQuestionIndex,
  }) {
    return QuizState(
      status: status ?? this.status,
      questions: questions ?? this.questions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
    );
  }

  @override
  List<Object> get props => [status, questions, currentQuestionIndex];
}
