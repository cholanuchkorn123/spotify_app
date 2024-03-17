import 'package:spotify_app/base/domain/base_usecase.dart';
import 'package:spotify_app/features/spotify/domain/entities/album_entities.dart';
import 'package:spotify_app/features/spotify/domain/repositories/playlist_repo.dart';

class GetAlbumUseCase extends UseCaseIO<String, AlbumEntities> {
  final PlayListRepo _playListRepo;
  GetAlbumUseCase(this._playListRepo);

  @override
  Future<AlbumEntities> build(String input) async {
    return await _playListRepo.getAlbum(input);
  }
}
