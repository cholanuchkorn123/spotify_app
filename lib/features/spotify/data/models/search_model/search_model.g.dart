// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse(
      wrapper: SearchWrapper.fromJson(json['albums'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'albums': instance.wrapper,
    };

SearchWrapper _$SearchWrapperFromJson(Map<String, dynamic> json) =>
    SearchWrapper(
      listItemModel: (json['items'] as List<dynamic>)
          .map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchWrapperToJson(SearchWrapper instance) =>
    <String, dynamic>{
      'items': instance.listItemModel,
    };

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      id: json['id'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      listArtistModel: (json['artists'] as List<dynamic>)
          .map((e) => ArtistModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'artists': instance.listArtistModel,
      'name': instance.name,
      'id': instance.id,
      'type': instance.type,
      'images': instance.images,
    };

ArtistModel _$ArtistModelFromJson(Map<String, dynamic> json) => ArtistModel(
      name: json['name'] as String,
    );

Map<String, dynamic> _$ArtistModelToJson(ArtistModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
