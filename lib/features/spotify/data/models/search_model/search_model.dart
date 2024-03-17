import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spotify_app/features/spotify/data/models/playlist_model/playlist_model.dart';
import 'package:spotify_app/features/spotify/domain/entities/search_album_entities.dart';
part 'search_model.g.dart';

@JsonSerializable()
class SearchResponse {
  @JsonKey(name: "albums")
  SearchWrapper wrapper;

  SearchResponse({required this.wrapper});
  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
}

@JsonSerializable()
class SearchWrapper {
  @JsonKey(name: "items")
  List<ItemModel> listItemModel;

  SearchWrapper({required this.listItemModel});
  factory SearchWrapper.fromJson(Map<String, dynamic> json) =>
      _$SearchWrapperFromJson(json);
}

@JsonSerializable()
class ItemModel extends SearchAlbumEntities {
  @JsonKey(name: "artists")
  List<ArtistModel> listArtistModel;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "type")
  String type;
  @JsonKey(name: "images")
  List<ImageModel> images;
  ItemModel(
      {required this.id,
      required this.images,
      required this.listArtistModel,
      required this.name,
      required this.type})
      : super(
            nameAlbum: name,
            nameArtist: listArtistModel[0].name,
            idAlbum: id,
            imagesList: images,
            type: type);
  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
}

@JsonSerializable()
class ArtistModel {
  @JsonKey(name: "name")
  String name;

  ArtistModel({required this.name});
  factory ArtistModel.fromJson(Map<String, dynamic> json) =>
      _$ArtistModelFromJson(json);
}
