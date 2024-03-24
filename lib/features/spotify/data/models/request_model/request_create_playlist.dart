import 'package:freezed_annotation/freezed_annotation.dart';
part 'request_create_playlist.g.dart';

@JsonSerializable()
class RequestCreatePlaylist {
  String name;
  String description;
  bool public;

  RequestCreatePlaylist(
      {required this.description, required this.name, required this.public});
  Map<String, dynamic> toJson() => _$RequestCreatePlaylistToJson(this);
}
