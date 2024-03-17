import 'package:spotify_app/features/spotify/domain/entities/album_entities.dart';
import 'package:spotify_app/features/spotify/domain/entities/item_playlist_entities.dart';
import 'package:spotify_app/features/spotify/domain/entities/search_album_entities.dart';

abstract class PlayListRepo {
  Future<List<PlayListEntities>> getPoppularPlayList(int limit, int offset);
  Future<List<SearchAlbumEntities>> searchAlbum(
      int limit, int offset, String nameAlbum);

  Future<AlbumEntities> getAlbum(String albumId);
}
