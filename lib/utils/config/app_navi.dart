import 'package:get/get.dart';
import 'package:spotify_app/features/spotify/presentation/controllers/tabbar/tabbar_controller.dart';
import 'package:spotify_app/utils/config/app_route.dart';

class Navigate {
  static void gotoHomePLay() {
    Get.toNamed(AppRoute.homePlayList);
  }

  static void gotoSearch() {
    Get.toNamed(AppRoute.searching);
  }

  static void gotoMyPlaylist() {
    Get.toNamed(AppRoute.myplayList);
  }

  // not refactor
  static void gotoSearchNavBar() {
    final mainController = Get.find<MainTabBarController>();
    mainController.pageViewController.jumpToPage(1);
    mainController.currentSelected.value = 1;
  }
}
