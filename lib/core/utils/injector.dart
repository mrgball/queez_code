import 'package:code_queez/core/helper/dio_helper.dart';
import 'package:code_queez/features/quiz/data/repository/quiz_repository_impl.dart';
import 'package:code_queez/features/quiz/domain/repository/quiz_repository.dart';
import 'package:code_queez/features/quiz/domain/usecase/quiz_usecase.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void initLocator() {
  locator.registerLazySingleton<DioHelper>(() => DioHelper());

  // Repositories
  locator.registerLazySingleton<QuizRepository>(
    () => QuizRepositoryImpl(),
  );

  // Use cases
  locator.registerLazySingleton<GetQuizQuestionsUseCase>(
    () => GetQuizQuestionsUseCase(locator()),
  );
}
