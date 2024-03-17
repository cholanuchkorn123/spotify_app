import 'package:get/route_manager.dart';
import 'package:spotify_app/features/spotify/presentation/controllers/home_playlist/home_playlist_binding.dart';
import 'package:spotify_app/features/spotify/presentation/controllers/my_playlist/my_playlist_binding.dart';
import 'package:spotify_app/features/spotify/presentation/controllers/search/search_binding.dart';
import 'package:spotify_app/features/spotify/presentation/controllers/tabbar/tabbar_binding.dart';
import 'package:spotify_app/features/spotify/presentation/views/home_playlist/home_playlist_view.dart';
import 'package:spotify_app/features/spotify/presentation/views/my_playlist/my_playlist_view.dart';
import 'package:spotify_app/features/spotify/presentation/views/search_view/search_view.dart';
import 'package:spotify_app/features/spotify/presentation/views/tabbar/main_tabbar_view.dart';
import 'package:spotify_app/features/spotify/presentation/widgets/list_detail.dart';

class AppRoute {
  static String mainTabBar = '/tabbar';
  static String homePlayList = '/homeplaylist';
  static String searching = '/search';
  static String myplayList = '/myplaylist';

  static List<GetPage> generatedGetPages = [
    GetPage(
      name: mainTabBar,
      page: MainTabBarView.new,
      binding: MainTabBarBinding(),
    ),
    GetPage(
      name: homePlayList,
      page: HomePlayListView.new,
      binding: HomePlayListBinding(),
    ),
    GetPage(
      name: searching,
      page: SearchView.new,
      binding: SearchingBinding(),
    ),
    GetPage(
      name: myplayList,
      page: MyPlayListView.new,
      binding: MyPlayListBinding(),
    ),
  ];
}
