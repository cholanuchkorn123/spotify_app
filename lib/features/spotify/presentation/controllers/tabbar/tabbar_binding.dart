import 'package:get/get.dart';
import '/base/presentation/base_get_view.dart';
import '/features/spotify/presentation/controllers/home_playlist/home_playlist_binding.dart';
import '/features/spotify/presentation/controllers/my_playlist/my_playlist_binding.dart';
import '/features/spotify/presentation/controllers/search/search_binding.dart';
import '/features/spotify/presentation/controllers/tabbar/tabbar_controller.dart';
import '/features/spotify/presentation/views/my_playlist/my_playlist_view.dart';
import '/features/spotify/presentation/views/search_view/search_view.dart';

class MainTabBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePlayListBinding()).dependencies();
    Get.lazyPut(() => MainTabBarController());
  }
}

extension PageViewBinding on Widget {
  void injectBinding() {
    if (this is SearchView) {
      Get.put(SearchingBinding()).dependencies();
    } else if (this is MyPlayListView) {
      Get.put(MyPlayListBinding()).dependencies();
    }
  }
}
