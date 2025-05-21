import 'package:bloc/bloc.dart';
import 'package:code_queez/core/config/enum.dart';
import 'package:code_queez/core/utils/injector.dart';
import 'package:code_queez/features/home/domain/entity/category.dart';
import 'package:code_queez/features/quiz/data/model/question_model.dart';
import 'package:code_queez/features/quiz/domain/entity/question.dart';
import 'package:code_queez/features/quiz/domain/usecase/quiz_usecase.dart';
import 'package:equatable/equatable.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(const QuizState()) {
    on<GetQuizQuestionsEvent>(_onGetQuizQuestionsEvent);
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
