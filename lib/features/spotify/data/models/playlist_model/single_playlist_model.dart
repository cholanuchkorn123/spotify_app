import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spotify_app/features/spotify/data/models/playlist_model/playlist_model.dart';
import 'package:spotify_app/features/spotify/data/models/search_model/search_model.dart';
import 'package:spotify_app/features/spotify/domain/entities/album_entities.dart';
part 'single_playlist_model.g.dart';

@JsonSerializable()
class InfoPlayList extends InfoEntities {
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "images")
  List<ImageModel> images;
  @JsonKey(name: "tracks")
  ItemWrapper tracks;

  InfoPlayList({
    required this.name,
    required this.images,
    required this.tracks,
  }) : super(
          nameAlbum: name,
          listTrack:
              tracks.listWrapper.map((wrapper) => wrapper.listTrack).toList(),
          coverImageList: images,
        );
  factory InfoPlayList.fromJson(Map<String, dynamic> json) =>
      _$InfoPlayListFromJson(json);
}

@JsonSerializable()
class ItemWrapper {
  @JsonKey(name: "items")
  List<TracksWrapper> listWrapper;

  ItemWrapper({required this.listWrapper});
  factory ItemWrapper.fromJson(Map<String, dynamic> json) =>
      _$ItemWrapperFromJson(json);
}

@JsonSerializable()
class TracksWrapper {
  @JsonKey(name: "track")
  TrackPlayListModel listTrack;

  TracksWrapper({required this.listTrack});
  factory TracksWrapper.fromJson(Map<String, dynamic> json) =>
      _$TracksWrapperFromJson(json);
}

@JsonSerializable()
class AlbumWrapper {
  @JsonKey(name: "artists")
  List<ArtistModel> listArtistModel;
  @JsonKey(name: "images")
  List<ImageModel> images;

  AlbumWrapper({required this.listArtistModel, required this.images});
  factory AlbumWrapper.fromJson(Map<String, dynamic> json) =>
      _$AlbumWrapperFromJson(json);
}

@JsonSerializable()
class TrackPlayListModel extends Track {
  @JsonKey(name: "name")
  String trackName;
  @JsonKey(name: "album")
  AlbumWrapper listArtist;
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "uri")
  String uri;
  TrackPlayListModel(
      {required this.trackName,
      required this.listArtist,
      required this.id,
      required this.uri})
      : super(
            id: id,
            trackName: trackName,
            singerName: listArtist.listArtistModel[0].name,
            infoImage: listArtist.images,
            uri: uri);
  factory TrackPlayListModel.fromJson(Map<String, dynamic> json) =>
      _$TrackPlayListModelFromJson(json);
}
