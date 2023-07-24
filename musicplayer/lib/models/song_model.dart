class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song(
      {required this.title,
      required this.description,
      required this.url,
      required this.coverUrl});

  static List<Song> songs = [
    Song(
      title: "Die Hard",
      description: "Hip-Hop/Rap",
      url: "assets/music/diehard.mp3",
      coverUrl: "assets/images/diehard.jpeg",
    ),
    Song(
      title: "Blem",
      description: "Hip-Hop/Rap",
      url: "assets/music/blem.mp3",
      coverUrl: "assets/images/blem.jpeg",
    ),
    Song(
      title: "Reminder",
      description: "R&B/Soul",
      url: "assets/music/reminder.mp3",
      coverUrl: "assets/images/reminder.jpg",
    )
  ];
}
