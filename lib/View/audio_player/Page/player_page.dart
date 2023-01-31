import 'dart:async';
import 'dart:io';
import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:rxdart/rxdart.dart';
import '../../../Helper/config.dart';
import '../../../Widget/gradient_containers.dart';
import '../../../Widget/snackbar.dart';
import '../../../Widget/textinput_dialog.dart';
import '../../../main.dart';
import '../Widget/common.dart';
class PlayerPage extends StatefulWidget {
  const PlayerPage({Key? key,})
      : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  final globalKey = GlobalKey<ScaffoldState>();

  Box settingsBox = Hive.box('settings');
  List playlistNames = Hive.box('settings')
      .get('playlistNames', defaultValue: ['Favorite Songs']) as List;
  Map playlistDetails =
  Hive.box('settings').get('playlistDetails', defaultValue: {}) as Map;

  void callback() {
    setState(() {});
  }

  bool fromMiniplayer = false;
  String preferredQuality = Hive.box('settings')
      .get('streamingQuality', defaultValue: '96 kbps')
      .toString();
  String repeatMode =
      Hive.box('settings').get('repeatMode', defaultValue: 'None').toString();
  bool enforceRepeat =
      Hive.box('settings').get('enforceRepeat', defaultValue: false) as bool;
  bool shuffle =
      Hive.box('settings').get('shuffle', defaultValue: false) as bool;
  bool useImageColor =
      Hive.box('settings').get('useImageColor', defaultValue: true) as bool;
  List<MediaItem> globalQueue = [];
  int globalIndex = 0;
  bool same = false;
  List response = [];
  bool fetched = false;
  bool offline = false;
  bool downloaded = false;
  bool fromYT = false;
  String defaultCover = '';

  Stream<Duration> get _bufferedPositionStream => audioHandler.playbackState
      .map((state) => state.bufferedPosition)
      .distinct();
  Stream<Duration?> get _durationStream =>
      audioHandler.mediaItem.map((item) => item?.duration).distinct();
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          AudioService.position,
          _bufferedPositionStream,
          _durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  final ValueNotifier<Color?> gradientColor =
      ValueNotifier<Color?>(currentTheme.playGradientColor);

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  void sleepTimer(int time) {
    audioHandler.customAction('sleepTimer', {'time': time});
  }

  void sleepCounter(int count) {
    audioHandler.customAction('sleepCounter', {'count': count});
  }
  String token = "";
  late Duration _time;
  @override
  void initState() {
    super.initState();
    audioHandler.play;
    //  (MediaLibrary.items[MediaLibrary.albumsRootId] as List<MediaItem>)
    //      .addAll(widget.track!.map((e) => MediaItem(
    //      id: "${e.id}", title: e.name,artist: widget.artistName,album: widget.artistName ,
    //      extras: {"url":"${ServiceURL.artistsSong}/${widget.artistId}/track/${e.id}/cover"
    // ,"token":token}
    //  )).toList());
  }

  Future<void> main() async {
    await Hive.openBox('Favorite Songs');
  }

