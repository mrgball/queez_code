import 'package:code_queez/core/helper/dio_helper.dart';
import 'package:code_queez/features/home/data/repository/home_repository_impl.dart';
import 'package:code_queez/features/home/domain/repository/home_repository.dart';
import 'package:code_queez/features/home/domain/usecase/home_usecase.dart';
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
  locator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(),
  );

  // Use cases
  locator.registerLazySingleton<GetQuizQuestionsUseCase>(
    () => GetQuizQuestionsUseCase(locator()),
  );
  locator.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(locator()),
  );
}
