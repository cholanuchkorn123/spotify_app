import 'package:get/get.dart';
import '/features/spotify/domain/usecases/get_album_usecase.dart';
import '/features/spotify/domain/usecases/search_usecase.dart';
import '/features/spotify/presentation/controllers/search/search_controller.dart';

class SearchingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchUseCase(Get.find()));
    Get.lazyPut(() => GetInfoUseCase(Get.find()));
    Get.lazyPut(
        () => SearchingController(searchUseCase: Get.find(), Get.find()));
  }
}
