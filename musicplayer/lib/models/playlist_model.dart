import 'package:musicplayer/models/song_model.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({required this.title, required this.songs, required this.imageUrl});

  static List<Playlist> playlists = [
    Playlist(
      title: "Hip Hop",
      songs: Song.songs,
      imageUrl: "assets/images/diehard.jpeg",
    ),
    Playlist(
      title: "Alternatives",
      songs: Song.songs,
      imageUrl: "assets/images/blem.jpeg",
    ),
    Playlist(
      title: "R/B Soul",
      songs: Song.songs,
      imageUrl: "assets/images/reminder.jpg",
    )
  ];
}
