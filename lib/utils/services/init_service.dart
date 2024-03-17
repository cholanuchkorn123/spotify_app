import 'package:spotify_app/base/data/local/local_storage.dart';
import 'package:spotify_app/base/presentation/base_get_view.dart';
import 'package:spotify_app/features/spotify/domain/repositories/get_token_repo.dart';

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
    final _token = await _getTokenRepo.getToken();

    await _handleTokenRepo.delete();
    await _handleTokenRepo.save(_token.accessToken);
    super.onReady();
  }
}