  Future<void> updateNplay() async {
    await audioHandler.setShuffleMode(AudioServiceShuffleMode.none);
    await audioHandler.updateQueue(globalQueue);
    await audioHandler.skipToQueueItem(globalIndex);
    await audioHandler.play();
    if (enforceRepeat) {
      switch (repeatMode) {
        case 'None':
          audioHandler.setRepeatMode(AudioServiceRepeatMode.none);
          break;
        case 'All':
          audioHandler.setRepeatMode(AudioServiceRepeatMode.all);
          break;
        case 'One':
          audioHandler.setRepeatMode(AudioServiceRepeatMode.one);
          break;
        default:
          break;
      }
    } else {
      audioHandler.setRepeatMode(AudioServiceRepeatMode.none);
    }
  }
  @override
  Widget build(BuildContext context) {
    BuildContext? scaffoldContext;

    Future<void> getColors(ImageProvider imageProvider) async {
      final PaletteGenerator paletteGenerator =
          await PaletteGenerator.fromImageProvider(imageProvider);
      gradientColor.value = paletteGenerator.dominantColor?.color;
      currentTheme.setLastPlayGradient(gradientColor.value);
    }

    return Dismissible(
      direction: DismissDirection.down,
      background: Container(color: Colors.transparent),
      key: const Key('playScreen'),
      onDismissed: (direction) {
        Navigator.pop(context);
      },
      child: StreamBuilder<MediaItem?>(
          stream: audioHandler.mediaItem,
          builder: (context, snapshot) {
            final MediaItem? mediaItem = snapshot.data;
            if (mediaItem == null) return const SizedBox();
            mediaItem.artUri.toString().startsWith('file')
                ? getColors(FileImage(File(mediaItem.artUri!.toFilePath())))
                : getColors(
                    CachedNetworkImageProvider(mediaItem.artUri.toString()));
            return ValueListenableBuilder(
                valueListenable: gradientColor,
                builder: (BuildContext context, Color? value, Widget? child) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: !useImageColor
                            ? Alignment.topLeft
                            : Alignment.topCenter,
                        end: !useImageColor
                            ? Alignment.bottomRight
                            : Alignment.center,
                        colors: !useImageColor
                            ? Theme.of(context).brightness == Brightness.dark
                                ? currentTheme.getBackGradient()
                                : [
                                    const Color(0xfff5f9ff),
                                    Colors.white,
                                  ]
                            : Theme.of(context).brightness == Brightness.dark
                                ? [
                                    value ?? Colors.grey[900]!,
                                    currentTheme.getPlayGradient(),
                                  ]
                                : [
                                    value ?? const Color(0xfff5f9ff),
                                    Colors.white,
                                  ],
                      ),
                    ),
                    child: SafeArea(
                      child: Scaffold(
                        backgroundColor: Colors.transparent,
                        appBar: AppBar(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          centerTitle: true,
                          leading: IconButton(
                              icon: const Icon(Icons.expand_more_rounded),
                              tooltip: "back",
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          actions: [
                            IconButton(
                              icon: Image.asset(
                                'assets/lyrics.png',
                              ),
                              tooltip: "lyrics",
                              onPressed: () =>
                                  cardKey.currentState!.toggleCard(),
                            ),
                            // IconButton(
                            //     icon: const Icon(Icons.description),
                            //     tooltip: "share",
                            //     onPressed: () {
                            //       showDialog(
                            //         context: context,
                            //         builder: (context) {
                            //           return SimpleDialog(
                            //             title: Text(
                            //               "Info Track",
                            //               style: TextStyle(
                            //                 color: Theme.of(context)
                            //                     .colorScheme
                            //                     .onSecondary,fontSize: 17,fontWeight: FontWeight.bold,
                            //               ),
                            //             ),
                            //             contentPadding:
                            //             const EdgeInsets.all(10.0),
                            //           );
                            //         },
                            //       );
                            //     }),
                            PopupMenuButton(
                              icon: const Icon(
                                Icons.more_vert_rounded,
                              ),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              onSelected: (int? value) {
                                if (value == 5) {
                                }
                                if (value == 1) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return SimpleDialog(
                                        title: Text(
                                              "sleepTimer",
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary,
                                          ),
                                        ),
                                        contentPadding:
                                            const EdgeInsets.all(10.0),
                                        children: [
                                          ListTile(
                                            title: const Text(
                                               "sleepDur"),
                                            subtitle: const Text(
                                               "sleepDurSub"),
                                            dense: true,
                                            onTap: () {
                                              Navigator.pop(context);
                                              setTimer(
                                                  context, scaffoldContext);
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              itemBuilder: (context) => offline
                                  ? [
                                      if (mediaItem.extras?['album_id'] != null)
                                        PopupMenuItem(
                                            value: 5,
                                            child: Row(
                                              children: const [
                                                Icon(
                                                  Icons.music_note_rounded,
                                                ),
                                                SizedBox(width: 10.0),
                                                Text("viewAlbum"),
                                              ],
                                            )),
                                      PopupMenuItem(
                                          value: 1,
                                          child: Row(
                                            children: const [
                                              Icon(
                                                CupertinoIcons.timer,
                                              ),
                                              SizedBox(width: 10.0),
                                              Text("sleepTimer"),
                                            ],
                                          )),
                                    ]
                                  : [
                                      if (mediaItem.extras?['album_id'] != null)
                                        PopupMenuItem(
                                            value: 5,
                                            child: Row(
                                              children: const [
                                                Icon(
                                                  Icons.music_note_rounded,
                                                ),
                                                SizedBox(width: 10.0),
                                                Text("viewAlbum"),
                                              ],
                                            )),
                                      PopupMenuItem(
                                          value: 0,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.playlist_add_rounded,
                                                color: Theme.of(context)
                                                    .iconTheme
                                                    .color,
                                              ),
                                              const SizedBox(width: 10.0),
                                              const Text("addToPlaylist"),
                                            ],
                                          )),
                                      PopupMenuItem(
                                          value: 1,
                                          child: Row(
                                            children: [
                                              Icon(
                                                CupertinoIcons.timer,
                                                color: Theme.of(context)
                                                    .iconTheme
                                                    .color,
                                              ),
                                              const SizedBox(width: 10.0),
                                              const Text("sleepTimer"),
                                            ],
                                          )),
                                    ],
                            )
                          ],
                        ),
                        body: Builder(builder: (BuildContext context) {
                          scaffoldContext = context;
                          return LayoutBuilder(builder: (BuildContext context,
                              BoxConstraints constraints) {
                            if (constraints.maxWidth > constraints.maxHeight) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // Artwork
                                  ArtWorkWidget(
                                    cardKey,
                                    mediaItem,
                                    constraints.maxHeight / 0.9,
                                    offline: offline,
                                  ),

                                  // title and controls
                                  SizedBox(
                                    width: constraints.maxWidth / 2,
                                    child: NameNControls(
                                      mediaItem,
                                      offline: offline,
                                    ),
                                  ),
                                ],
                              );
                            }
                            return Column(
                              children: [

                                // Artwork
                                ArtWorkWidget(
                                  cardKey,
                                  mediaItem,
                                  constraints.maxWidth,
                                  offline: offline,
                                ),

                                // title and controls
                                Expanded(
                                  child: NameNControls(mediaItem,
                                      offline: offline,
                                     ),
                                ),
                              ],
                            );
                          });
                        }),

                        // }
                      ),
                    ),
                  );
                });
            // );
          }),
    );
  }

  Future<dynamic> setTimer(
      BuildContext context, BuildContext? scaffoldContext) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Center(
              child: Text(
            "selectDur",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSecondary),
          )),
          children: [
            Center(
                child: SizedBox(
              height: 200,
              width: 200,
              child: CupertinoTheme(
                data: CupertinoThemeData(
                  primaryColor: Theme.of(context).colorScheme.onSecondary,
                  textTheme: CupertinoTextThemeData(
                    dateTimePickerTextStyle: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ),
                child: CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.hm,
                  onTimerDurationChanged: (value) {
                    _time = value;
                  },
                ),
              ),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Theme.of(context).colorScheme.onSecondary,
                  ),
                  onPressed: () {
                    sleepTimer(0);
                    Navigator.pop(context);
                  },
                  child: const Text("cancel"),
                ),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.onSecondary,
                      primary: Theme.of(context).colorScheme.onSecondary ==
                              Colors.white
                          ? Colors.black
                          : Colors.white),
                  onPressed: () {
                    sleepTimer(_time.inMinutes);
                    Navigator.pop(context);
                    ShowSnackBar().showSnackBar(
                      context,
                      '${"sleepTimerSetFor"} ${_time.inMinutes} ${"minutes"}',
                    );
                  },
                  child: const Text("ok"),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> setCounter(BuildContext scaffoldContext) async {
    await TextInputDialog().showTextInputDialog(
        context: scaffoldContext,
        title: "enterSongsCount",
        initialText: '',
        keyboardType: TextInputType.number,
        onSubmitted: (String value) {
          sleepCounter(int.parse(value));
          Navigator.pop(scaffoldContext);
          ShowSnackBar().showSnackBar(
            context,
            '${"sleepTimerSetFor"} $value ${"songs"}',
          );
        });
  }
}

