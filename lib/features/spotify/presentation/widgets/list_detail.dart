import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:spotify_app/base/data/enums/enums_type.dart';
import 'package:spotify_app/base/presentation/base_get_view.dart';
import 'package:spotify_app/features/spotify/domain/entities/album_entities.dart';
import 'package:spotify_app/features/spotify/domain/entities/search_album_entities.dart';
import 'package:spotify_app/features/spotify/presentation/controllers/tabbar/tabbar_controller.dart';
import 'package:spotify_app/features/spotify/presentation/widgets/bottom_menu.dart';
import 'package:spotify_app/utils/config/app_navi.dart';

class ListDetail extends StatelessWidget {
  final InfoEntities? album;
  final CardAlbumType typeCard;
  final SearchAlbumEntities? searchAlbumEntities;
  ListDetail(
      {super.key,
      this.album,
      required this.typeCard,
      this.searchAlbumEntities});
  final controllerTabBar = Get.find<MainTabBarController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              album!.nameAlbum,
              style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
            Text(
              album!.listTrack.isNotEmpty ? album!.listTrack[0].singerName : "",
              style: GoogleFonts.inter(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
            ),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 24.0,
          ),
          onPressed: controllerTabBar.onBack,
        ),
        actions: const [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 24.0,
            ),
            onPressed: Navigate.gotoSearchNavBar,
          ),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              child: SizedBox(
                width: Get.size.height * 0.25,
                height: Get.size.height * 0.25,
                child: album!.coverImageList?[0].url == null
                    ? Container(
                        width: double.infinity,
                        color: Colors.grey.withOpacity(0.1),
                        child: const Center(
                          child: Icon(
                            Icons.music_note_outlined,
                            size: 55,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : CachedNetworkImage(
                        imageUrl: album!.coverImageList?[0].url ?? "",
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
              height: 24.0,
            ),
            Text(
              album?.nameAlbum ?? "",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.download,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.add_box_outlined,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.play_circle_filled,
                    color: Colors.white,
                    size: 32.0,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.share_outlined,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            album!.listTrack.isNotEmpty ? _songList() : const SizedBox()
          ],
        ),
      )),
    );
  }

  Widget _songList() {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemCount: album?.listTrack.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final item = album?.listTrack[index];

          final imageUrl = album?.listTrack[index].infoImage?.isEmpty ?? true
              ? (album?.coverImageList?[0].url) ?? ""
              : album?.listTrack[index].infoImage?[0].url ?? "";
          final trackName = item?.trackName ?? "";
          final singerName = item?.singerName ?? "";
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
            child: InkWell(
              onTapUp: (_) {
                controllerTabBar.setUpsong(
                    item?.trackName ?? "",
                    album!.listTrack[index].infoImage == null
                        ? album!.coverImageList![0].url
                        : album!.listTrack[index].infoImage![0].url,
                    item?.singerName ?? "");
                controllerTabBar.isSelectedItem.value = true;
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  typeCard == CardAlbumType.playlist &&
                          (album?.listTrack[index].infoImage?[0].url != null)
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CachedNetworkImage(
                              imageUrl: imageUrl,
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
                        )
                      : Text(
                          "${index + 1}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text(
                          trackName,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        singerName,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,
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
                    // onPressed: () {},
                    onPressed: () {
                      searchAlbumEntities ??
                          BottomMenu.showItemMenu(context, item,
                              album!.coverImageList?[0].url ?? "", []);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
