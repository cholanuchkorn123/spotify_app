import '/base/data/local/local_storage.dart';
import '/features/spotify/data/models/get_token_model/get_token_model.dart';
import '/features/spotify/data/providers/remote/token_api/get_token_api.dart';
import '/features/spotify/domain/repositories/get_token_repo.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GetTokenImpl extends GetTokenRepo {
  final GetTokenApi _spotifyApi;
  final HandleTokenRepo _handleTokenRepo;
  GetTokenImpl(
      {required GetTokenApi spotifyApi,
      required HandleTokenRepo handleTokenRepo})
      : _spotifyApi = spotifyApi,
        _handleTokenRepo = handleTokenRepo;
  @override
  Future<GetTokenModel> getRefreshToken() async {
    final clientId = dotenv.env['CLIENT_ID'];
    final clientSecret = dotenv.env['CLIENT_SECRET'];
    final refreshToken = await _handleTokenRepo.getRefreshToken();
    final res = await _spotifyApi.getToken(
        'refresh_token',
        clientId ?? "ad54c338a0d248139d861960794393c8",
        clientSecret ?? "139e1cf7828e4ae5968b8fa5f1a968d1",
        refreshToken);
    await _handleTokenRepo.saveToken(res.accesstoken);
    return res;
  }
}