class ControlButtons extends StatelessWidget {
  final AudioPlayerHandler audioHandler;
  final bool shuffle;
  final bool miniPlayer;

   const ControlButtons(this.audioHandler,
      {this.shuffle = false, this.miniPlayer = false});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          StreamBuilder<QueueState>(
            stream: audioHandler.queueState,
            builder: (context, snapshot) {
              final queueState = snapshot.data ?? QueueState.empty;
              return IconButton(
                icon: const Icon(Icons.skip_previous_rounded),
                iconSize: miniPlayer ? 24.0 : 45.0,
                tooltip: "skipPrevious",
                color: Theme.of(context).iconTheme.color,
                onPressed:
                    queueState.hasPrevious ? audioHandler.skipToPrevious : null,
              );
            },
          ),
          SizedBox(
            height: miniPlayer ? 40.0 : 65.0,
            width: miniPlayer ? 40.0 : 65.0,
            child: StreamBuilder<PlaybackState>(
                stream: audioHandler.playbackState,
                builder: (context, snapshot) {
                  final playbackState = snapshot.data;
                  final processingState = playbackState?.processingState;
                  final playing = playbackState?.playing ?? false;
                  return Stack(
                    children: [
                      if (processingState == AudioProcessingState.loading ||
                          processingState == AudioProcessingState.buffering)
                        Center(
                          child: SizedBox(
                            height: miniPlayer ? 40.0 : 65.0,
                            width: miniPlayer ? 40.0 : 65.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).iconTheme.color!,
                              ),
                            ),
                          ),
                        ),
                      if (miniPlayer)
                        Center(
                            child: playing
                                ? IconButton(
                                    tooltip:
                                       "pause",
                                    onPressed: audioHandler.pause,
                                    icon: const Icon(
                                      Icons.pause_rounded,
                                    ),
                                    color: Theme.of(context).iconTheme.color,
                                  )
                                : IconButton(
                                    tooltip: "play",
                                    onPressed: audioHandler.play,
                                    icon: const Icon(
                                      Icons.play_arrow_rounded,
                                    ),
                                    color: Theme.of(context).iconTheme.color,
                                  ))
                      else
                        Center(
                          child: SizedBox(
                              height: 59,
                              width: 59,
                              child: Center(
                                child: playing
                                    ? FloatingActionButton(
                                        elevation: 10,
                                        tooltip:
                                           "pause",
                                        backgroundColor: Colors.white,
                                        onPressed: audioHandler.pause,
                                        child: const Icon(
                                          Icons.pause_rounded,
                                          size: 40.0,
                                          color: Colors.black,
                                        ),
                                      )
                                    : FloatingActionButton(
                                        elevation: 10,
                                        tooltip:
                                           "play",
                                        backgroundColor: Colors.white,
                                        onPressed: audioHandler.play,
                                        child: const Icon(
                                          Icons.play_arrow_rounded,
                                          size: 40.0,
                                          color: Colors.black,
                                        ),
                                      ),
                              )),
                        ),
                    ],
                  );
                }),
          ),
          StreamBuilder<QueueState>(
            stream: audioHandler.queueState,
            builder: (context, snapshot) {
              final queueState = snapshot.data ?? QueueState.empty;
              return IconButton(
                icon: const Icon(Icons.skip_next_rounded),
                iconSize: miniPlayer ? 24.0 : 45.0,
                tooltip: "skipNext",
                color: Theme.of(context).iconTheme.color,
                onPressed: queueState.hasNext ? audioHandler.skipToNext : null,
              );
            },
          ),
        ]);
  }
}

