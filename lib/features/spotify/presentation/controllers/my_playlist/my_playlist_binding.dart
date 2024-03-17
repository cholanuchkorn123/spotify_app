import 'package:get/get.dart';
import 'package:spotify_app/features/spotify/presentation/controllers/my_playlist/my_playlist_controller.dart';

class MyPlayListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyPlayListController());
  }
}
