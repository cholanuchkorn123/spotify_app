import 'package:spotify_app/features/spotify/data/models/playlist_model/playlist_model.dart';

abstract class InfoEntities {
  final String nameAlbum;

  final List<Track> listTrack;
  List<ImageModel>? coverImageList;

  InfoEntities({
    required this.nameAlbum,
    this.coverImageList,
    required this.listTrack,
  });
}

abstract class Track {
  final String trackName;
  final String singerName;
  final String? id;
  final String? uri;
  final List<ImageModel>? infoImage;

  Track(
      {this.uri,
      this.id,
      required this.trackName,
      required this.singerName,
      this.infoImage});
}
