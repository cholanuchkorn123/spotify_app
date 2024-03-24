import 'package:freezed_annotation/freezed_annotation.dart';
part 'request_add_song.g.dart';

@JsonSerializable()
class RequestAddSongPlaylist {
  List<String> uris;
  int position;
  RequestAddSongPlaylist({required this.uris, required this.position});
  Map<String, dynamic> toJson() => _$RequestAddSongPlaylistToJson(this);
}
