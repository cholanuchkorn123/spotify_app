// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_create_playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestCreatePlaylist _$RequestCreatePlaylistFromJson(
        Map<String, dynamic> json) =>
    RequestCreatePlaylist(
      description: json['description'] as String,
      name: json['name'] as String,
      public: json['public'] as bool,
    );

Map<String, dynamic> _$RequestCreatePlaylistToJson(
        RequestCreatePlaylist instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'public': instance.public,
    };
