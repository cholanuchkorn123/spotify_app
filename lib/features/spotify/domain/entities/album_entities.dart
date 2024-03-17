import 'package:spotify_app/features/spotify/data/models/playlist_model/playlist_model.dart';

abstract class AlbumEntities {
  final String nameAlbum;
  final List<Track> listTrack;
  List<ImageModel> imagesList;
  AlbumEntities(
      {required this.nameAlbum,
      required this.listTrack,
      required this.imagesList});
}

abstract class Track {
  final String trackName;
  final String singerName;

  Track({required this.trackName, required this.singerName});
}
