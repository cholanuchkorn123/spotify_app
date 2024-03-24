import 'dart:async';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:spotify_app/app.dart';
import '/features/spotify/data/models/request_model/request_add_song.dart';
import '/features/spotify/data/models/request_model/request_create_playlist.dart';
import '/features/spotify/domain/entities/album_entities.dart';
import '/features/spotify/domain/entities/item_playlist_entities.dart';
import '/features/spotify/domain/usecases/add_song_to_playlist_usecase.dart';
import '/features/spotify/domain/usecases/create_playlist_usecase.dart';
import '/features/spotify/domain/usecases/get_album_usecase.dart';
import '/features/spotify/domain/usecases/get_my_playlist.dart';
import '/features/spotify/presentation/controllers/my_playlist/my_playlist_controller.dart';

class BottomMenu {
  static void showItemMenu(BuildContext context, Track? item,
      String? coverImage, List<Track>? albumTrack) {
    final nameSinger = item?.singerName ?? (albumTrack?.first.singerName ?? "");
    final nameSong = item?.trackName ?? (albumTrack?.first.trackName ?? "");
    final imagePath = item?.infoImage?.first.url ?? "";

    void addToPlaylist() async {
      final getMyPlaylistUseCase = GetMyPlaylistUseCase(Get.find());
      final list = await getMyPlaylistUseCase.build(null);
      Navigator.pop(navigatorKey.currentContext!);

      final listSong = albumTrack?.map((item) => item.uri ?? "").toList() ?? [];
      showMyPlayList(
          navigatorKey.currentContext!, list, item?.uri ?? "", listSong);
    }

    final List<MenuOption> menuOptions = [
      MenuOption(
        icon: Icons.add_circle_outline,
        title: 'Add to playlist',
        onTap: addToPlaylist,
      ),
      MenuOption(
        icon: Icons.visibility_off,
        title: 'Hide song',
        onTap: () {},
      ),
      MenuOption(
        icon: Icons.share,
        title: 'Share',
        onTap: () {},
      ),
      MenuOption(
        icon: Icons.person_add_alt_1_outlined,
        title: 'Song credits',
        onTap: () {},
      ),
    ];
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext _) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: Get.size.height,
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            decoration: const BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: Get.size.height * 0.15,
                    height: Get.size.height * 0.15,
                    child: CachedNetworkImage(
                      imageUrl:
                          imagePath.isEmpty ? coverImage ?? "" : imagePath,
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
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    nameSong,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    nameSinger,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: menuOptions.length,
                    itemBuilder: (BuildContext context, int index) {
                      final option = menuOptions[index];
                      return ListTile(
                        leading: Icon(option.icon, color: Colors.white),
                        title: Text(
                          option.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500),
                        ),
                        onTap: () => option.onTap(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void showMyPlayList(BuildContext context, List<PlayListEntities> item,
      String songId, List<String> listSong) {
    void addPlaylist() {
      Navigator.pop(navigatorKey.currentContext!);
      BottomMenu.showAddPlaylistMenu(
        context,
      );
    }

    Future<void> addSongToPlaylist(String id) async {
      final addSongToPlaylistUseCase = AddSongToPlaylistUseCase(Get.find());

      final req = ReqType(
          input1: id,
          input2: RequestAddSongPlaylist(
              position: 0, uris: listSong.isNotEmpty ? listSong : [songId]));

      await addSongToPlaylistUseCase.build(req);
      Navigator.pop(navigatorKey.currentContext!);
    }

    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext buildContext) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: Get.size.height,
            decoration: const BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppBar(
                  toolbarHeight: 70,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  elevation: 1,
                  leading: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  automaticallyImplyLeading: false,
                  title: const Text(
                    'Add to Playlist',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  centerTitle: true,
                ),
                const SizedBox(height: 16.0),
                GestureDetector(
                  onTap: addPlaylist,
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: const Text(
                      'New Playlist',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  height: Get.size.height * 0.25,
                  child: ListView.builder(
                    itemCount: item.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      final itemIndex = item[index];
                      return GestureDetector(
                        onTap: () async {
                          await addSongToPlaylist(itemIndex.id);
                        },
                        child: ListTile(
                          title: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 16),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(4)),
                            child: Text(
                              itemIndex.name,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ),
                          leading: itemIndex.imagesList?[0].url == null
                              ? Container(
                                  width: 50,
                                  color: Colors.black,
                                  child: const Center(
                                    child: Icon(
                                      Icons.music_note_outlined,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : CircleAvatar(
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        itemIndex.imagesList?[0].url ?? "",
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
                                        Container(
                                      width: double.infinity,
                                      color: Colors.grey.withOpacity(0.1),
                                      child: const Center(
                                        child: Icon(
                                          Icons.music_note_outlined,
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showAddPlaylistMenu(BuildContext context) {
    var name = '';
    Future<void> createPlaylist(String playlistName) async {
      // Updated parameter name here
      Get.put(CreatePlaylistUseCase(Get.find()));
      await Get.find<CreatePlaylistUseCase>().build(RequestCreatePlaylist(
        description: "",
        name: playlistName, // Updated parameter name here
        public: false,
      ));
      Get.find<MyPlayListController>().loadData();
      Navigator.pop(navigatorKey.currentContext!);
    }

    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext buildContext) {
        return Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                height: Get.size.height - Get.bottomBarHeight,
                decoration: const BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "Give your playlist's name",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 32.0),
                      child: TextField(
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          name = value;
                        },
                        style: const TextStyle(
                            color: Colors.white, fontSize: 24.0),
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0.5)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        FocusScope.of(navigatorKey.currentContext!)
                            .requestFocus(FocusNode());
                        await createPlaylist(name);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Create',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight:
                                    FontWeight.w600)), // Updated text style
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 24.0,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class MenuOption {
  final IconData icon;
  final String title;
  final Function onTap;

  MenuOption({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}
