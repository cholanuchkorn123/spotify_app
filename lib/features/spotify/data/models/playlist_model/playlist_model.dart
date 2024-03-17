import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spotify_app/features/spotify/domain/entities/item_playlist_entities.dart';
part 'playlist_model.g.dart';

@JsonSerializable()
class PlayListResponse {
  @JsonKey(name: "playlists")
  PlayListWrapModel wrapper;

  PlayListResponse({required this.wrapper});
  factory PlayListResponse.fromJson(Map<String, dynamic> json) =>
      _$PlayListResponseFromJson(json);
}

@JsonSerializable()
class PlayListWrapModel {
  @JsonKey(name: "items")
  List<PlayListModel> playListModel;

  PlayListWrapModel({required this.playListModel});
  factory PlayListWrapModel.fromJson(Map<String, dynamic> json) =>
      _$PlayListWrapModelFromJson(json);
  Map<String, dynamic> toJson() => _$PlayListWrapModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PlayListModel extends PlayListEntities {
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "images")
  List<ImageModel> images;
  @JsonKey(name: "public")
  bool public;
  @JsonKey(name: "type")
  String type;
  @JsonKey(name: "uri")
  String uri;
  PlayListModel(
      {required this.description,
      required this.id,
      required this.images,
      required this.public,
      required this.type,
      required this.uri,
      required this.name})
      : super(
            description: description,
            id: id,
            imagesList: images,
            public: public,
            type: type,
            uri: uri,
            name: name);
  factory PlayListModel.fromJson(Map<String, dynamic> json) =>
      _$PlayListModelFromJson(json);
  Map<String, dynamic> toJson() => _$PlayListModelToJson(this);
}

@JsonSerializable()
class ImageModel extends ImageEntities {
  @JsonKey(name: "url")
  String url;

  ImageModel({required this.url}) : super(url: url);
  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