class QueueState {
  static const QueueState empty =
      QueueState([], 0, [], AudioServiceRepeatMode.none);

  final List<MediaItem> queue;
  final int? queueIndex;
  final List<int>? shuffleIndices;
  final AudioServiceRepeatMode repeatMode;

  const QueueState(
      this.queue, this.queueIndex, this.shuffleIndices, this.repeatMode);

  bool get hasPrevious =>
      repeatMode != AudioServiceRepeatMode.none || (queueIndex ?? 0) > 0;
  bool get hasNext =>
      repeatMode != AudioServiceRepeatMode.none ||
      (queueIndex ?? 0) + 1 < queue.length;

  List<int> get indices =>
      shuffleIndices ?? List.generate(queue.length, (i) => i);
}

class NowPlayingStream extends StatelessWidget {
  final AudioPlayerHandler audioHandler;
  final bool hideHeader;

  const NowPlayingStream(this.audioHandler, {this.hideHeader = false});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: StreamBuilder<QueueState>(
          stream: audioHandler.queueState,
          builder: (context, snapshot) {
            final queueState = snapshot.data ?? QueueState.empty;
            final queue = queueState.queue;
            return ReorderableListView.builder(
                header: hideHeader
                    ? null
                    : SizedBox(
                        key: const Key('head'),
                        height: 50,
                        child: Center(
                          child: SizedBox.expand(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                primary: Theme.of(context).iconTheme.color,
                                backgroundColor: Colors.transparent,
                                elevation: 0.0,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "لیست آهنگ ها",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,fontFamily: "IranSANS",
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                onReorder: (int oldIndex, int newIndex) {
                  if (oldIndex < newIndex) {
                    newIndex--;
                  }
                  audioHandler.moveQueueItem(oldIndex, newIndex);
                },
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 10),
                shrinkWrap: true,
                itemCount: queue.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: ValueKey(queue[index].id),
                    direction: index == queueState.queueIndex
                        ? DismissDirection.none
                        : DismissDirection.horizontal,
                    onDismissed: (dir) {
                      audioHandler.removeQueueItem(queue[index]);
                    },
                    child: ListTileTheme(
                      selectedColor: Theme.of(context).colorScheme.onSecondary,
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.only(left: 16.0, right: 10.0),
                        selected: index == queueState.queueIndex,
                        trailing: index == queueState.queueIndex
                            ? IconButton(
                                icon: const Icon(
                                  Icons.bar_chart_rounded,
                                ),
                                tooltip:"playing",
                                onPressed: () {},
                              )
                            : queue[index]
                                    .extras!['url']
                                    .toString()
                                    .startsWith('http')
                                ? Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [

                                    ],
                                  )
                                : const SizedBox(),
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (queue[index].extras?['addedByAutoplay']
                                    as bool? ??
                                false)
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const RotatedBox(
                                        quarterTurns: 3,
                                        child: Text(
                                          "addedBy",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 5.0,
                                          ),
                                        ),
                                      ),
                                      RotatedBox(
                                        quarterTurns: 3,
                                        child: Text(
                                         "autoplay",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 8.0,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                ],
                              ),
                            Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: (queue[index].artUri == null)
                                  ? const SizedBox(
                                      height: 50.0,
                                      width: 50.0,
                                      child: Image(
                                        image: AssetImage('assets/cover.jpg'),
                                      ),
                                    )
                                  : SizedBox(
                                      height: 50.0,
                                      width: 50.0,
                                      child: queue[index]
                                              .artUri
                                              .toString()
                                              .startsWith('file:')
                                          ? Image(
                                              fit: BoxFit.cover,
                                              image: FileImage(File(queue[index]
                                                  .artUri!
                                                  .toFilePath())))
                                          : CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              errorWidget:
                                                  (BuildContext context, _, __) =>
                                                      const Image(
                                                image: AssetImage(
                                                    'assets/cover.jpg'),
                                              ),
                                              placeholder:
                                                  (BuildContext context, _) =>
                                                      const Image(
                                                image: AssetImage(
                                                    'assets/cover.jpg'),
                                              ),
                                              imageUrl:
                                                  queue[index].artUri.toString(),
                                            ),
                                    ),
                            ),
                          ],
                        ),
                        title: Text(
                          queue[index].title,
                          overflow: TextOverflow.ellipsis,textDirection: TextDirection.rtl,
                          style: TextStyle(fontSize: 15,fontFamily: "IranSANS",
                              fontWeight: index == queueState.queueIndex
                                  ? FontWeight.w600
                                  : FontWeight.normal),
                        ),
                        // subtitle: Text(
                        //   queue[index].artist!,
                        //   overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "IranSANS",
                        //     fontWeight: index == queueState.queueIndex
                        //         ? FontWeight.w400
                        //         : FontWeight.normal),
                        // ),
                        onTap: () {
                          audioHandler.skipToQueueItem(index);
                        },
                      ),
                    ),
                  );
                });
          }),
    );
  }
}

