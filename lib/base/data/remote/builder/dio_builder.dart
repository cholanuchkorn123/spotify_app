import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:spotify_app/base/data/remote/interceptor/token_interceptor.dart';

enum DioType { withToken, ignoredToken }

class DioBuilder extends DioMixin implements Dio {
  final String contentType = 'application/json';
  final int connectionTimeOutMls = 60000;
  final int readTimeOutMls = 60000;
  final int writeTimeOutMls = 60000;

  DioBuilder(
      {DioType type = DioType.ignoredToken,
      required BaseOptions options,
      ResponseType responseType = ResponseType.json}) {
    options = BaseOptions(
        baseUrl: options.baseUrl,
        contentType: contentType,
        connectTimeout: Duration(milliseconds: connectionTimeOutMls),
        receiveTimeout: Duration(milliseconds: readTimeOutMls),
        sendTimeout: Duration(milliseconds: writeTimeOutMls),
        responseType: responseType);

    this.options = options;

    // final logger = PrettyDioLogger(
    //     requestHeader: true,
    //     requestBody: true,
    //     responseBody: true,
    //     responseHeader: true,
    //     error: true,
    //     compact: true,
    //     maxWidth: 90);
    // interceptors.add(_logger);
    if (type == DioType.withToken) {
      interceptors.add(TokenInterceptor(Dio()));
    }

    httpClientAdapter = IOHttpClientAdapter();
  }
}
