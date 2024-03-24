import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:spotify_app/base/presentation/base_get_view.dart';
import 'package:spotify_app/features/spotify/presentation/controllers/tabbar/tabbar_controller.dart';

class MainTabBarView extends BaseGetView<MainTabBarController> {
  const MainTabBarView({super.key});

  @override
  Widget myBuild(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            currentIndex: controller.currentSelected.value,
            onTap: controller.onTap,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search_outlined), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_music), label: 'My Playlist'),
            ],
          );
        },
      ),
      body: Stack(
        children: [
          Obx(() {
            return PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.pageViewController,
                children: controller.bottomChildPage.value.map((e) {
                  return e;
                }).toList());
          }),
          Obx(() {
            return controller.isSelectedItem.value
                ? Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.8),
                        border: const Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(2.0)),
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: CachedNetworkImage(
                                imageUrl: controller.imgPath.value,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        const Center(
                                  child: CircleAvatar(
                                    radius: 10,
                                    child: LoadingIndicator(
                                      indicatorType: Indicator.ballPulse,
                                      colors: [Colors.white],
                                      strokeWidth: 3,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.songName.value,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                controller.nameArtist.value,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink();
          })
        ],
      ),
    );
  }
}
