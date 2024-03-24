// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_add_song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestAddSongPlaylist _$RequestAddSongPlaylistFromJson(
        Map<String, dynamic> json) =>
    RequestAddSongPlaylist(
      uris: (json['uris'] as List<dynamic>).map((e) => e as String).toList(),
      position: json['position'] as int,
    );

Map<String, dynamic> _$RequestAddSongPlaylistToJson(
        RequestAddSongPlaylist instance) =>
    <String, dynamic>{
      'uris': instance.uris,
      'position': instance.position,
    };
