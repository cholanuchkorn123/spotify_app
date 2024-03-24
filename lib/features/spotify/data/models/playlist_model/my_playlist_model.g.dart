// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_playlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyPlaylistResponse _$MyPlaylistResponseFromJson(Map<String, dynamic> json) =>
    MyPlaylistResponse(
      name: json['name'] as String,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tracks:
          TrackItemWrapName.fromJson(json['tracks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyPlaylistResponseToJson(MyPlaylistResponse instance) =>
    <String, dynamic>{
      'coverImageList': instance.coverImageList,
      'name': instance.name,
      'images': instance.images,
      'tracks': instance.tracks,
    };

TrackWrapItems _$TrackWrapItemsFromJson(Map<String, dynamic> json) =>
    TrackWrapItems(
      json['track'] == null
          ? null
          : TrackModel.fromJson(json['track'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrackWrapItemsToJson(TrackWrapItems instance) =>
    <String, dynamic>{
      'track': instance.trackItem,
    };

TrackItemWrapName _$TrackItemWrapNameFromJson(Map<String, dynamic> json) =>
    TrackItemWrapName(
      (json['items'] as List<dynamic>?)
          ?.map((e) => TrackWrapItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrackItemWrapNameToJson(TrackItemWrapName instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
