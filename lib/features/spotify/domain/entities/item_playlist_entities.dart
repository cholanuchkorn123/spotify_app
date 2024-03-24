import 'package:spotify_app/features/spotify/data/models/playlist_model/playlist_model.dart';

abstract class PlayListEntities {
  String description;
  String id;
  List<ImageModel>? imagesList;
  String name;

  bool public;
  String type;
  String uri;

  PlayListEntities({
    required this.description,
    required this.id,
    required this.imagesList,
    required this.name,
    required this.public,
    required this.type,
    required this.uri,
  });
}

abstract class ImageEntities {
  String url;
  ImageEntities({
    required this.url,
  });
}

abstract class Owner {
  String displayName;
  String id;
  String type;
  Owner({
    required this.displayName,
    required this.id,
    required this.type,
  });
}
