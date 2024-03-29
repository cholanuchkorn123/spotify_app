import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '/base/data/enums/enums_type.dart';
import '/base/presentation/base_get_view.dart';
import '/features/spotify/presentation/controllers/search/search_controller.dart';
import '/features/spotify/presentation/controllers/tabbar/tabbar_controller.dart';
import '/features/spotify/presentation/widgets/bottom_menu.dart';

class SearchView extends BaseGetView<SearchingController> {
  const SearchView({super.key});

  @override
  Widget myBuild(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              Obx(() {
                return Expanded(
                  child: SizedBox(
                      height: 36,
                      child: TextField(
                        controller: controller.textEditingController,
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 14.0),
                        onChanged: (value) async {
                          controller.searchBar.value = value;
                          if (value.isNotEmpty) {
                            controller.showSuggestions.value = true;

                            Timer(const Duration(milliseconds: 400), () async {
                              await controller.callSearch();
                            });
                          } else {
                            controller.showSuggestions.value = false;
                          }
                        },
                        maxLines: 1,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          hintText: "What do you want to listen to?",
                          hintStyle: const TextStyle(
                              color: Colors.white, fontSize: 14.0),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.2),
                          suffixIcon: controller.searchBar.value.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(
                                    Icons.clear,
                                    size: 18.0,
                                  ),
                                  color: Colors.white,
                                  onPressed: () {
                                    controller.searchBar.value = '';
                                    controller.textEditingController.clear();
                                    controller.showSuggestions.value = false;
                                    controller.hideKeyboard();
                                  },
                                )
                              : null,
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 18.0,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      )),
                );
              }),
              IconButton(
                icon: const Icon(
                  Icons.mic,
                  color: Colors.white,
                  size: 20.0,
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Obx(() {
            return controller.showSuggestions.value
                ? _suggestionsList()
                : _searchTitle();
          })
        ],
      )),
    );
  }

  Widget _suggestionsList() {
    return Obx(() {
      return Expanded(
        child: ListView.builder(
          itemCount: controller.itemPLayList.value.length,
          itemBuilder: (context, index) {
            final item = controller.itemPLayList.value[index];
            final controllerNew = Get.find<MainTabBarController>();
            return GestureDetector(
              onTap: () async {
                controller.hideKeyboard();
                final album = await controller.getAlbum(item.idAlbum);
                controllerNew.openNewView(album, CardAlbumType.album);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(2.0)),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CachedNetworkImage(
                          imageUrl: item.imagesList[0].url,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => const Center(
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
                      width: 16.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          item.nameArtist,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Album · ${item.nameArtist}",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      onPressed: () async {
                        final album = await controller.getAlbum(item.idAlbum);
                        BottomMenu.showItemMenu(context, null,
                            item.imagesList[0].url, album.listTrack);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }

  Widget _searchTitle() {
    return const Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Play what you love",
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          Text(
            "Search for artists, songs, podcasts and more.",
            style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
