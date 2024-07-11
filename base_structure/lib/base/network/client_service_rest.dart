import 'package:base_structure/base/utils/constants.dart';
import 'package:base_structure/core/utils/secure_storage.dart';
import 'package:base_structure/features/auth/domain/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  Dio dio = Dio();
  SecureStorage storage = SecureStorage();
  final AuthRepository authRepository;
  ApiClient(this.authRepository) {
    BaseOptions options = BaseOptions(
      baseUrl: Constant.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    );

    dio = Dio(options);
    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) async {
          // if (e.response == null) return handler.reject(e);
          // if (e.response != null && e.response?.statusCode == 401) {
          //
          //   final requestOptions = e.response!.requestOptions;
          //
          //   bool refreshed = await refresheIdToken(options);
          //
          //   if (refreshed) {
          //     final newAccessToken = await storage.getIdToken;
          //     requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
          //
          //     if (requestOptions.headers['Authorization'] != null) {
          //       final originResult = await dio.fetch(requestOptions..path);
          //       if (originResult.statusCode != null &&
          //           originResult.statusCode! ~/ 100 == 2) {
          //         return handler.resolve(originResult);
          //       }
          //     }
          //     return handler.reject(e);
          //   } else {
          //     return handler.reject(e);
          //   }
          // }
          // return handler.next(e);
        },
      ),
    );
  }

  // Future<bool> refresheIdToken(BaseOptions options) async {
  //   Dio refreshTokenDio = Dio(options);
  //   final String? refreshToken = await storage.getRefreshToken ?? "";
  //   if (refreshToken == null || refreshToken == "") return false;
  //
  //   try {
  //     final refreshTokenResponse = await refreshTokenDio.post(
  //       Endpoints.refreshToken,
  //       data: RefreshTokenRequestModel(refreshToken).toJson(),
  //     );
  //
  //     if (refreshTokenResponse.statusCode != 200) return false;
  //
  //     final refreshTokenResponseEntity = LoginResponseModel.fromJson(refreshTokenResponse.data).toEntity();
  //
  //     if (refreshTokenResponseEntity.idToken != "") {
  //       await _refreshAuthDatas(refreshTokenResponseEntity);
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } on DioException catch (e) {
  //     storage.deleteRefreshToken();
  //     return false;
  //   }
  // }
  //
  // Future<void> _refreshAuthDatas(LoginResponseEntity entity) async{
  //   await storage.writeIdToken(entity.idToken);
  //   await storage.writeRefreshToken(entity.refreshToken);
  //   await storage.writeRefreshTokenDuration(entity.refreshExpiresIn);
  //   await storage.writeIdTokenDuration(entity.expiresIn);
  //   await storage.writeIdTokenCreationDate(DateTime.now());
  //   await storage.writeRefreshCreationDate(DateTime.now());
  // }

  Future<Response<T>> get<T>({required String endpoint, Map<String, dynamic>? queryParameters, String? locale}) async {
    try {
      return await dio.get(endpoint,
          queryParameters: queryParameters,
          options: Options(headers: {
            'Authorization': 'Bearer ${await storage.getAuthToken}',
            'Content-Type': 'application/json',
            'locale' : locale
          }));
    } on DioException catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      rethrow;
    }
  }

  Future<Response> post({required String endpoint, dynamic data, Map<String, dynamic>? queryParameters, String? locale}) async {
    try {
      if (kDebugMode) {
        print('Sending POST request to $endpoint with data: $data and query parameters: $queryParameters');
      }
      final response = await dio.post(endpoint,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: {
            'Authorization': 'Bearer ${await storage.getAuthToken}',
            'Content-Type': 'application/json',
            'locale' : locale
          }));
      if (kDebugMode) {
        print('Response received: ${response.data}');
      }
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      rethrow;
    }
  }

  Future<Response> put({required String endpoint, dynamic data, Map<String, dynamic>? queryParameters, String? locale}) async {
    try {
      return await dio.put(endpoint,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: {
            'Authorization': 'Bearer ${await storage.getAuthToken}',
            'Content-Type': 'application/json',
            'locale' : locale
          }));
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      rethrow;
    }
  }

  Future<Response> delete({required String endpoint, Map<String, dynamic>? queryParameters}) async {
    try {
      return await dio.delete(endpoint,
          queryParameters: queryParameters,
          options: Options(headers: {
            'Authorization': 'Bearer ${await storage.getAuthToken}',
            'Content-Type': 'application/json',
          }));
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      rethrow;
    }
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final status = response.statusCode;
    final isValid = status != null && status >= 200 && status < 300;
    if (!isValid) {
      throw DioException.badResponse(
        statusCode: status!,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
    super.onResponse(response, handler);
  }
}
