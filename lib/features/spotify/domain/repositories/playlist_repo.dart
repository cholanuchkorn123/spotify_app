import 'package:spotify_app/base/data/enums/enums_type.dart';
import 'package:spotify_app/features/spotify/data/models/playlist_model/user_id_model.dart';
import 'package:spotify_app/features/spotify/data/models/request_model/request_add_song.dart';
import 'package:spotify_app/features/spotify/data/models/request_model/request_create_playlist.dart';
import 'package:spotify_app/features/spotify/domain/entities/album_entities.dart';
import 'package:spotify_app/features/spotify/domain/entities/item_playlist_entities.dart';
import 'package:spotify_app/features/spotify/domain/entities/search_album_entities.dart';

abstract class PlayListRepo {
  Future<List<PlayListEntities>> getPoppularPlayList(int limit, int offset);
  Future<List<SearchAlbumEntities>> searchAlbum(
      int limit, int offset, String nameAlbum);
  Future<InfoEntities> getInfo(String infoID, CardAlbumType type);
  Future<UserIDResponse> getUserID();
  Future<List<PlayListEntities>> getMyPlaylist();
  Future<void> createPlaylist(RequestCreatePlaylist playlist);
  Future<void> addItemToPlaylist(
      RequestAddSongPlaylist songPlaylist, String playlistId);
}
