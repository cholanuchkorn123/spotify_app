import 'package:spotify_app/base/domain/base_usecase.dart';
import 'package:spotify_app/features/spotify/domain/entities/item_playlist_entities.dart';
import 'package:spotify_app/features/spotify/domain/repositories/playlist_repo.dart';

class GetPlayListUseCase
    extends UseCaseIO<RequestPage, List<PlayListEntities>> {
  final PlayListRepo _playListRepo;
  GetPlayListUseCase(this._playListRepo);

  @override
  Future<List<PlayListEntities>> build(RequestPage input) async {
    return await _playListRepo.getPoppularPlayList(input.limit, input.offset);
  }
}

class RequestPage {
  final int limit;
  final int offset;

  RequestPage({required this.limit, required this.offset});
}
