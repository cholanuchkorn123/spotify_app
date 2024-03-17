import 'package:spotify_app/features/spotify/data/providers/remote/playlist_api/playlist_api.dart';
import 'package:spotify_app/features/spotify/domain/entities/album_entities.dart';
import 'package:spotify_app/features/spotify/domain/entities/item_playlist_entities.dart';
import 'package:spotify_app/features/spotify/domain/entities/search_album_entities.dart';
import 'package:spotify_app/features/spotify/domain/repositories/playlist_repo.dart';

class PlayListImpl extends PlayListRepo {
  final PlayListApi _playListApi;
  PlayListImpl(this._playListApi);
  @override
  Future<List<PlayListEntities>> getPoppularPlayList(
      int limit, int offset) async {
    final res = await _playListApi.getPLayList(limit, offset);
    return res.wrapper.playListModel;
  }

  @override
  Future<List<SearchAlbumEntities>> searchAlbum(
      int limit, int offset, String nameAlbum) async {
    final res = await _playListApi.searchAlbum(limit, offset, nameAlbum);
    return res.wrapper.listItemModel;
  }

  @override
  Future<AlbumEntities> getAlbum(String albumId) async {
    final res = await _playListApi.getAlbum(albumId);
    return res;
  }
}
