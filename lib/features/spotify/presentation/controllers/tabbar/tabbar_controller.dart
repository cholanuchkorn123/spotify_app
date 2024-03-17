import 'package:spotify_app/base/presentation/base_controller.dart';
import 'package:spotify_app/base/presentation/base_get_view.dart';
import 'package:spotify_app/features/spotify/presentation/controllers/my_playlist/my_playlist_binding.dart';
import 'package:spotify_app/features/spotify/presentation/controllers/search/search_binding.dart';
import 'package:spotify_app/features/spotify/presentation/views/home_playlist/home_playlist_view.dart';
import 'package:spotify_app/features/spotify/presentation/views/my_playlist/my_playlist_view.dart';
import 'package:spotify_app/features/spotify/presentation/views/search_view/search_view.dart';

class MainTabBarController extends BaseController {
  RxInt currentSelected = 0.obs;
  final List<Widget> bottomChildPage = [
    const HomePlayListView(),
    const SearchView(),
    const MyPlayListView()
  ];
  final pageViewController = PageController();
  RxBool isSelectedItem = false.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  void onTap(int index) {
    currentSelected.value = index;
    if (bottomChildPage[index] is SearchView) {
      Get.put(SearchingBinding()).dependencies();
    } else if (bottomChildPage[index] is MyPlayListView) {
      Get.put(MyPlayListBinding()).dependencies();
    }
    if (index < bottomChildPage.length) {
      pageViewController.jumpToPage(index);
    }
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }
}
