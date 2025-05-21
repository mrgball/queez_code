import 'package:code_queez/core/shared/base_usecase.dart';
import 'package:code_queez/features/quiz/domain/repository/quiz_repository.dart';

class GetQuizQuestionsUseCase
    implements BaseUseCase<List, Map<String, dynamic>> {
  final QuizRepository _repository;

  GetQuizQuestionsUseCase(this._repository);

  @override
  Future<List> call({Map<String, dynamic>? params}) async {
    return await _repository.getQuizQuestions(params);
  }
}
