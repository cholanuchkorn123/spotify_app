import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spotify_app/features/spotify/data/models/album_model/album_model.dart';
import 'package:spotify_app/features/spotify/data/models/playlist_model/playlist_model.dart';
import 'package:spotify_app/features/spotify/data/models/search_model/search_model.dart';
import 'package:spotify_app/features/spotify/domain/entities/album_entities.dart';
part 'my_playlist_model.g.dart';

@JsonSerializable()
class MyPlaylistResponse extends InfoEntities {
  @JsonKey(name: "name")
  String name;
  @JsonKey(
    name: "images",
  )
  List<ImageModel>? images;
  @JsonKey(name: "tracks")
  TrackItemWrapName tracks;

  MyPlaylistResponse({
    required this.name,
    this.images,
    required this.tracks,
  }) : super(
          nameAlbum: name,
          listTrack: tracks.items ?? [],
          coverImageList: images,
        );
  factory MyPlaylistResponse.fromJson(Map<String, dynamic> json) =>
      _$MyPlaylistResponseFromJson(json);
}

@JsonSerializable()
class TrackWrapItems extends Track {
  @JsonKey(name: "track")
  TrackModel? trackItem;

  TrackWrapItems(this.trackItem)
      : super(
            trackName: trackItem?.nameTrack ?? "",
            singerName: trackItem?.listArtistModel?[0].name ?? "hi",
            id: trackItem?.idTrack,
            uri: trackItem?.uriID);
  factory TrackWrapItems.fromJson(Map<String, dynamic> json) =>
      _$TrackWrapItemsFromJson(json);
}

@JsonSerializable()
class TrackItemWrapName {
  @JsonKey(name: "items")
  List<TrackWrapItems>? items;

  TrackItemWrapName(this.items);
  factory TrackItemWrapName.fromJson(Map<String, dynamic> json) =>
      _$TrackItemWrapNameFromJson(json);
}
