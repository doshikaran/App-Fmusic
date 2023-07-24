import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicplayer/models/song_model.dart';

class SongCard extends StatelessWidget {
  const SongCard({
    super.key,
    required this.songs,
  });

  final Song songs;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/song', arguments: songs);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(songs.coverUrl), fit: BoxFit.cover)),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            height: 50,
            width: MediaQuery.of(context).size.width * 0.35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      songs.title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(
                      songs.description,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    )
                  ],
                ),
                Icon(
                  Icons.play_circle,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
