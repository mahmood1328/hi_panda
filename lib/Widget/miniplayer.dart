import 'dart:io';
import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../View/audio_player/Page/player_page.dart';
import '../main.dart';
import 'gradient_containers.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({super.key});

  @override
  _MiniPlayerState createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlaybackState>(
        stream: audioHandler.playbackState,
        builder: (context, snapshot) {
          final playbackState = snapshot.data;
          final processingState = playbackState?.processingState;
          if (processingState == AudioProcessingState.idle) {
            return const SizedBox();
          }
          return StreamBuilder<MediaItem?>(
              stream: audioHandler.mediaItem,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.active) {
                  return const SizedBox();
                }
                final mediaItem = snapshot.data;
                if (mediaItem == null) return const SizedBox();
                return Dismissible(
                  key: Key(mediaItem.id),
                  onDismissed: (_) {
                    audioHandler.stop();
                  },
                  child: ValueListenableBuilder(
                      valueListenable: Hive.box('settings').listenable(),
                      builder: (BuildContext context, Box box, Widget? widget) {
                        final bool useDense = box.get('useDenseMini',
                            defaultValue: false) as bool;
                        return SizedBox(
                          height: useDense ? 68.0 : 76.0,
                          child: GradientCard(
                              miniplayer: true,
                              radius: 0.0,
                              elevation: 0.0,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    dense: useDense,
                                    onTap: () {
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          opaque: false,
                                          pageBuilder: (_, __, ___) =>
                                               PlayerPage(),
                                        ),
                                      );
                                    },
                                    title: Text(
                                      mediaItem.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Text(
                                      mediaItem.artist ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    leading: Hero(
                                        tag: 'currentArtwork',
                                        child: Card(
                                          elevation: 8,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7.0)),
                                          clipBehavior: Clip.antiAlias,
                                          child: (mediaItem.artUri
                                                  .toString()
                                                  .startsWith('file:'))
                                              ? SizedBox.square(
                                                  dimension:
                                                      useDense ? 40.0 : 50.0,
                                                  child: Image(
                                                      fit: BoxFit.cover,
                                                      image: FileImage(File(
                                                          mediaItem.artUri!
                                                              .toFilePath()))),
                                                )
                                              : SizedBox.square(
                                                  dimension:
                                                      useDense ? 40.0 : 50.0,
                                                  child: CachedNetworkImage(
                                                      fit: BoxFit.cover,
                                                      errorWidget:
                                                          (BuildContext context,
                                                                  _, __) =>
                                                              const Image(
                                                                image: AssetImage(
                                                                    'assets/cover.jpg'),
                                                              ),
                                                      placeholder:
                                                          (BuildContext context,
                                                                  _) =>
                                                              const Image(
                                                                image: AssetImage(
                                                                    'assets/cover.jpg'),
                                                              ),
                                                      imageUrl: mediaItem.artUri
                                                          .toString()),
                                                ),
                                        )),
                                    trailing: ControlButtons(
                                      audioHandler,
                                      miniPlayer: true,
                                    ),
                                  ),
                                  StreamBuilder<Duration>(
                                      stream: AudioService.position,
                                      builder: (context, snapshot) {
                                        final position = snapshot.data;
                                        return position == null
                                            ? const SizedBox()
                                            : (position.inSeconds.toDouble() <
                                                        0.0 ||
                                                    (position.inSeconds
                                                            .toDouble() >
                                                        mediaItem
                                                            .duration!.inSeconds
                                                            .toDouble()))
                                                ? const SizedBox()
                                                : SliderTheme(
                                                    data:
                                                        SliderTheme.of(context)
                                                            .copyWith(
                                                      activeTrackColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .secondary,
                                                      inactiveTrackColor:
                                                          Colors.transparent,
                                                      trackHeight: 0.5,
                                                      thumbColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .secondary,
                                                      thumbShape:
                                                          const RoundSliderThumbShape(
                                                              enabledThumbRadius:
                                                                  1.0),
                                                      overlayColor:
                                                          Colors.transparent,
                                                      overlayShape:
                                                          const RoundSliderOverlayShape(
                                                              overlayRadius:
                                                                  2.0),
                                                    ),
                                                    child: Slider(
                                                      inactiveColor:
                                                          Colors.transparent,
                                                      // activeColor: Colors.white,
                                                      value: position.inSeconds
                                                          .toDouble(),
                                                      max: mediaItem
                                                          .duration!.inSeconds
                                                          .toDouble(),
                                                      onChanged: (newPosition) {
                                                        audioHandler.seek(Duration(
                                                            seconds: newPosition
                                                                .round()));
                                                      },
                                                    ),
                                                  );
                                      }),
                                ],
                              )),
                        );
                      }),
                );
              });
        });
  }
}
