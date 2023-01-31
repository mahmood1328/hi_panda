import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:video_player/video_player.dart';
import '../Network/service_url.dart';
import '../View/Verify/Controller/verify_controller.dart';
import '../View/audio_player/Page/player_page.dart';
import '../main.dart';
import '../utils/res/colors.dart';
import '../utils/size_config.dart';
import 'gradient_containers.dart';

class ModalCourseAudio extends StatefulWidget {
  const ModalCourseAudio({Key? key}) : super(key: key);


  @override
  _ModalCourseAudioState createState() => _ModalCourseAudioState();

}

class _ModalCourseAudioState extends State<ModalCourseAudio> {

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioHandler.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: ColorsApp.white,
        child: SizedBox(
          height: SizeConfig.screenHeight/1.6,
          width: SizeConfig.screenWidth,
          child: Column(
            children: [
           StreamBuilder<PlaybackState>(
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
                                // height: useDense ? 68.0 : 76.0,
                                child: GradientCard(
                                    miniplayer: true,
                                    radius: 0.0,
                                    elevation: 0.0,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Hero(
                                            tag: 'currentArtwork',
                                            child: Card(
                                              elevation: 8,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(7.0)),
                                              clipBehavior: Clip.antiAlias,
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
                                            )),
                                        ListTile(
                                          dense: useDense,
                                          onTap: () {
                                            // Navigator.of(context).push(
                                            //   PageRouteBuilder(
                                            //     opaque: false,
                                            //     pageBuilder: (_, __, ___) =>
                                            //         PlayerPage(),
                                            //   ),
                                            // );
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
              }),
            ],
          ),
        ));
  }

}
