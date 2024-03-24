import '/base/domain/base_usecase.dart';
import '/features/spotify/domain/entities/item_playlist_entities.dart';
import '/features/spotify/domain/repositories/playlist_repo.dart';

class GetMyPlaylistUseCase extends UseCaseIO<void, List<PlayListEntities>> {
  final PlayListRepo _playListRepo;
  GetMyPlaylistUseCase(this._playListRepo);

  @override
  Future<List<PlayListEntities>> build(void input) async {
    await _playListRepo.getUserID();
    return await _playListRepo.getMyPlaylist();
  }
}
