import 'package:get/get.dart';
import '/features/spotify/domain/usecases/get_my_playlist.dart';
import '/features/spotify/presentation/controllers/my_playlist/my_playlist_controller.dart';

class MyPlayListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetMyPlaylistUseCase(Get.find()));
    Get.lazyPut(() => MyPlayListController(Get.find(), Get.find()));
  }
}
