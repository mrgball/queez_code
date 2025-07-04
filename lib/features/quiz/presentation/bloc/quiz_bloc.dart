import 'package:bloc/bloc.dart';
import 'package:code_queez/core/config/enum.dart';
import 'package:code_queez/core/utils/injector.dart';
import 'package:code_queez/features/home/domain/entity/category.dart';
import 'package:code_queez/features/quiz/data/model/question_model.dart';
import 'package:code_queez/features/quiz/domain/entity/question.dart';
import 'package:code_queez/features/quiz/domain/entity/user_answer.dart';
import 'package:code_queez/features/quiz/domain/usecase/quiz_usecase.dart';
import 'package:equatable/equatable.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(const QuizState()) {
    on<GetQuizQuestionsEvent>(_onGetQuizQuestionsEvent);
    on<AnswerProccessingEvent>(_onProccessingAnswer);
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

    // handling jawaban user dan simpan di state
    if (isCorrect) {
      emit(state.copyWith(isCorrectAnswer: true));
    } else {
      emit(state.copyWith(isCorrectAnswer: false));
    }
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
    } catch (e, s) {
      print('asdad: $e \n $s');

      emit(state.copyWith(
        status: BlocStatus.error,
        questions: [],
      ));
    }
  }
}
