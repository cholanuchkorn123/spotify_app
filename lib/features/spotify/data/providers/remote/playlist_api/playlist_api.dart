import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/foundation.dart';

import 'package:retrofit/http.dart';
import 'package:spotify_app/base/data/remote/builder/dio_builder.dart';
import 'package:spotify_app/features/spotify/data/models/album_model/album_model.dart';
import 'package:spotify_app/features/spotify/data/models/playlist_model/my_playlist_model.dart';
import 'package:spotify_app/features/spotify/data/models/playlist_model/playlist_model.dart';
import 'package:spotify_app/features/spotify/data/models/playlist_model/single_playlist_model.dart';
import 'package:spotify_app/features/spotify/data/models/playlist_model/user_id_model.dart';
import 'package:spotify_app/features/spotify/data/models/search_model/search_model.dart';
import 'package:spotify_app/features/spotify/domain/entities/album_entities.dart';
import 'package:spotify_app/utils/config/app_config.dart';

part 'playlist_api.g.dart';

@RestApi(baseUrl: AppConfig.baseUrl, parser: Parser.JsonSerializable)
abstract class PlayListApi {
  factory PlayListApi(DioBuilder dioBuilder) = _PlayListApi;
  @GET('/browse/featured-playlists?offset={offsetItem}&limit={limitItem}')
  Future<PlayListResponse> getPLayList(
    @Path('limitItem') int limitItem,
    @Path('offsetItem') int offsetItem,
  );
  @GET('/search?q={albumName}&type=album&offset={offsetItem}&limit={limitItem}')
  Future<SearchResponse> searchAlbum(
    @Path('limitItem') int limitItem,
    @Path('offsetItem') int offsetItem,
    @Path('albumName') String albumName,
  );
  @GET('/albums/{albumId}')
  Future<InfoResponse> getAlbum(
    @Path('albumId') String albumId,
  );
  @GET('/playlists/{playListId}')
  Future<InfoPlayList> getSinglePlayList(
    @Path('playListId') String playListId,
  );
  @GET('/me')
  Future<UserIDResponse> getUserId();
  @GET('/me/playlists')
  Future<PlayListWrapModel> getMyPlayList();
  @POST('/users/{userId}/playlists')
  Future<void> createPlayList(
    @Path('userId') String userId,
    @Body() Map<String, dynamic> req,
  );
  @GET('/playlists/{playListId}')
  Future<MyPlaylistResponse> getMySinglePlaylist(
    @Path('playListId') String playListId,
  );
  @POST('/playlists/{playlist_id}/tracks')
  Future<void> addItemtoPlaylist(
    @Path('playlist_id') String playlistId,
    @Body() Map<String, dynamic> req,
  );
}
