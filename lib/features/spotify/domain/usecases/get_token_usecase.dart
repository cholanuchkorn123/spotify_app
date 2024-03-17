import 'package:spotify_app/base/domain/base_usecase.dart';
import 'package:spotify_app/features/spotify/domain/entities/get_token_entities.dart';
import 'package:spotify_app/features/spotify/domain/repositories/get_token_repo.dart';

class GetTokenUseCase extends UseCaseIO<void, TokenEntities> {
  final GetTokenRepo _getTokenRepo;
  GetTokenUseCase(this._getTokenRepo);

  @override
  Future<TokenEntities> build(void input) async {
    return await _getTokenRepo.getToken();
  }
}
