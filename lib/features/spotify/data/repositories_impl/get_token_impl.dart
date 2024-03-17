import 'package:spotify_app/features/spotify/data/models/get_token_model/get_token_model.dart';
import 'package:spotify_app/features/spotify/data/providers/remote/token_api/get_token_api.dart';
import 'package:spotify_app/features/spotify/domain/repositories/get_token_repo.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GetTokenImpl extends GetTokenRepo {
  final GetTokenApi _spotifyApi;

  GetTokenImpl({required GetTokenApi spotifyApi}) : _spotifyApi = spotifyApi;
  @override
  Future<GetTokenModel> getToken() async {
    final clientId = dotenv.env['CLIENT_ID'];
    final clientSecret = dotenv.env['CLIENT_SECRET'];

    return await _spotifyApi.getToken(
        'client_credentials',
        clientId ?? "ad54c338a0d248139d861960794393c8",
        clientSecret ?? "139e1cf7828e4ae5968b8fa5f1a968d1");
  }
}
