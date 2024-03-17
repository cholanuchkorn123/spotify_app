import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:spotify_app/base/data/local/local_storage.dart';
import 'package:spotify_app/base/data/remote/builder/dio_builder.dart';
import 'package:spotify_app/features/spotify/data/providers/remote/token_api/get_token_api.dart';
import 'package:spotify_app/features/spotify/data/repositories_impl/get_token_impl.dart';
import 'package:spotify_app/features/spotify/domain/repositories/get_token_repo.dart';
import 'package:spotify_app/utils/config/app_config.dart';
import 'package:spotify_app/utils/services/init_service.dart';
import 'package:spotify_app/utils/services/log_service.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LogServiceImpl());
    Get.put<HandleTokenRepo>(HandleToken());
    Get.lazyPut(
      () => DioBuilder(
        type: DioType.withToken,
        options: BaseOptions(baseUrl: AppConfig.baseUrl),
      ),
      tag: DioType.withToken.toString(),
      fenix: true,
    );
    Get.lazyPut(
      () => DioBuilder(
        type: DioType.ignoredToken,
        options: BaseOptions(baseUrl: AppConfig.baseUrlToken),
      ),
      tag: DioType.ignoredToken.toString(),
      fenix: true,
    );
    Get.put(GetTokenApi(
        Get.find<DioBuilder>(tag: DioType.ignoredToken.toString())));
    Get.put<GetTokenRepo>(GetTokenImpl(spotifyApi: Get.find()));
    Get.put(
      InitService(handleTokenRepo: Get.find(), getTokenRepo: Get.find()),
    );
  }
}
