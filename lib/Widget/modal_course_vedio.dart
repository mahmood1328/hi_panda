import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:video_player/video_player.dart';
import '../Network/service_url.dart';
import '../View/Verify/Controller/verify_controller.dart';
import '../utils/res/colors.dart';
import '../utils/size_config.dart';

class ModalCourseVideo extends StatefulWidget {
  final String url;
  const ModalCourseVideo({Key? key,required this.url}) : super(key: key);


  @override
  _ModalCourseVideoState createState() => _ModalCourseVideoState();

}

class _ModalCourseVideoState extends State<ModalCourseVideo> {
  var box=GetStorage();
  late VideoPlayerController _videoPlayerController1;
  ChewieController? _chewieController;
  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
  Future<void> initializePlayer() async {
    print("https://hipanda.ir${widget.url}");
    String token = await box.read("tokenn");
    _videoPlayerController1 = VideoPlayerController.network(
       "https://hipanda.ir${widget.url}",httpHeaders: {
      "Authorization": "bearer $token"
    });
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
      aspectRatio: 16 / 9,
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

      showControls: true,
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
    return Material(
        color: ColorsApp.white,
        child: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 0, bottom: 0),
                height: SizeConfig.screenHeight-40,
                child: Center(
                  child: _chewieController != null &&
                      _chewieController!.videoPlayerController
                          .value.isInitialized
                      ? Chewie(
                    controller: _chewieController!,
                  )
                      : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(
                        color: ColorsApp.primary,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'در حال بارگذاری...',
                        style:
                        TextStyle(color: ColorsApp.primary),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }


}
