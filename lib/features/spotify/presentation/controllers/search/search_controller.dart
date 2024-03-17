import 'dart:ffi';

import 'package:get/get.dart';
import 'package:spotify_app/base/data/remote/builder/dio_builder.dart';
import 'package:spotify_app/base/presentation/base_controller.dart';
import 'package:spotify_app/base/presentation/base_get_view.dart';
import 'package:spotify_app/features/spotify/domain/entities/album_entities.dart';

import 'package:spotify_app/features/spotify/domain/entities/search_album_entities.dart';
import 'package:spotify_app/features/spotify/domain/usecases/get_album_usecase.dart';
import 'package:spotify_app/features/spotify/domain/usecases/search_usecase.dart';

class SearchingController extends BaseController {
  RxString searchBar = ''.obs;
  TextEditingController textEditingController = TextEditingController();
  RxBool showSuggestions = false.obs;
  RxList<SearchAlbumEntities> itemPLayList = <SearchAlbumEntities>[].obs;

  final SearchUseCase searchUseCase;
  final GetAlbumUseCase getAlbumUseCase;
  SearchingController(this.getAlbumUseCase, {required this.searchUseCase});
  @override
  void onInit() async {
    super.onInit();
  }

  callSearch() async {
    if (searchBar.value.isEmpty) {
      return;
    }
    itemPLayList.value = await searchUseCase.build(
        RequestSearch(limit: 10, offset: 0, searchName: searchBar.value));
  }

  getAlbum(String idAlbum) async {
    return await getAlbumUseCase.build(idAlbum);
  }
}
