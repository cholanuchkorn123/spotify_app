import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:spotify_app/base/presentation/base_get_view.dart';
import 'package:spotify_app/features/spotify/presentation/controllers/my_playlist/my_playlist_controller.dart';
import 'package:spotify_app/features/spotify/presentation/views/search_view/search_view.dart';
import 'package:spotify_app/features/spotify/presentation/widgets/bottom_menu.dart';

class MyPlayListView extends BaseGetView<MyPlayListController> {
  const MyPlayListView({super.key});

  @override
  Widget myBuild(BuildContext context) {
    final double itemHeight = (Get.size.width - 24.0) / 2;
    final double itemWidth = Get.size.width / 4;

    final List<Song> items = [
      Song(
          name: 'Mocking Playlist',
          singer: 'Singer 1',
          albumType: 'EP',
          albumName: 'Album1',
          imagePath:
              'https://www.cdcosmos.com/wp-content/uploads/2022/09/307837633_602151491528795_6427324857413294413_n.jpg'),
      Song(
          name: 'Mocking Playlist 2',
          singer: 'Singer 2',
          albumName: 'Album2',
          albumType: 'Single',
          imagePath:
              'https://www.cdcosmos.com/wp-content/uploads/2022/09/307837633_602151491528795_6427324857413294413_n.jpg'),
      Song(
          name: 'Mocking Playlist 3',
          singer: 'Singer 3',
          albumName: 'Album3',
          albumType: 'Album',
          imagePath:
              'https://www.cdcosmos.com/wp-content/uploads/2022/09/307837633_602151491528795_6427324857413294413_n.jpg'),
    ];

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
              BottomMenu.showAddPlaylistMenu(context);
            },
          ),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: (itemWidth / itemHeight),
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return cardItem(items[index].imagePath, items[index].name, 'P');
              },
            )
          ],
        ),
      )),
    );
  }

  Widget cardItem(String imgPath, String namePlaylist, String creatorName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: CachedNetworkImage(
              width: double.maxFinite,
              height: double.maxFinite,
              fit: BoxFit.cover,
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
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
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
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  creatorName,
                  style: GoogleFonts.inter(
                      color: Colors.grey.withOpacity(0.8),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
