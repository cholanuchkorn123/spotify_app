import 'package:spotify_app/base/presentation/base_controller.dart';
import 'package:spotify_app/features/spotify/presentation/controllers/tabbar/tabbar_controller.dart';
import 'package:spotify_app/utils/config/app_navi.dart';

class MyPlayListController extends BaseController {
  @override
  void onInit() {
    super.onInit();
  }

  void gotoSearchByPageView() {
    Navigate.gotoSearchNavBar();
  }
}
