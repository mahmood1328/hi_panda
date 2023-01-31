import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';

import '../../../Models/track_model.dart';
import '../../../Widget/miniplayer.dart';
import '../../../main.dart';
import 'player_page.dart';

class ListAudioPage extends StatefulWidget {
  const ListAudioPage({Key? key}) : super(key: key);

  @override
  State<ListAudioPage> createState() => _ListAudioPageState();
}

class _ListAudioPageState extends State<ListAudioPage> {
  List<Track> trackMusic=[
    Track(id: 1, name: "هوشنگ ابتهاج", duration: 59, albumId: 2, lyric: "lyric", music: 'https://dls.music-fa.com/tagdl/ati/Hoshang%20Ebtehaj%20-%20Neshasteam%20Be%20Dar%20Negah%20Mikonam%20(128).mp3', image: 'https://music-fa.com/wp-content/uploads/2021/05/Hoshang-Ebtehaj-Neshasteam-Be-Dar-Negah-Mikonam-Music-fa.com_.jpg'),
    Track(id: 2, name: "همایون شجریان", duration: 59, albumId: 3, lyric: "lyric", music: 'https://dls.music-fa.com/tagdl/ati/Hoshang%20Ebtehaj%20-%20Neshasteam%20Be%20Dar%20Negah%20Mikonam%20(128).mp3',image: 'https://music-fa.com/wp-content/uploads/2022/04/Homayoun-Shajaryan-Music-fa.com_.jpg'),
    Track(id: 3, name: "قربانی ", duration: 59, albumId: 5, lyric: "lyric", music: 'https://dls.music-fa.com/tagdl/ati/Hoshang%20Ebtehaj%20-%20Neshasteam%20Be%20Dar%20Negah%20Mikonam%20(128).mp3',image: 'https://music-fa.com/wp-content/uploads/2022/01/Sajad-Rabibeygi-Ghorbani-Chovilet-Music-fa.com_.jpg'),
    Track(id: 4, name: "مونو بند", duration: 59, albumId: 8, lyric: "lyric", music: 'https://dls.music-fa.com/tagdl/ati/Hoshang%20Ebtehaj%20-%20Neshasteam%20Be%20Dar%20Negah%20Mikonam%20(128).mp3',image: 'https://music-fa.com/wp-content/uploads/2022/08/Mono-Band-Doaye-Madarame-Music-Fa.Com_.jpg'),
    Track(id: 5, name: "سینا صداقت", duration: 59, albumId: 9, lyric: "lyric", music: 'https://dls.music-fa.com/tagdl/ati/Hoshang%20Ebtehaj%20-%20Neshasteam%20Be%20Dar%20Negah%20Mikonam%20(128).mp3',image: 'https://music-fa.com/wp-content/uploads/2022/08/Dariush-Safari-Tanpoosh.jpg'),

  ];
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Align(
            alignment: Alignment.bottomCenter,
            child: MiniPlayer()),
        GestureDetector(
          onTap: (){
            audioHandler.stop();
            for (int i = 0; i < trackMusic.length; i++) {
              audioHandler.updateQueue([
                MediaItem(
                    id: "${trackMusic[i].id}",
                    album: trackMusic[i].name,
                    title: trackMusic[i].name,
                    artist: trackMusic[i].name,
                    duration:  Duration(seconds: trackMusic[i].duration),
                    artUri: Uri.parse(
                        trackMusic[i].image),

                    extras: {"url":trackMusic[i].music,
                      "token":"token","lyric":trackMusic[i].lyric}
                ),

              ]);



            }
            audioHandler.skipToQueueItem(0);
            audioHandler.seek(Duration(seconds: 0));
            audioHandler.play();
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                PlayerPage(),));
          },
          child: const Center(
            child: Text("Play",style: TextStyle(color: Colors.black,fontSize: 30),),
          ),
        ),
      ],
    );
  }
}
