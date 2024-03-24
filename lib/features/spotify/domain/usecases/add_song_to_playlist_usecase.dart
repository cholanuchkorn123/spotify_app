import '/base/domain/base_usecase.dart';
import '/features/spotify/data/models/request_model/request_add_song.dart';
import '/features/spotify/domain/repositories/playlist_repo.dart';
import '/features/spotify/domain/usecases/get_album_usecase.dart';

class AddSongToPlaylistUseCase
    extends UseCaseIO<ReqType<String, RequestAddSongPlaylist>, void> {
  final PlayListRepo _playListRepo;
  AddSongToPlaylistUseCase(this._playListRepo);

  @override
  Future<void> build(ReqType<String, RequestAddSongPlaylist> input) async {
    await _playListRepo.addItemToPlaylist(input.input2, input.input1);
  }
}
