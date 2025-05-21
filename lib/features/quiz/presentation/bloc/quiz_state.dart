part of 'quiz_bloc.dart';

class QuizState extends Equatable {
  final BlocStatus status;
  final List<Question> questions;

  const QuizState({
    this.status = BlocStatus.initial,
    this.questions = const [],
  });

  QuizState copyWith({
    BlocStatus? status,
    List<Question>? questions,
  }) {
    return QuizState(
      status: status ?? this.status,
      questions: questions ?? this.questions,
    );
  }

  @override
  List<Object> get props => [status, questions];
}
