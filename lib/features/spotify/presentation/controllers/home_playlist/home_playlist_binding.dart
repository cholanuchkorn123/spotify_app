import 'package:get/get.dart';
import '/base/data/remote/builder/dio_builder.dart';
import '/features/spotify/data/providers/remote/playlist_api/playlist_api.dart';
import '/features/spotify/data/repositories_impl/playlist_impl.dart';
import '/features/spotify/domain/repositories/playlist_repo.dart';
import '/features/spotify/domain/usecases/get_album_usecase.dart';
import '/features/spotify/domain/usecases/get_playlist_usecase.dart';
import '/features/spotify/presentation/controllers/home_playlist/home_playlist_controller.dart';

class HomePlayListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
        PlayListApi(Get.find<DioBuilder>(tag: DioType.withToken.toString())));
    Get.put<PlayListRepo>(PlayListImpl(Get.find()));
    Get.put(GetPlayListUseCase(Get.find()));
    Get.put(GetInfoUseCase(Get.find()));
    Get.put(HomePlayListController(Get.find(), Get.find()));
  }
}
