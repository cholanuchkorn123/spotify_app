// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayListResponse _$PlayListResponseFromJson(Map<String, dynamic> json) =>
    PlayListResponse(
      wrapper:
          PlayListWrapModel.fromJson(json['playlists'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayListResponseToJson(PlayListResponse instance) =>
    <String, dynamic>{
      'playlists': instance.wrapper,
    };

PlayListWrapModel _$PlayListWrapModelFromJson(Map<String, dynamic> json) =>
    PlayListWrapModel(
      playListModel: (json['items'] as List<dynamic>)
          .map((e) => PlayListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlayListWrapModelToJson(PlayListWrapModel instance) =>
    <String, dynamic>{
      'items': instance.playListModel,
    };

PlayListModel _$PlayListModelFromJson(Map<String, dynamic> json) =>
    PlayListModel(
      description: json['description'] as String,
      id: json['id'] as String,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      public: json['public'] as bool,
      type: json['type'] as String,
      uri: json['uri'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$PlayListModelToJson(PlayListModel instance) =>
    <String, dynamic>{
      'imagesList': instance.imagesList?.map((e) => e.toJson()).toList(),
      'description': instance.description,
      'id': instance.id,
      'name': instance.name,
      'images': instance.images?.map((e) => e.toJson()).toList(),
      'public': instance.public,
      'type': instance.type,
      'uri': instance.uri,
    };

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      url: json['url'] as String,
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'url': instance.url,
    };
