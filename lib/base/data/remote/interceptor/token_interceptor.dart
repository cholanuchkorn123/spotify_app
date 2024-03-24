import 'dart:io';

import 'package:dio/dio.dart';
import 'package:spotify_app/base/data/local/local_storage.dart';
import 'package:spotify_app/base/presentation/base_controller.dart';
import 'package:spotify_app/features/spotify/domain/repositories/get_token_repo.dart';
import 'package:spotify_app/utils/config/app_config.dart';

class TokenInterceptor extends QueuedInterceptorsWrapper {
  final Dio _dio;
  final _authHeaderKey = 'Authorization';
  final _bearer = 'Bearer';

  final _localStorage = Get.find<HandleTokenRepo>();
  TokenInterceptor(this._dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final token = await _localStorage.getToken();
      print(token);
      if (token.isEmpty) {
        await callToken();
        final newToken = await _localStorage.getToken();
        options.headers[_authHeaderKey] = '$_bearer $newToken';
      } else {
        options.headers[_authHeaderKey] = '$_bearer $token';
      }

      handler.next(options);
      return;
    } on DioException catch (e) {
      handler.reject(e);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      await callToken();
    }
    final request = err.requestOptions;
    final token = await _localStorage.getToken();

    try {
      request.headers.update(_authHeaderKey, (_) => '$_bearer $token',
          ifAbsent: () => '$_bearer $token');

      final response = await _dio.request(
        '${AppConfig.baseUrl}${request.path}',
        data: request.data,
        queryParameters: request.queryParameters,
        cancelToken: request.cancelToken,
        options: Options(
          method: request.method,
          sendTimeout: request.sendTimeout,
          extra: request.extra,
          headers: request.headers,
          responseType: request.responseType,
          contentType: request.contentType,
          receiveDataWhenStatusError: request.receiveDataWhenStatusError,
          followRedirects: request.followRedirects,
          maxRedirects: request.maxRedirects,
          requestEncoder: request.requestEncoder,
          responseDecoder: request.responseDecoder,
          listFormat: request.listFormat,
        ),
        onReceiveProgress: request.onReceiveProgress,
      );
      return handler.resolve(response);
    } on DioException catch (e) {
      handler.reject(e);
    }
    handler.next(err);
    return null;
  }

  Future<void> callToken() async {
    await Get.find<GetTokenRepo>().getRefreshToken();
  }
}
