import '/base/data/enums/enums_type.dart';
import '/base/domain/base_usecase.dart';
import '/features/spotify/domain/entities/album_entities.dart';
import '/features/spotify/domain/repositories/playlist_repo.dart';

class GetInfoUseCase
    extends UseCaseIO<ReqType<String, CardAlbumType>, InfoEntities> {
  final PlayListRepo _playListRepo;
  GetInfoUseCase(this._playListRepo);

  @override
  Future<InfoEntities> build(ReqType input) async {
    return await _playListRepo.getInfo(input.input1, input.input2);
  }
}

class ReqType<T, K> {
  final T input1;
  final K input2;

  ReqType({required this.input1, required this.input2});
}