class ArtWorkWidget extends StatefulWidget {
  final GlobalKey<FlipCardState> cardKey;
  final MediaItem mediaItem;
  final bool offline;
  final double width;

  const ArtWorkWidget(this.cardKey, this.mediaItem, this.width,
      {this.offline = false});

  @override
  _ArtWorkWidgetState createState() => _ArtWorkWidgetState();
}

class _ArtWorkWidgetState extends State<ArtWorkWidget> {
  final ValueNotifier<bool> dragging = ValueNotifier<bool>(false);
  final ValueNotifier<bool> done = ValueNotifier<bool>(false);
  Map lyrics = {'id': '', 'lyrics': ''};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.width * 0.9,
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: widget.width * 0.85,
          width: widget.width * 0.85,
          child: Hero(
            tag: 'currentArtwork',
            child: FlipCard(
              key: widget.cardKey,
              flipOnTouch: false,
              onFlipDone: (value) {
                // Lyrics()
                //     .getOffLyrics(widget.mediaItem.extras!['lyric'].toString())
                //     .then((value) {
                //   lyrics['lyrics'] = value;
                //   lyrics['id'] = widget.mediaItem.id;
                //   done.value = true;
                // });
              },
              back: GestureDetector(
                onTap: () => widget.cardKey.currentState!.toggleCard(),
                onDoubleTap: () => widget.cardKey.currentState!.toggleCard(),
                child: Stack(
                  children: [
                    ShaderMask(
                      shaderCallback: (rect) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black,
                            Colors.black,
                            Colors.black,
                            Colors.transparent
                          ],
                        ).createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height));
                      },
                      blendMode: BlendMode.dstIn,
                      child: Center(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              vertical: 55, horizontal: 10),
                          child: SelectableText(
                            widget.mediaItem.extras!['lyric'].toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Theme.of(context).cardColor.withOpacity(0.6),
                        clipBehavior: Clip.antiAlias,
                        child: IconButton(
                          tooltip: "copy",
                          onPressed: () {
                            Clipboard.setData(ClipboardData(
                                text: widget.mediaItem.extras!['lyric']
                                    .toString()));
                            ShowSnackBar().showSnackBar(
                              context,
                              "copied",
                            );
                          },
                          icon: const Icon(Icons.copy_rounded),
                          color: Theme.of(context)
                              .iconTheme
                              .color!
                              .withOpacity(0.6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              front: StreamBuilder<QueueState>(
                  stream: audioHandler.queueState,
                  builder: (context, snapshot) {
                    final queueState = snapshot.data ?? QueueState.empty;

                    final bool enabled = Hive.box('settings')
                        .get('enableGesture', defaultValue: true) as bool;
                    return GestureDetector(
                      onTap: !enabled
                          ? null
                          : () {
                              audioHandler.playbackState.value.playing
                                  ? audioHandler.pause()
                                  : audioHandler.play();
                            },
                      onDoubleTap: !enabled
                          ? null
                          : () => widget.cardKey.currentState!.toggleCard(),
                      onHorizontalDragEnd: !enabled
                          ? null
                          : (DragEndDetails details) {
                              if ((details.primaryVelocity ?? 0) > 100) {
                                if (queueState.hasPrevious) {
                                  audioHandler.skipToPrevious();
                                }
                              }

                              if ((details.primaryVelocity ?? 0) < -100) {
                                if (queueState.hasNext) {
                                  audioHandler.skipToNext();
                                }
                              }
                            },
                      onLongPress: !enabled
                          ? null
                          : () {
                              if (!widget.offline) {
                                // AddToPlaylist()
                                //     .addToPlaylist(context, int.parse(widget.mediaItem.id),widget.datum2);
                                // _songList();
                              }
                            },
                      onVerticalDragStart: !enabled
                          ? null
                          : (_) {
                              dragging.value = true;
                            },
                      onVerticalDragEnd: !enabled
                          ? null
                          : (_) {
                              dragging.value = false;
                            },
                      onVerticalDragUpdate: !enabled
                          ? null
                          : (DragUpdateDetails details) {
                              if (details.delta.dy != 0.0) {
                                double volume = audioHandler.volume.value;
                                volume -= details.delta.dy / 150;
                                if (volume < 0) {
                                  volume = 0;
                                }
                                if (volume > 1.0) {
                                  volume = 1.0;
                                }
                                audioHandler.setVolume(volume);
                              }
                            },
                      child: Stack(
                        children: [
                          Card(
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            clipBehavior: Clip.antiAlias,
                            child: widget.mediaItem.artUri
                                    .toString()
                                    .startsWith('file')
                                ? Image(
                                    fit: BoxFit.cover,
                                    height: widget.width * 0.85,
                                    width: widget.width * 0.85,
                                    gaplessPlayback: true,
                                    image: FileImage(File(
                                        widget.mediaItem.artUri!.toFilePath())))
                                : CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    errorWidget:
                                        (BuildContext context, _, __) =>
                                            const Image(
                                      image: AssetImage('assets/cover.jpg'),
                                    ),
                                    placeholder: (BuildContext context, _) =>
                                        const Image(
                                      image: AssetImage('assets/cover.jpg'),
                                    ),
                                    imageUrl:
                                        widget.mediaItem.artUri.toString(),
                                    height: widget.width * 0.85,
                                  ),
                          ),
                          ValueListenableBuilder(
                              valueListenable: dragging,
                              builder: (BuildContext context, bool value,
                                  Widget? child) {
                                return Visibility(
                                  visible: value,
                                  child: StreamBuilder<double>(
                                      stream: audioHandler.volume,
                                      builder: (context, snapshot) {
                                        final double volumeValue =
                                            snapshot.data ?? 1.0;
                                        return Center(
                                          child: SizedBox(
                                            width: 60.0,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.7,
                                            child: Card(
                                              color: Colors.black87,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              clipBehavior: Clip.antiAlias,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Expanded(
                                                    child: FittedBox(
                                                      fit: BoxFit.fitHeight,
                                                      child: RotatedBox(
                                                        quarterTurns: -1,
                                                        child: SliderTheme(
                                                          data: SliderTheme.of(
                                                                  context)
                                                              .copyWith(
                                                            thumbShape:
                                                                HiddenThumbComponentShape(),
                                                            activeTrackColor:
                                                                Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .onSecondary,
                                                            inactiveTrackColor:
                                                                Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .onSecondary
                                                                    .withOpacity(
                                                                        0.4),
                                                            trackShape:
                                                                const RoundedRectSliderTrackShape(),
                                                          ),
                                                          child:
                                                              ExcludeSemantics(
                                                            child: Slider(
                                                              value:
                                                                  audioHandler
                                                                      .volume
                                                                      .value,
                                                              onChanged: (_) {},
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 20.0),
                                                    child: Icon(volumeValue == 0
                                                        ? Icons
                                                            .volume_off_rounded
                                                        : volumeValue > 0.6
                                                            ? Icons
                                                                .volume_up_rounded
                                                            : Icons
                                                                .volume_down_rounded),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                );
                              }),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}

abstract class AudioPlayerHandler implements AudioHandler {
  Stream<QueueState> get queueState;
  Future<void> moveQueueItem(int currentIndex, int newIndex);
  ValueStream<double> get volume;
  Future<void> setVolume(double volume);
  ValueStream<double> get speed;
}

class NameNControls extends StatefulWidget {
  final MediaItem mediaItem;
  final bool offline;

  const NameNControls(this.mediaItem,
      {this.offline = false,
    });

  @override
  _NameNControlsState createState() => _NameNControlsState();
}

class _NameNControlsState extends State<NameNControls> {


  Stream<Duration> get _bufferedPositionStream => audioHandler.playbackState
      .map((state) => state.bufferedPosition)
      .distinct();
  Stream<Duration?> get _durationStream =>
      audioHandler.mediaItem.map((item) => item?.duration).distinct();
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          AudioService.position,
          _bufferedPositionStream,
          _durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));
  late Duration position;
  String body = "";
  int time = 0;
  int userId = 0;
  bool tack = false;

  @override
  void initState() {
    super.initState();
  }
  // VoidCallback(){
  //   // Future.delayed(const Duration(seconds: 2), () {
  //   //
  //   //   setState(() {
  //   //     tack=false;
  //   //   });
  //   //
  //   // });
  //   tack=false;
  // }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        /// Title and subtitle
        PopupMenuButton<int>(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          offset: const Offset(1.0, 0.0),
          onSelected: (int value) {
            if (value == 0) {
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
            if (widget.mediaItem.extras?['album_id'] != null)
              const PopupMenuItem<int>(
                value: 0,
                child: Center(
                    child: Text("viewAlbum")),
              ),
          ],
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 5, 35, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    /// Title container
                    Text(
                      widget.mediaItem.title
                          .split(' (')[0]
                          .split('|')[0]
                          .trim(),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,textDirection: TextDirection.rtl,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,fontFamily: "IranSANS"
                        // color: Theme.of(context).accentColor,
                      ),
                    ),

                    const SizedBox(height: 3.0),

                    /// Subtitle container
                    Text(
                      '${widget.mediaItem.artist ?? "Unknown"} • ${widget.mediaItem.album ?? "Unknown"}',
                      textAlign: TextAlign.center,textDirection: TextDirection.rtl,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400,fontFamily: "IranSANS"),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        /// Seekbar starts from here


        StreamBuilder<PositionData>(
          stream: _positionDataStream,
          builder: (context, snapshot) {
            final positionData = snapshot.data ??
                PositionData(Duration.zero, Duration.zero,
                    widget.mediaItem.duration ?? Duration.zero);
            position = positionData.position;
            return SeekBar(
              duration: positionData.duration,
              position: positionData.position,
              bufferedPosition: positionData.bufferedPosition,
              onChangeEnd: (newPosition) {
                audioHandler.seek(newPosition);
              },
            );
          },
        ),

        /// Final row starts from here
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const SizedBox(height: 6.0),
                  StreamBuilder<bool>(
                    stream: audioHandler.playbackState
                        .map((state) =>
                            state.shuffleMode == AudioServiceShuffleMode.all)
                        .distinct(),
                    builder: (context, snapshot) {
                      final shuffleModeEnabled = snapshot.data ?? false;
                      return IconButton(
                        icon: shuffleModeEnabled
                            ? const Icon(
                                Icons.shuffle_rounded,
                              )
                            : Icon(Icons.shuffle_rounded,
                                color: Theme.of(context).disabledColor),
                        tooltip: "shuffle",
                        onPressed: () async {
                          final enable = !shuffleModeEnabled;
                          await audioHandler.setShuffleMode(enable
                              ? AudioServiceShuffleMode.all
                              : AudioServiceShuffleMode.none);
                        },
                      );
                    },
                  ),
                    // LikeButton(
                    //   mediaItem: widget.mediaItem,
                    //   size: 25.0,
                    //   type: widget.type,
                    // ),
                ],
              ),
              Column(
                children: [
                  ControlButtons(audioHandler),
                  // SizedBox(
                  //   height: 10,
                  // ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 6.0),
                  StreamBuilder<AudioServiceRepeatMode>(
                    stream: audioHandler.playbackState
                        .map((state) => state.repeatMode)
                        .distinct(),
                    builder: (context, snapshot) {
                      final repeatMode =
                          snapshot.data ?? AudioServiceRepeatMode.none;
                      const texts = ['None', 'All', 'One'];
                      final icons = [
                        Icon(Icons.repeat_rounded,
                            color: Theme.of(context).disabledColor),
                        const Icon(
                          Icons.repeat_rounded,
                        ),
                        const Icon(
                          Icons.repeat_one_rounded,
                        ),
                      ];
                      const cycleModes = [
                        AudioServiceRepeatMode.none,
                        AudioServiceRepeatMode.all,
                        AudioServiceRepeatMode.one,
                      ];
                      final index = cycleModes.indexOf(repeatMode);
                      return IconButton(
                        icon: icons[index],
                        tooltip: 'Repeat ${texts[(index + 1) % texts.length]}',
                        onPressed: () {
                          Hive.box('settings').put(
                              'repeatMode', texts[(index + 1) % texts.length]);
                          audioHandler.setRepeatMode(cycleModes[
                              (cycleModes.indexOf(repeatMode) + 1) %
                                  cycleModes.length]);
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),

        // Now playing
        GestureDetector(
          onVerticalDragEnd: (_) {
            showModalBottomSheet(
                isDismissible: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return BottomGradientContainer(
                      padding: EdgeInsets.zero,
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0)),
                      child: NowPlayingStream(audioHandler));
                });
          },
          onTap: () {
            showModalBottomSheet(
                isDismissible: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return BottomGradientContainer(
                      padding: EdgeInsets.zero,
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0)),
                      child: NowPlayingStream(audioHandler));
                });
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              SizedBox(height: 5.0),

              Directionality(
                textDirection: TextDirection.rtl,
                child: ListTile(
                  title: Text(
                    "لیست موزیک ها ",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,fontFamily: "IranSANS"
                    ),
                  ),
                  leading: Icon(
                    Icons.playlist_play_outlined,
                    size: 40,
                  ),
                  trailing: Icon(Icons.expand_less_rounded, size: 25),
                ),
              ),
              // Text(
              //   AppLocalizations.of(context)!.nowPlaying,
              //   textAlign: TextAlign.center,
              //   style: const TextStyle(
              //     fontWeight: FontWeight.w600,
              //     fontSize: 18,
              //   ),
              // ),
              SizedBox(height: 5.0),
            ],
          ),
        ),
      ],
    );
  }
}
