import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_id_model.g.dart';

@JsonSerializable()
class UserIDResponse {
  @JsonKey(name: "id")
  String id;

  UserIDResponse({required this.id});
  factory UserIDResponse.fromJson(Map<String, dynamic> json) =>
      _$UserIDResponseFromJson(json);
}
