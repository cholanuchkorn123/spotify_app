import 'package:spotify_app/base/domain/base_usecase.dart';
import 'package:spotify_app/features/spotify/domain/entities/item_playlist_entities.dart';
import 'package:spotify_app/features/spotify/domain/entities/search_album_entities.dart';
import 'package:spotify_app/features/spotify/domain/repositories/playlist_repo.dart';

class SearchUseCase
    extends UseCaseIO<RequestSearch, List<SearchAlbumEntities>> {
  final PlayListRepo _playListRepo;
  SearchUseCase(this._playListRepo);

  @override
  Future<List<SearchAlbumEntities>> build(RequestSearch input) async {
    return await _playListRepo.searchAlbum(
        input.limit, input.offset, input.searchName);
  }
}

class RequestSearch {
  final int limit;
  final int offset;
  final String searchName;
  RequestSearch(
      {required this.limit, required this.offset, required this.searchName});
}
