import 'package:spotify_app/features/spotify/domain/entities/get_token_entities.dart';

abstract class GetTokenRepo {
  Future<TokenEntities> getRefreshToken();
}
