// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTokenModel _$GetTokenModelFromJson(Map<String, dynamic> json) =>
    GetTokenModel(
      json['access_token'] as String,
      json['token_type'] as String,
      json['expires_in'] as int,
    );

Map<String, dynamic> _$GetTokenModelToJson(GetTokenModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'access_token': instance.accesstoken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
    };
