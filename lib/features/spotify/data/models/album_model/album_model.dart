import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spotify_app/features/spotify/data/models/playlist_model/playlist_model.dart';
import 'package:spotify_app/features/spotify/data/models/search_model/search_model.dart';
import 'package:spotify_app/features/spotify/domain/entities/album_entities.dart';
part 'album_model.g.dart';

@JsonSerializable()
class InfoResponse extends InfoEntities {
  @JsonKey(name: "name")
  String name;
  @JsonKey(
    name: "images",
  )
  List<ImageModel>? images;
  @JsonKey(name: "tracks")
  TrackWrapper tracks;

  InfoResponse({
    required this.name,
    this.images,
    required this.tracks,
  }) : super(
          nameAlbum: name,
          listTrack: tracks.listTrack!,
          coverImageList: images,
        );
  factory InfoResponse.fromJson(Map<String, dynamic> json) =>
      _$InfoResponseFromJson(json);
}

@JsonSerializable()
class TrackWrapper {
  @JsonKey(name: "items")
  List<TrackModel>? listTrack;

  TrackWrapper(this.listTrack);
  factory TrackWrapper.fromJson(Map<String, dynamic> json) =>
      _$TrackWrapperFromJson(json);
}

@JsonSerializable()
class TrackModel extends Track {
  @JsonKey(name: "name")
  String? nameTrack;
  @JsonKey(name: "artists")
  List<ArtistModel>? listArtistModel;
  @JsonKey(name: "id")
  String? idTrack;
  @JsonKey(name: "uri")
  String? uriID;
  TrackModel({this.nameTrack, this.listArtistModel, this.uriID, this.idTrack})
      : super(
            trackName: nameTrack ?? "kookau",
            singerName: listArtistModel?[0].name ?? "hi",
            id: idTrack,
            uri: uriID);
  factory TrackModel.fromJson(Map<String, dynamic> json) =>
      _$TrackModelFromJson(json);
}
