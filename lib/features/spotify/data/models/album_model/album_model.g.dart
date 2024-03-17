// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumResponse _$AlbumResponseFromJson(Map<String, dynamic> json) =>
    AlbumResponse(
      name: json['name'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tracks: TrackWrapper.fromJson(json['tracks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AlbumResponseToJson(AlbumResponse instance) =>
    <String, dynamic>{
      'imagesList': instance.imagesList,
      'name': instance.name,
      'images': instance.images,
      'tracks': instance.tracks,
    };

TrackWrapper _$TrackWrapperFromJson(Map<String, dynamic> json) => TrackWrapper(
      listTrack: (json['items'] as List<dynamic>)
          .map((e) => TrackModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrackWrapperToJson(TrackWrapper instance) =>
    <String, dynamic>{
      'items': instance.listTrack,
    };

TrackModel _$TrackModelFromJson(Map<String, dynamic> json) => TrackModel(
      trackName: json['name'] as String,
      listArtistModel: (json['artists'] as List<dynamic>)
          .map((e) => ArtistModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrackModelToJson(TrackModel instance) =>
    <String, dynamic>{
      'name': instance.trackName,
      'artists': instance.listArtistModel,
    };
