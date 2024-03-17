import 'package:get/get.dart';
import 'package:spotify_app/features/spotify/presentation/controllers/home_playlist/home_playlist_binding.dart';
import 'package:spotify_app/features/spotify/presentation/controllers/tabbar/tabbar_controller.dart';

class MainTabBarBinding extends Bindings {
  @override
  void dependencies() {
    // injectHome(); allPageViewInject();
    Get.put(HomePlayListBinding()).dependencies();
    Get.lazyPut(() => MainTabBarController());
  }
}
