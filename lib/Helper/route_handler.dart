
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'audio_query.dart';


class HandleRoute {
  Route? handleRoute(String? url) {
    final List<String> paths = url?.replaceAll('?', '/').split('/') ?? [];
    if (paths.isNotEmpty &&
        paths.length > 3 &&
        (paths[1] == 'song' || paths[1] == 'album' || paths[1] == 'featured') &&
        paths[3].trim() != '') {
      return PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, __, ___) => SongUrlHandler(
          token: paths[3],
          type: paths[1] == 'featured' ? 'playlist' : paths[1],
        ),
      );
    } else {
      if (int.tryParse(paths.last) != null) {
        return PageRouteBuilder(
          opaque: false,
          pageBuilder: (_, __, ___) => OfflinePlayHandler(
            id: paths.last,
          ),
        );
      }
    }

    return null;
  }
}

class SongUrlHandler extends StatelessWidget {
  final String token;
  final String type;
  const SongUrlHandler({Key? key, required this.token, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SaavnAPI().getSongFromToken(token, type).then((value) {
    //   if (type == 'song') {
    //     // Navigator.push(
    //     //   context,
    //     //   PageRouteBuilder(
    //     //     opaque: false,
    //     //     pageBuilder: (_, __, ___) => PlayScreen(
    //     //       data: {
    //     //         'response': value['songs'],
    //     //         'index': 0,
    //     //         'offline': false,
    //     //       },
    //     //       fromMiniplayer: false,
    //     //     ),
    //     //   ),
    //     // );
    //   }
    //   if (type == 'album' || type == 'playlist') {
    //     // Navigator.push(
    //     //   context,
    //     //   PageRouteBuilder(
    //     //       opaque: false,
    //     //       pageBuilder: (_, __, ___) => SongsListPage(
    //     //             listItem: value,
    //     //           )),
    //     // );
    //   }
    // });
    return Container();
  }
}

class OfflinePlayHandler extends StatelessWidget {
  final String id;
  const OfflinePlayHandler({Key? key, required this.id}) : super(key: key);

  Future<List> playOfflineSong(String id) async {
    final List cachedSongsMap =
        Hive.box('cache').get('offlineSongsData', defaultValue: []) as List;

    final int index =
        cachedSongsMap.indexWhere((i) => i['_id'].toString() == id);
    if (index == -1) {
      final OfflineAudioQuery offlineAudioQuery = OfflineAudioQuery();
      await offlineAudioQuery.requestPermission();

      final List<SongModel> temp = await offlineAudioQuery.getSongs();
      final int index = temp.indexWhere((i) => i.id.toString() == id);
      final List cachedSongsMap =
          await offlineAudioQuery.getArtwork([temp[index]]);
      return [0, cachedSongsMap];
    }
    return [index, cachedSongsMap];
  }

  @override
  Widget build(BuildContext context) {
    playOfflineSong(id).then((value) {
      // Navigator.push(
      //   context,
      //   PageRouteBuilder(
      //     opaque: false,
      //     pageBuilder: (_, __, ___) => PlayScreen(
      //       data: {'response': value[1], 'index': value[0], 'offline': true},
      //       fromMiniplayer: false,
      //     ),
      //   ),
      // );
    });
    return Container();
  }
}
