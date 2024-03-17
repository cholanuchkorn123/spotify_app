import 'package:get/get.dart';
import 'package:spotify_app/features/spotify/domain/usecases/get_album_usecase.dart';
import 'package:spotify_app/features/spotify/domain/usecases/search_usecase.dart';
import 'package:spotify_app/features/spotify/presentation/controllers/search/search_controller.dart';

class SearchingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchUseCase(Get.find()));
    Get.lazyPut(() => GetAlbumUseCase(Get.find()));
    Get.lazyPut(
        () => SearchingController(searchUseCase: Get.find(), Get.find()));
  }
}
