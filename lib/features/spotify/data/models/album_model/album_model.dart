import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spotify_app/features/spotify/data/models/playlist_model/playlist_model.dart';
import 'package:spotify_app/features/spotify/data/models/search_model/search_model.dart';
import 'package:spotify_app/features/spotify/domain/entities/album_entities.dart';
import 'package:spotify_app/features/spotify/domain/entities/search_album_entities.dart';
part 'album_model.g.dart';

@JsonSerializable()
class AlbumResponse extends AlbumEntities {
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "images")
  List<ImageModel> images;
  @JsonKey(name: "tracks")
  TrackWrapper tracks;
  AlbumResponse(
      {required this.name, required this.images, required this.tracks})
      : super(nameAlbum: name, listTrack: tracks.listTrack, imagesList: images);
  factory AlbumResponse.fromJson(Map<String, dynamic> json) =>
      _$AlbumResponseFromJson(json);
}

@JsonSerializable()
class TrackWrapper {
  @JsonKey(name: "items")
  List<TrackModel> listTrack;

  TrackWrapper({required this.listTrack});
  factory TrackWrapper.fromJson(Map<String, dynamic> json) =>
      _$TrackWrapperFromJson(json);
}

@JsonSerializable()
class TrackModel extends Track {
  @JsonKey(name: "name")
  String trackName;
  @JsonKey(name: "artists")
  List<ArtistModel> listArtistModel;
  TrackModel({required this.trackName, required this.listArtistModel})
      : super(trackName: trackName, singerName: listArtistModel[0].name);
  factory TrackModel.fromJson(Map<String, dynamic> json) =>
      _$TrackModelFromJson(json);
}
