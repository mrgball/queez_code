import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:requests_inspector/requests_inspector.dart';

class DioHelper {
  final Dio dio;
  static const String baseUrl = 'https://quizapi.io';

  DioHelper({
    Duration? connectTimeout,
    Duration? receiveTimeout,
  }) : dio = Dio(BaseOptions(
          connectTimeout: connectTimeout ?? const Duration(seconds: 60),
          receiveTimeout: receiveTimeout ?? const Duration(seconds: 60),
          baseUrl: baseUrl,
          headers: {
            "X-API-KEY": dotenv.env['API_KEY'],
          },
        )) {
    dio.interceptors.addAll([
      // RequestsInspectorInterceptor(),
      // DioLoggingInterceptor(),
    ]);
  }

  Future<Response> postRequest(
    String path, {
    Map<String, dynamic>? requestBody,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final res = await dio.post(
        baseUrl + path,
        data: requestBody,
        queryParameters: queryParameters,
      );

      if ((res.statusCode ?? 0) < 200 || (res.statusCode ?? 0) >= 300) {
        throw DioException(requestOptions: res.requestOptions);
      }

      return res;
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<Response> getRequest(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    try {
      final res = await dio.get(
        baseUrl + path,
        queryParameters: queryParameters,
        data: body,
      );

      if ((res.statusCode ?? 0) < 200 || (res.statusCode ?? 0) >= 300) {
        throw DioException(requestOptions: res.requestOptions);
      }

      return res;
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<Response> patchRequest(
    String path, {
    Map<String, dynamic>? requestBody,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final res = await dio.patch(
        baseUrl + path,
        data: requestBody,
        queryParameters: queryParameters,
      );

      if ((res.statusCode ?? 0) < 200 || (res.statusCode ?? 0) >= 300) {
        throw DioException(requestOptions: res.requestOptions);
      }

      return res;
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<Response> putRequest(
    String path, {
    Map<String, dynamic>? requestBody,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final res = await dio.put(
        baseUrl + path,
        data: requestBody,
        queryParameters: queryParameters,
      );

      if ((res.statusCode ?? 0) < 200 || (res.statusCode ?? 0) >= 300) {
        throw DioException(requestOptions: res.requestOptions);
      }

      return res;
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<Response> postFormRequest(
    String path, {
    Object? requestBody,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final res = await dio.post(
        baseUrl + path,
        data: requestBody,
        queryParameters: queryParameters,
      );

      return res;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
