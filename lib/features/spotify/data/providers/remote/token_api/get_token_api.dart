import 'package:dio/dio.dart' hide Headers;

import 'package:retrofit/http.dart';
import 'package:spotify_app/base/data/remote/builder/dio_builder.dart';
import 'package:spotify_app/features/spotify/data/models/get_token_model/get_token_model.dart';
import 'package:spotify_app/utils/config/app_config.dart';

part 'get_token_api.g.dart';

@RestApi(baseUrl: AppConfig.baseUrlToken, parser: Parser.JsonSerializable)
abstract class GetTokenApi {
  factory GetTokenApi(DioBuilder dioBuilder) = _GetTokenApi;
  @POST('/api/token')
  @FormUrlEncoded()
  @Headers(
      <String, dynamic>{'Content-Type': 'application/x-www-form-urlencoded'})
  Future<GetTokenModel> getToken(
    @Field("grant_type") String grantType,
    @Field("client_id") String clientId,
    @Field("client_secret") String clientSecret,
    @Field("refresh_token") String refreshToken,
  );
}
