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
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Person'),
            ],
          );
        },
      ),
      body: Stack(
        children: [
          PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.pageViewController,
              children: controller.bottomChildPage.map((e) {
                return e;
              }).toList()),
          controller.isSelectedItem.value
              ? Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: Colors.white10,
                      border: Border(
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
                              imageUrl:
                                  'https://static.wikia.nocookie.net/kpop/images/7/70/D.O._Gidae_digital_album_cover.png/revision/latest?cb=20230918125412',
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
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Ordinary Days",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "D.O.",
                              style: TextStyle(
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
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
