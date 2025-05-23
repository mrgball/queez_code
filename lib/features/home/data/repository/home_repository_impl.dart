import 'package:code_queez/core/helper/dio_helper.dart';
import 'package:code_queez/core/utils/app_exceptions.dart';
import 'package:code_queez/core/utils/injector.dart';
import 'package:code_queez/features/home/domain/repository/home_repository.dart';
import 'package:dio/dio.dart';

class HomeRepositoryImpl implements HomeRepository {
  final DioHelper _dioHelper = locator<DioHelper>();

  @override
  Future<List> fetchCategories(Map<String, dynamic>? params) async {
    try {
      final response = await _dioHelper.getRequest(
        '/api/v1/categories',
        queryParameters: params,
      );

      return response.data ?? [];
    } on DioException catch (e) {
      throw DataException(message: 'Error : ${e.message}');
    } catch (e) {
      rethrow;
    }
  }
}
