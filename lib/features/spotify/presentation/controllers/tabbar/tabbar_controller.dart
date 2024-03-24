import '/base/data/enums/enums_type.dart';
import '/base/presentation/base_controller.dart';
import '/base/presentation/base_get_view.dart';
import '/features/spotify/domain/entities/album_entities.dart';
import '/features/spotify/presentation/controllers/tabbar/tabbar_binding.dart';
import '/features/spotify/presentation/views/home_playlist/home_playlist_view.dart';
import '/features/spotify/presentation/views/my_playlist/my_playlist_view.dart';
import '/features/spotify/presentation/views/search_view/search_view.dart';
import '/features/spotify/presentation/widgets/list_detail.dart';

class MainTabBarController extends BaseController {
  RxInt currentSelected = 0.obs;
  RxList<Widget> bottomChildPage = [
    const HomePlayListView(),
    const SearchView(),
    const MyPlayListView(),
  ].obs;
  final pageViewController = PageController(initialPage: 0);
  RxBool isSelectedItem = false.obs;
  RxString songName = "".obs;
  RxString imgPath = "".obs;
  RxString nameArtist = "".obs;
  int currentPage = 0;
  @override
  void onInit() async {
    pageViewController.addListener(onPageChange);
    pageViewController.removeListener(onPageChange);
    super.onInit();
  }

  void onPageChange() {
    currentPage = pageViewController.page!.toInt();
  }

  void onTap(int index) {
    currentSelected.value = index;
    bottomChildPage[index].injectBinding();
    if (index < bottomChildPage.length) {
      pageViewController.jumpToPage(index);
    }
  }

  void openNewView(InfoEntities item, CardAlbumType type) {
    currentPage = pageViewController.page!.toInt();

    bottomChildPage.add(ListDetail(
      typeCard: type,
      album: item,
    ));

    if (bottomChildPage.last is ListDetail) {
      pageViewController.jumpToPage(bottomChildPage.length - 1);
    }
  }

  void onBack() {
    if (bottomChildPage.last is ListDetail) {
      bottomChildPage.removeLast();
      pageViewController.jumpToPage(currentPage);
    }
  }

  void setUpsong(String songName, String imgPath, String nameArtist) {
    this.songName.value = songName;
    this.imgPath.value = imgPath;
    this.nameArtist.value = nameArtist;
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }
}
