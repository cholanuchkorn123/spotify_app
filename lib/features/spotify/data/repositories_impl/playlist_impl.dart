import 'dart:async';
import '/base/data/enums/enums_type.dart';
import '/base/data/local/local_storage.dart';
import '/base/presentation/base_controller.dart';
import '/features/spotify/data/models/playlist_model/user_id_model.dart';
import '/features/spotify/data/models/request_model/request_add_song.dart';
import '/features/spotify/data/models/request_model/request_create_playlist.dart';
import '/features/spotify/data/providers/remote/playlist_api/playlist_api.dart';
import '/features/spotify/domain/entities/album_entities.dart';
import '/features/spotify/domain/entities/item_playlist_entities.dart';
import '/features/spotify/domain/entities/search_album_entities.dart';
import '/features/spotify/domain/repositories/playlist_repo.dart';

class PlayListImpl extends PlayListRepo {
  final PlayListApi _playListApi;
  PlayListImpl(this._playListApi);
  final localDb = Get.find<UserIdRepo>();
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
  Future<InfoEntities> getInfo(String infoId, CardAlbumType type) async {
    switch (type) {
      case CardAlbumType.album:
        return await _playListApi.getAlbum(infoId);
      case CardAlbumType.myplaylist:
        return await _playListApi.getMySinglePlaylist(infoId);
      default:
        return await _playListApi.getSinglePlayList(infoId);
    }
  }

  @override
  Future<void> createPlaylist(RequestCreatePlaylist playlist) async {
    final userId = await localDb.getUserID();
    await _playListApi.createPlayList(userId, playlist.toJson());
  }

  @override
  Future<List<PlayListEntities>> getMyPlaylist() async {
    final res = await _playListApi.getMyPlayList();
    return res.playListModel;
  }

  @override
  Future<UserIDResponse> getUserID() async {
    final res = await _playListApi.getUserId();
    localDb.saveUserId(res.id);
    return res;
  }

  @override
  Future<void> addItemToPlaylist(
      RequestAddSongPlaylist songPlaylist, String playlistId) async {
    await _playListApi.addItemtoPlaylist(playlistId, songPlaylist.toJson());
  }
}
