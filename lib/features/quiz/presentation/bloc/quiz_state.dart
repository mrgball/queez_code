part of 'quiz_bloc.dart';

class QuizState extends Equatable {
  final BlocStatus status;
  final List<Question> questions;
  final int currentQuestionIndex;
  final bool? isCorrectAnswer;
  final String? correctAnswerAbjad;
  final String? userAnswerAbjad;
  final bool hasAnswered;
  final bool isQuestionComplete;

  const QuizState({
    this.status = BlocStatus.initial,
    this.questions = const [],
    this.currentQuestionIndex = 0,
    this.isCorrectAnswer,
    this.correctAnswerAbjad,
    this.userAnswerAbjad,
    this.hasAnswered = false,
    this.isQuestionComplete = false,
  });

  QuizState copyWith({
    BlocStatus? status,
    List<Question>? questions,
    bool? isCorrectAnswer,
    int? currentQuestionIndex,
    String? correctAnswerAbjad,
    String? userAnswerAbjad,
    bool? hasAnswered,
    bool? isQuestionComplete,
  }) {
    return QuizState(
      status: status ?? this.status,
      questions: questions ?? this.questions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      isCorrectAnswer: isCorrectAnswer,
      correctAnswerAbjad: correctAnswerAbjad,
      userAnswerAbjad: userAnswerAbjad,
      hasAnswered: hasAnswered ?? this.hasAnswered,
      isQuestionComplete: isQuestionComplete ?? this.isQuestionComplete,
    );
  }

  QuizState resetAnswer() => QuizState(
        status: status,
        questions: questions,
        currentQuestionIndex: currentQuestionIndex,
        isCorrectAnswer: null,
        correctAnswerAbjad: null,
        userAnswerAbjad: null,
        hasAnswered: false,
        isQuestionComplete: false,
      );

  Question? get currentSoal =>
      (questions.isNotEmpty && currentQuestionIndex < questions.length)
          ? questions[currentQuestionIndex]
          : null;

  bool get isUserAnswerCorrect =>
      hasAnswered && correctAnswerAbjad == userAnswerAbjad;

  bool get isUserAnswerIncorrect =>
      hasAnswered && correctAnswerAbjad != userAnswerAbjad;

  String? get expectedAnswer => hasAnswered ? correctAnswerAbjad : null;

  @override
  List<Object?> get props => [
        status,
        questions,
        currentQuestionIndex,
        isCorrectAnswer,
        correctAnswerAbjad,
        userAnswerAbjad,
        hasAnswered,
        isQuestionComplete,
      ];
}
