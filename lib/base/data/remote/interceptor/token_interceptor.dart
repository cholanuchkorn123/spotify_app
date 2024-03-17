import 'package:dio/dio.dart';
import 'package:spotify_app/base/data/local/local_storage.dart';
import 'package:spotify_app/base/presentation/base_controller.dart';
import 'package:spotify_app/features/spotify/domain/repositories/get_token_repo.dart';
import 'package:spotify_app/utils/services/log_service.dart';

class TokenInterceptor extends QueuedInterceptorsWrapper {
  final _authHeaderKey = 'Authorization';
  final _bearer = 'Bearer';

  final _localStorage = Get.find<HandleTokenRepo>();
  TokenInterceptor();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    L.info('onRequest TokenInterceptor ${options.uri}');

    try {
      final token = await _localStorage.get();
      L.info('this -token =${token}');
      if (token.isEmpty) {
        await callToken();
      }

      options.headers[_authHeaderKey] = '$_bearer $token';
      handler.next(options);
    } on DioException catch (e) {
      handler.reject(e);
    }
  }

  Future<void> callToken() async {
    await Get.find<GetTokenRepo>().getToken();
  }
}
