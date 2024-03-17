import 'package:get/get.dart';
import 'package:spotify_app/base/data/remote/builder/dio_builder.dart';
import 'package:spotify_app/features/spotify/data/providers/remote/playlist_api/playlist_api.dart';
import 'package:spotify_app/features/spotify/data/repositories_impl/playlist_impl.dart';
import 'package:spotify_app/features/spotify/domain/repositories/playlist_repo.dart';
import 'package:spotify_app/features/spotify/domain/usecases/get_playlist_usecase.dart';
import 'package:spotify_app/features/spotify/presentation/controllers/home_playlist/home_playlist_controller.dart';

class HomePlayListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
        PlayListApi(Get.find<DioBuilder>(tag: DioType.withToken.toString())));
    Get.put<PlayListRepo>(PlayListImpl(Get.find()));
    Get.put(GetPlayListUseCase(Get.find()));
    Get.put(HomePlayListController(getPlayListUseCase: Get.find()));
  }
}
