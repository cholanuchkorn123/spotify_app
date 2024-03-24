import '/base/data/enums/enums_type.dart';
import '/base/presentation/base_controller.dart';
import '/features/spotify/domain/entities/item_playlist_entities.dart';
import '/features/spotify/domain/usecases/get_album_usecase.dart';
import '/features/spotify/domain/usecases/get_my_playlist.dart';
import '/features/spotify/presentation/controllers/tabbar/tabbar_controller.dart';
import '/utils/config/app_navi.dart';

class MyPlayListController extends BaseController {
  final GetMyPlaylistUseCase _getMyPlaylistUseCase;
  final GetInfoUseCase _getInfoUseCase;
  MyPlayListController(this._getMyPlaylistUseCase, this._getInfoUseCase);

  RxList<PlayListEntities> itemPLayList = <PlayListEntities>[].obs;
  void onInit() async {
    await loadData();
    super.onInit();
  }

  Future<void> onRefreshFunc() async {
    await loadingScope(() async {
      itemPLayList.value = await _getMyPlaylistUseCase.build(null);
    });
  }

  Future<void> loadData() async {
    itemPLayList.value = await _getMyPlaylistUseCase.build(null);
  }

  void gotoSearchByPageView() {
    Navigate.gotoSearchNavBar();
  }

  Future<void> getSinglePlayList(String id) async {
    final tabbarController = Get.find<MainTabBarController>();
    loadingScope(() async {
      await _getInfoUseCase
          .build(ReqType<String, CardAlbumType>(
              input1: id, input2: CardAlbumType.myplaylist))
          .then((value) {
        tabbarController.openNewView(value, CardAlbumType.playlist);
      });
    });
  }
}
