import '/features/spotify/data/models/request_model/request_usecase.dart';

import '/base/domain/base_usecase.dart';
import '/features/spotify/domain/entities/search_album_entities.dart';
import '/features/spotify/domain/repositories/playlist_repo.dart';

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
