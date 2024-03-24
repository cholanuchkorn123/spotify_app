// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_playlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoPlayList _$InfoPlayListFromJson(Map<String, dynamic> json) => InfoPlayList(
      name: json['name'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tracks: ItemWrapper.fromJson(json['tracks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InfoPlayListToJson(InfoPlayList instance) =>
    <String, dynamic>{
      'coverImageList': instance.coverImageList,
      'name': instance.name,
      'images': instance.images,
      'tracks': instance.tracks,
    };

ItemWrapper _$ItemWrapperFromJson(Map<String, dynamic> json) => ItemWrapper(
      listWrapper: (json['items'] as List<dynamic>)
          .map((e) => TracksWrapper.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemWrapperToJson(ItemWrapper instance) =>
    <String, dynamic>{
      'items': instance.listWrapper,
    };

TracksWrapper _$TracksWrapperFromJson(Map<String, dynamic> json) =>
    TracksWrapper(
      listTrack:
          TrackPlayListModel.fromJson(json['track'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TracksWrapperToJson(TracksWrapper instance) =>
    <String, dynamic>{
      'track': instance.listTrack,
    };

AlbumWrapper _$AlbumWrapperFromJson(Map<String, dynamic> json) => AlbumWrapper(
      listArtistModel: (json['artists'] as List<dynamic>)
          .map((e) => ArtistModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AlbumWrapperToJson(AlbumWrapper instance) =>
    <String, dynamic>{
      'artists': instance.listArtistModel,
      'images': instance.images,
    };

TrackPlayListModel _$TrackPlayListModelFromJson(Map<String, dynamic> json) =>
    TrackPlayListModel(
      trackName: json['name'] as String,
      listArtist: AlbumWrapper.fromJson(json['album'] as Map<String, dynamic>),
      id: json['id'] as String,
      uri: json['uri'] as String,
    );

Map<String, dynamic> _$TrackPlayListModelToJson(TrackPlayListModel instance) =>
    <String, dynamic>{
      'name': instance.trackName,
      'album': instance.listArtist,
      'id': instance.id,
      'uri': instance.uri,
    };
