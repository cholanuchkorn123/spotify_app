import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:spotify_app/base/presentation/base_get_view.dart';
import 'package:spotify_app/features/spotify/presentation/controllers/home_playlist/home_playlist_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:easy_refresh/easy_refresh.dart' as refreshIndi;
import 'package:spotify_app/features/spotify/presentation/widgets/list_detail.dart';

class HomePlayListView extends BaseGetView<HomePlayListController> {
  const HomePlayListView({super.key});

  @override
  Widget myBuild(BuildContext context) {
    final double itemHeight = (Get.size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = Get.size.width / 2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Popular Playlists',
          style: GoogleFonts.inter(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
        ),
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
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
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
          ),
        ],
      ),
      body: SafeArea(
          child: refreshIndi.EasyRefresh(
        onRefresh: controller.onRefreshFunc,
        onLoad: controller.onLoadFunc,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() {
                return GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: (itemWidth / itemHeight),
                  ),
                  itemCount: controller.itemPLayList.value.length,
                  itemBuilder: (context, index) {
                    final item = controller.itemPLayList.value[index];
                    return InkWell(
                      onTap: () {
                        // Get.to(ListDetail(type: ListType.playlist));
                      },
                      child: cardItem(
                          item.imagesList[0].url, item.name, item.description),
                    );
                  },
                );
              })
            ],
          ),
        ),
      )),
    );
  }

  Widget cardItem(String imgPath, String namePlaylist, String nameArtist) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: CachedNetworkImage(
                imageUrl: imgPath,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
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
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
