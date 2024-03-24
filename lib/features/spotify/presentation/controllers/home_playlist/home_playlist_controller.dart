import '/base/data/enums/enums_type.dart';
import '/base/presentation/base_controller.dart';
import '/features/spotify/domain/entities/item_playlist_entities.dart';
import '/features/spotify/domain/usecases/get_album_usecase.dart';
import '/features/spotify/domain/usecases/get_playlist_usecase.dart';
import '/features/spotify/presentation/controllers/tabbar/tabbar_controller.dart';
import '/utils/config/app_navi.dart';

class HomePlayListController extends BaseController {
  final GetPlayListUseCase _getPlayListUseCase;
  final GetInfoUseCase _getInfoUseCase;
  HomePlayListController(this._getInfoUseCase, this._getPlayListUseCase);

  RxList<PlayListEntities> itemPLayList = <PlayListEntities>[].obs;

  int pageLimit = 10;
  @override
  void onInit() async {
    await loadData();
    super.onInit();
  }

  loadData() async {
    itemPLayList.addAll(await callGetItemUseCase());
  }

  Future<List<PlayListEntities>> callGetItemUseCase() async {
    return await _getPlayListUseCase
        .build(ReqType<int, int>(input1: pageLimit, input2: 0));
  }

  Future<void> onLoadFunc() async {
    pageLimit += 5;
    await loadingScope(() async {
      itemPLayList.addAll(await callGetItemUseCase());
    });
  }

  Future<void> onRefreshFunc() async {
    await loadingScope(() async {
      itemPLayList.addAll(await callGetItemUseCase());
    });
  }

  void gotoSearchByPageView() {
    Navigate.gotoSearchNavBar();
  }

  Future<void> getSinglePlayList(String id) async {
    final tabbarController = Get.find<MainTabBarController>();
    loadingScope(() async {
      await _getInfoUseCase
          .build(ReqType<String, CardAlbumType>(
              input1: id, input2: CardAlbumType.playlist))
          .then((value) {
        tabbarController.openNewView(value, CardAlbumType.playlist);
      });
    });
  }
}
