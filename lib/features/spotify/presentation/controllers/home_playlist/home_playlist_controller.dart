import 'package:spotify_app/base/presentation/base_controller.dart';
import 'package:spotify_app/features/spotify/domain/entities/item_playlist_entities.dart';
import 'package:spotify_app/features/spotify/domain/usecases/get_playlist_usecase.dart';
import 'package:spotify_app/utils/config/app_navi.dart';

class HomePlayListController extends BaseController {
  final GetPlayListUseCase _getPlayListUseCase;

  HomePlayListController({required GetPlayListUseCase getPlayListUseCase})
      : _getPlayListUseCase = getPlayListUseCase;

  RxList<PlayListEntities> itemPLayList = <PlayListEntities>[].obs;
  int pageLimit = 10;
  @override
  void onInit() async {
    print('this length${itemPLayList.length}');
    itemPLayList.addAll(await callGetItemUseCase());

    super.onInit();
  }

  Future<List<PlayListEntities>> callGetItemUseCase() async =>
      await _getPlayListUseCase.build(RequestPage(limit: pageLimit, offset: 0));

  Future<void> onLoadFunc() async {
    pageLimit += 5;
    itemPLayList.addAll(await callGetItemUseCase());
  }

  Future<void> onRefreshFunc() async {
    itemPLayList.addAll(await callGetItemUseCase());
  }

  void gotoSearchByPageView() {
    Navigate.gotoSearchNavBar();
  }
}
