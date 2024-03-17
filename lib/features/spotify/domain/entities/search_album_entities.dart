import 'package:spotify_app/features/spotify/data/models/playlist_model/playlist_model.dart';

abstract class SearchAlbumEntities {
  final String nameAlbum;
  final String nameArtist;
  final String idAlbum;
  final List<ImageModel> imagesList;
  final String type;

  SearchAlbumEntities(
      {required this.nameAlbum,
      required this.nameArtist,
      required this.idAlbum,
      required this.imagesList,
      required this.type});
}
