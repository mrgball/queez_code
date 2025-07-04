part of 'quiz_bloc.dart';

class QuizState extends Equatable {
  final BlocStatus status;
  final List<Question> questions;
  final int currentQuestionIndex;
  final bool? isCorrectAnswer;

  const QuizState({
    this.status = BlocStatus.initial,
    this.questions = const [],
    this.currentQuestionIndex = 0,
    this.isCorrectAnswer,
  });

  QuizState copyWith({
    BlocStatus? status,
    List<Question>? questions,
    bool? isCorrectAnswer,
    int? currentQuestionIndex,
  }) {
    return QuizState(
      status: status ?? this.status,
      questions: questions ?? this.questions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      isCorrectAnswer: isCorrectAnswer,
    );
  }

  QuizState resetAnswer() => QuizState(
        status: status,
        questions: questions,
        currentQuestionIndex: currentQuestionIndex,
        isCorrectAnswer: null,
      );

  Question? get currentSoal =>
      (questions.isNotEmpty && currentQuestionIndex < questions.length)
          ? questions[currentQuestionIndex]
          : null;

  @override
  List<Object?> get props => [
        status,
        questions,
        currentQuestionIndex,
        isCorrectAnswer,
      ];
}
