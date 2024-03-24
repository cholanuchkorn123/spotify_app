import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/spotify_oauth2_client.dart';
import '/base/data/local/local_storage.dart';
import '/base/presentation/base_get_view.dart';
import '/features/spotify/domain/repositories/get_token_repo.dart';
import '/utils/config/app_navi.dart';

class InitService extends GetxService {
  final HandleTokenRepo _handleTokenRepo;
  final GetTokenRepo _getTokenRepo;

  InitService(
      {required HandleTokenRepo handleTokenRepo,
      required GetTokenRepo getTokenRepo})
      : _handleTokenRepo = handleTokenRepo,
        _getTokenRepo = getTokenRepo;

  @override
  void onReady() async {
    final refreshToken = await _handleTokenRepo.getRefreshToken();
//  JwtDecoder.isExpired(refreshToken)
    if (refreshToken.isEmpty) {
      oAuthSpotify();
    } else {
      await _getTokenRepo.getRefreshToken();
      Navigate.gotoTabHome();
    }

    super.onReady();
  }

  void oAuthSpotify() async {
    AccessTokenResponse? accessToken;

    final clientId = dotenv.env['CLIENT_ID'];
    final clientSecret = dotenv.env['CLIENT_SECRET'];
    try {
      SpotifyOAuth2Client client = SpotifyOAuth2Client(
        customUriScheme: 'my.music.app',
        redirectUri: 'my.music.app://callback',
      );
      var authResp = await client.requestAuthorization(
          clientId: clientId ?? "ad54c338a0d248139d861960794393c8",
          customParams: {
            'show_dialog': 'true'
          },
          scopes: [
            'playlist-modify-public',
            'playlist-read-private',
            'playlist-modify-private'
          ]);
      var authCode = authResp.code;

      accessToken = await client.requestAccessToken(
        code: authCode.toString(),
        clientId: clientId ?? "ad54c338a0d248139d861960794393c8",
        clientSecret: clientSecret ?? "139e1cf7828e4ae5968b8fa5f1a968d1",
      );

      await _handleTokenRepo.saveToken(accessToken.accessToken ?? "");

      await _handleTokenRepo.saveRefreshToken(accessToken.refreshToken ?? "");
      Navigate.gotoTabHome();
    } on PlatformException catch (_) {
      exit(0);
    }
  }
}
