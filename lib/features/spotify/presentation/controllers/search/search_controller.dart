import '/features/spotify/data/models/request_model/request_usecase.dart';

import '/base/data/enums/enums_type.dart';
import '/base/presentation/base_controller.dart';
import '/base/presentation/base_get_view.dart';
import '/features/spotify/domain/entities/album_entities.dart';
import '/features/spotify/domain/entities/search_album_entities.dart';
import '/features/spotify/domain/usecases/get_album_usecase.dart';
import '/features/spotify/domain/usecases/search_usecase.dart';

class SearchingController extends BaseController {
  RxString searchBar = ''.obs;
  TextEditingController textEditingController = TextEditingController();
  RxBool showSuggestions = false.obs;
  RxList<SearchAlbumEntities> itemPLayList = <SearchAlbumEntities>[].obs;

  final SearchUseCase searchUseCase;
  final GetInfoUseCase getInfoUseCase;
  SearchingController(this.getInfoUseCase, {required this.searchUseCase});

  callSearch() async {
    if (searchBar.value.isEmpty) {
      return;
    }

    await loadingScope(() async {
      itemPLayList.value = await searchUseCase.build(
          RequestSearch(limit: 10, offset: 0, searchName: searchBar.value));
    });
  }

  Future<InfoEntities> getAlbum(String idAlbum) async {
    return await getInfoUseCase.build(ReqType<String, CardAlbumType>(
        input1: idAlbum, input2: CardAlbumType.album));
  }
}
