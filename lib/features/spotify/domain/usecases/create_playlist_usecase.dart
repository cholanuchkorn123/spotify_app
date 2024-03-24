import '/base/domain/base_usecase.dart';
import '/features/spotify/data/models/request_model/request_create_playlist.dart';
import '/features/spotify/domain/repositories/playlist_repo.dart';

class CreatePlaylistUseCase extends UseCaseIO<RequestCreatePlaylist, void> {
  final PlayListRepo _playListRepo;
  CreatePlaylistUseCase(this._playListRepo);

  @override
  Future<void> build(RequestCreatePlaylist input) async {
    await _playListRepo.createPlaylist(input);
  }
}
