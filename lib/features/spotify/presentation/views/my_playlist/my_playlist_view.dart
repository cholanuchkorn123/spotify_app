import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart' as indicator;
import '/base/presentation/base_get_view.dart';
import '/features/spotify/presentation/controllers/my_playlist/my_playlist_controller.dart';
import '/features/spotify/presentation/widgets/bottom_menu.dart';

class MyPlayListView extends BaseGetView<MyPlayListController> {
  const MyPlayListView({super.key});

  @override
  Widget myBuild(BuildContext context) {
    final double itemHeight = (Get.size.width - 24.0) / 2;
    final double itemWidth = Get.size.width / 4;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 16.0,
              backgroundColor: Colors.orange,
              child: Text(
                'P',
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 10),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              'Your Playlist',
              textAlign: TextAlign.left,
              style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 24.0,
            ),
            onPressed: controller.gotoSearchByPageView,
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 24.0,
            ),
            onPressed: () {
              BottomMenu.showAddPlaylistMenu(
                context,
              );
            },
          ),
        ],
      ),
      body: SafeArea(
          child: EasyRefresh(
        onRefresh: controller.onRefreshFunc,
        child: SingleChildScrollView(
          child: SizedBox(
            height: Get.height,
            child: Obx(() {
              return GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: (itemWidth / itemHeight),
                ),
                itemCount: controller.itemPLayList.value.length,
                itemBuilder: (_, index) {
                  final item = controller.itemPLayList[index];
                  return InkWell(
                    onTap: () => controller.getSinglePlayList(item.id),
                    child: cardItemPlayList(item.imagesList?[0].url ?? "",
                        item.name, item.description),
                  );
                },
              );
            }),
          ),
        ),
      )),
    );
  }

  Widget cardItemPlayList(
      String imgPath, String namePlaylist, String nameArtist) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: imgPath.isEmpty
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
                      imageUrl: imgPath,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => const Center(
                        child: CircleAvatar(
                          radius: 10,
                          child: indicator.LoadingIndicator(
                            indicatorType: indicator.Indicator.ballPulse,
                            colors: [Colors.white],
                            strokeWidth: 3,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        width: double.infinity,
                        color: Colors.grey.withOpacity(0.1),
                        child: const Center(
                          child: Icon(
                            Icons.music_note_outlined,
                            size: 55,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      fit: BoxFit.contain,
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  namePlaylist,
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  nameArtist,
                  style: GoogleFonts.inter(
                      color: Colors.grey.withOpacity(0.8),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
