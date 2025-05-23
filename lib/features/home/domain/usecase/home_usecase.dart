import 'package:code_queez/core/shared/base_usecase.dart';
import 'package:code_queez/features/home/domain/repository/home_repository.dart';

class GetCategoriesUseCase implements BaseUseCase<List, Map<String, dynamic>> {
  final HomeRepository _homeRepository;

  GetCategoriesUseCase(this._homeRepository);

  @override
  Future<List> call({Map<String, dynamic>? params}) {
    return _homeRepository.fetchCategories(params);
  }
}
