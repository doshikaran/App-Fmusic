// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:musicplayer/models/playlist_model.dart';
import 'package:musicplayer/models/song_model.dart';
import 'package:musicplayer/widgets/header.dart';
import 'package:musicplayer/widgets/playlist_card.dart';
import 'package:musicplayer/widgets/song_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;
    List<Playlist> playlists = Playlist.playlists;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
              colors: [
            Color(0xFF040404),
            Color.fromARGB(137, 101, 101, 101),
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(),
        bottomNavigationBar: const CustomBottomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SearchMusic(),
              TrendingMusic(songs: songs),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Header(title: 'Playlists'),
                    ListView.builder(
                        itemCount: playlists.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 10),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return PlaylistCard(playlists: playlists[index]);
                        }))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TrendingMusic extends StatelessWidget {
  const TrendingMusic({
    super.key,
    required this.songs,
  });

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, top: 20, bottom: 20),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Header(title: 'Trending Music'),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return SongCard(songs: songs[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}

class SearchMusic extends StatelessWidget {
  const SearchMusic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to Fmusic',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            'Enjoy your favorite music',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              hintText: 'Search',
              fillColor: Colors.white,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey.shade400),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white24,
      // showUnselectedLabels: true,
      // showSelectedLabels: t,
      elevation: 2,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline), label: "Favorites"),
        BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_fill_outlined), label: "Play"),
        BottomNavigationBarItem(
            icon: Icon(Icons.people_outline), label: "Profile"),
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.grid_view_rounded),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://i.pinimg.com/564x/fb/79/1e/fb791e433d95e694669c865c121a1437.jpg"),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}
