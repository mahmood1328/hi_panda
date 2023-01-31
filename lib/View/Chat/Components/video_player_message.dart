import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

import '../../../Network/service_url.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Model/chat_messages_model.dart';


class VideoPlayerMessage extends StatefulWidget {
  final File? file;
  final String? url;
  const VideoPlayerMessage({Key? key,this.file,this.url}) : super(key: key);

  @override
  State<VideoPlayerMessage> createState() => _VideoPlayerMessageState();
}

class _VideoPlayerMessageState extends State<VideoPlayerMessage> {
  late VideoPlayerController _videoPlayerController1;
  ChewieController? _chewieController;
  String idVideo="";

  @override
  void initState() {
    super.initState();


    print(idVideo);
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController?.dispose();
    super.dispose();

  }
  Future<void> initializePlayer() async {
    _videoPlayerController1 =
      widget.url==""?  VideoPlayerController.file(widget.file!):   VideoPlayerController.network( widget.url!);
    await Future.wait([
      _videoPlayerController1.initialize(),
    ]);
    _createChewieController();
    setState(() {});
  }
  void _createChewieController() {
    final subtitles = [
      Subtitle(
        index: 0,
        start: const Duration(seconds: 10),
        end: const Duration(seconds: 20),
        text: 'Whats up? :)',
        // text: const TextSpan(
        //   text: 'Whats up? :)',
        //   style: TextStyle(color: Colors.amber, fontSize: 22, fontStyle: FontStyle.italic),
        // ),
      ),
    ];

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      fullScreenByDefault: true,
      looping: false,
      additionalOptions: (context) {
        return <OptionItem>[
          OptionItem(
            onTap: toggleVideo,
            iconData: Icons.live_tv_sharp,
            title: 'Toggle Video Src',
          ),
        ];
      },
      // subtitle: Subtitles(subtitles),
      subtitleBuilder: (context, dynamic subtitle) => Container(
        padding: const EdgeInsets.all(10.0),
        child: subtitle is InlineSpan
            ? RichText(
          text: subtitle,
        )
            : Text(
          subtitle.toString(),
          style: const TextStyle(color: Colors.black),
        ),
      ),

      // Try playing around with some of these other options:

      useRootNavigator: true,
      showControls: true,
      showOptions: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: ColorsApp.primary,
        handleColor: ColorsApp.primaryLight2,
        backgroundColor: Colors.grey,
        bufferedColor: ColorsApp.primaryLight,
      ),
      placeholder: Container(
        color: Colors.grey,
      ),
      autoInitialize: true,
    );
  }

  int currPlayIndex = 0;

  Future<void> toggleVideo() async {
    await _videoPlayerController1.pause();
    currPlayIndex = currPlayIndex == 0 ? 1 : 0;
    await initializePlayer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 5),
        child:Center(
          child: _chewieController != null &&
              _chewieController!
                  .videoPlayerController.value.isInitialized
              ? Chewie(
            controller: _chewieController!,
          )
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(color: ColorsApp.primary,),
              SizedBox(height: 20),
              Text('در حال بارگذاری...',style: TextStyle(color: ColorsApp.primary),),
            ],
          ),
        ),

      ),
    );
  }
}

