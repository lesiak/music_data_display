import 'playlist.dart';

class Track {
  String artist;
  String title;
  String album;
  double royaltytrackid;
  Null started;
  int id;
  int length;
  Playlist playlist;
  String buyurl;
  String imageurl;

  Track(
      {this.artist,
        this.title,
        this.album,
        this.royaltytrackid,
        this.started,
        this.id,
        this.length,
        this.playlist,
        this.buyurl,
        this.imageurl});

  Track.fromJson(Map<String, dynamic> json) {
    artist = json['artist'];
    title = json['title'];
    album = json['album'];
    royaltytrackid = json['royaltytrackid'];
    started = json['started'];
    id = json['id'];
    length = json['length'];
    playlist = json['playlist'] != null
        ? new Playlist.fromJson(json['playlist'])
        : null;
    buyurl = json['buyurl'];
    imageurl = json['imageurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artist'] = this.artist;
    data['title'] = this.title;
    data['album'] = this.album;
    data['royaltytrackid'] = this.royaltytrackid;
    data['started'] = this.started;
    data['id'] = this.id;
    data['length'] = this.length;
    if (this.playlist != null) {
      data['playlist'] = this.playlist.toJson();
    }
    data['buyurl'] = this.buyurl;
    data['imageurl'] = this.imageurl;
    return data;
  }
}