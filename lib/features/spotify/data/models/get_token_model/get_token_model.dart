import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spotify_app/features/spotify/domain/entities/get_token_entities.dart';
part 'get_token_model.g.dart';

@JsonSerializable()
class GetTokenModel extends TokenEntities {
  @JsonKey(name: "access_token")
  String accesstoken;
  @JsonKey(name: "token_type")
  String tokenType;
  @JsonKey(name: "expires_in")
  int expiresIn;
  GetTokenModel(this.accesstoken, this.tokenType, this.expiresIn)
      : super(accessToken: accesstoken);
  factory GetTokenModel.fromJson(Map<String, dynamic> json) =>
      _$GetTokenModelFromJson(json);
}
