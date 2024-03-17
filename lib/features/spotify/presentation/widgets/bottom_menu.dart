import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:spotify_app/features/spotify/domain/entities/search_album_entities.dart';

class BottomMenu {
  static void showItemMenu(BuildContext context, SearchAlbumEntities item) {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
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
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    item.nameArtist,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${item.nameArtist} · ${item.nameAlbum}",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                  ListTile(
                    leading: const Icon(Icons.add_circle_outline,
                        color: Colors.white),
                    title: const Text('Add to playlist',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading:
                        const Icon(Icons.visibility_off, color: Colors.white),
                    title: const Text('Hide song',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.share, color: Colors.white),
                    title: const Text(
                      'Share',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.person_add_alt_1_outlined,
                        color: Colors.white),
                    title: const Text('Song credits',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500)),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void showAddPlaylistMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext bc) {
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
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 32.0),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 24.0),
                        decoration: InputDecoration(
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
                      onPressed: () {},
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
