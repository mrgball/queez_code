import 'package:bloc/bloc.dart';
import 'package:code_queez/core/config/enum.dart';
import 'package:code_queez/core/config/global.dart';
import 'package:code_queez/core/utils/injector.dart';
import 'package:code_queez/features/home/domain/entity/category.dart';
import 'package:code_queez/features/quiz/data/model/question_model.dart';
import 'package:code_queez/features/quiz/domain/entity/question.dart';
import 'package:code_queez/features/quiz/domain/usecase/quiz_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(const QuizState()) {
    on<GetQuizQuestionsEvent>(_onGetQuizQuestionsEvent);
    on<AnswerProccessingEvent>(_onProccessingAnswer);
    on<ResetAnswerEvent>(_onResetAnswer);
  }

  void _onResetAnswer(
    ResetAnswerEvent event,
    Emitter<QuizState> emit,
  ) {
    emit(state.resetAnswer());
  }

  void _onProccessingAnswer(
    AnswerProccessingEvent event,
    Emitter<QuizState> emit,
  ) {
    // Mengetahui jawaban benar dari tiap soal
    final correctAnswers = event.question.correctAnswers;

    // mendapatkan jawaban yang user telah jawab
    final userFinalAnswer = event.selectedAnswer;

    // lalu proses jawaban user sesuai key jawaban benar dari response
    final selectedKey = 'answer_${userFinalAnswer}_correct';

    // cek apakah jawaban yang user jawaban bernilai true di response
    final isCorrect = correctAnswers[selectedKey]?.toLowerCase() == 'true';

    // cek key yang nilainya 'true'
    final correctAnswerKey = correctAnswers.entries
        .firstWhere(
          (entry) => entry.value.toLowerCase() == 'true',
          orElse: () => const MapEntry('-', '-'),
        )
        .key
        .replaceAll('_correct', '');

    final correctAnswerLetter = convertToAbjad(correctAnswerKey);

    // handling jawaban user dan simpan di state
    if (isCorrect) {
      emit(state.copyWith(
        isCorrectAnswer: true,
        correctAnswerAbjad: correctAnswerLetter,
        userAnswerAbjad: userFinalAnswer,
        hasAnswered: true,
      ));
    } else {
      emit(state.copyWith(
        isCorrectAnswer: false,
        correctAnswerAbjad: correctAnswerLetter,
        userAnswerAbjad: userFinalAnswer,
        hasAnswered: true,
      ));
    }

    Navigator.of(event.context).pop();
  }

  void _onGetQuizQuestionsEvent(
    GetQuizQuestionsEvent event,
    Emitter<QuizState> emit,
  ) async {
    try {
      emit(state.copyWith(status: BlocStatus.loading));

      final response = await locator<GetQuizQuestionsUseCase>().call(
        params: {
          'category': event.category.name,
          'difficulty': event.difficulty.name,
        },
      );

      if (response.isEmpty) {
        throw 'Data question is empty';
      }

      List<Question> questions =
          response.map((item) => QuestionModel.fromJson(item)).toList();

      emit(state.copyWith(
        status: BlocStatus.loaded,
        currentQuestionIndex: 0,
        questions: questions,
      ));

      // reset soal tiap kali get soal pertama kali
      add(ResetAnswerEvent());
    } catch (e) {
      emit(state.copyWith(
        status: BlocStatus.error,
        questions: [],
      ));
    }
  }
}
