import 'package:dio/dio.dart' hide Headers;

import 'package:retrofit/http.dart';
import 'package:spotify_app/base/data/remote/builder/dio_builder.dart';
import 'package:spotify_app/features/spotify/data/models/album_model/album_model.dart';
import 'package:spotify_app/features/spotify/data/models/playlist_model/playlist_model.dart';
import 'package:spotify_app/features/spotify/data/models/search_model/search_model.dart';
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
  Future<AlbumResponse> getAlbum(
    @Path('albumId') String albumId,
  );
}
