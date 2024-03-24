import 'package:spotify_app/base/domain/base_usecase.dart';
import 'package:spotify_app/features/spotify/domain/entities/item_playlist_entities.dart';
import 'package:spotify_app/features/spotify/domain/repositories/playlist_repo.dart';
import 'package:spotify_app/features/spotify/domain/usecases/get_album_usecase.dart';

class GetPlayListUseCase
    extends UseCaseIO<ReqType<int, int>, List<PlayListEntities>> {
  final PlayListRepo _playListRepo;
  GetPlayListUseCase(this._playListRepo);

  @override
  Future<List<PlayListEntities>> build(ReqType input) async {
    return await _playListRepo.getPoppularPlayList(input.input1, input.input2);
  }
}
