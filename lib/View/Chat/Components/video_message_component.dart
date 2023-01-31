
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_9.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Model/chat_messages_model.dart';
import 'video_player_message.dart';


class VideoMessageComponent extends StatefulWidget {
  final bool isMyMessage;
  final bool isColleagueMessage;
  final Message message;
  const VideoMessageComponent({Key? key,required this.isMyMessage,required this.isColleagueMessage,required this.message}) : super(key: key);

  @override
  State<VideoMessageComponent> createState() => _VideoMessageComponentState();
}

class _VideoMessageComponentState extends State<VideoMessageComponent> {
  late VideoPlayerController _videoPlayerController2;
  ChewieController? _chewieController1;
  String idVideo="";

  @override
  void initState() {
    super.initState();


    print(idVideo);
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController2.dispose();
    _chewieController1?.dispose();
    super.dispose();

  }
  Future<void> initializePlayer() async {
    _videoPlayerController2 =
      widget.message.file!=null?  VideoPlayerController.file(widget.message.file!):   VideoPlayerController.network( widget.message.message);
    await Future.wait([
      _videoPlayerController2.initialize(),
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

    _chewieController1 = ChewieController(
      videoPlayerController: _videoPlayerController2,
      autoPlay: false,
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

      showControls: false,
      showOptions: false,
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
    await _videoPlayerController2.pause();
    currPlayIndex = currPlayIndex == 0 ? 1 : 0;
    await initializePlayer();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child:widget. isMyMessage&&widget.isColleagueMessage==false?

        ChatBubble(
          clipper: ChatBubbleClipper9(type: BubbleType.sendBubble),
          alignment: Alignment.topRight,
          backGroundColor: ColorsApp.colorItemChatHost,
          child: GestureDetector(
            onTap: (){
              Get.to(()=>VideoPlayerMessage(file:widget.message.file ,url: widget.message.message,));
            },
            child: Container(
              alignment: Alignment.center,
              height: SizeConfig.screenHeight/5.5,
              width: SizeConfig.screenHeight/3.5,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          alignment: Alignment.center,
                          height: SizeConfig.screenHeight/6.8,
                          width: SizeConfig.screenHeight/3.8,
                          child: _chewieController1 != null &&
                              _chewieController1!
                                  .videoPlayerController.value.isInitialized
                              ? Chewie(
                            controller: _chewieController1!,
                          )
                              : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CircularProgressIndicator(color: ColorsApp.primary,),
                              SizedBox(height: 20),
                              Text('در حال بارگذاری...',style: TextStyle(color: ColorsApp.primary),),
                            ],
                          ),
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Center(
                          child: Image.asset("${ConstAddress.image}play2.png",height: 50,width: 50,color: Colors.white,),
                        ),
                      )

                    ],
                  ),
                  const SizedBox(height: 5,),
                  Wrap(
                    alignment: WrapAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(widget.message.showDate,textDirection: TextDirection.rtl, style:
                        const TextStyle(fontSize: 8 , fontWeight: FontWeight.normal ,
                            color: ColorsApp.colorTextNormal
                            ,fontFamily: "IranSANS"),),
                      ),
                      const SizedBox(width: 5,),
                      widget. message.isView?
                      SvgPicture.asset(
                        "${ConstAddress.icon}doublecheck.svg",
                        color: ColorsApp.primaryLight,
                        matchTextDirection: true,
                        height: 15,
                        width: 15,
                      ):
                      widget.message.isReceive?
                      SvgPicture.asset(
                        "${ConstAddress.icon}doublecheck.svg",
                        color: ColorsApp.iconTextField,
                        matchTextDirection: true,
                        height: 15,
                        width: 15,

                      ):widget.message.isGetServer?
                      SvgPicture.asset(
                        "${ConstAddress.icon}check.svg",
                        color: ColorsApp.iconTextField,
                        matchTextDirection: true,
                        height: 20,
                        width: 20,
                      ):SvgPicture.asset(
                        "${ConstAddress.icon}time.svg",
                        color: ColorsApp.iconTextField,
                        matchTextDirection: true,
                        height: 12,
                        width: 12,
                      ),
                    ],
                  ),


                ],
              ),
            ),
          ),
        )
            :widget.isMyMessage==false&&widget.isColleagueMessage==false?
        ChatBubble(
          clipper: ChatBubbleClipper9(type: BubbleType.receiverBubble),
          alignment: Alignment.topLeft,
          backGroundColor: ColorsApp.colorItemChatGuest,
          child: GestureDetector(
            onTap: (){
              Get.to(()=>VideoPlayerMessage(file:widget.message.file ,url: widget.message.message,));
            },
            child: Container(
              alignment: Alignment.center,
              height: SizeConfig.screenHeight/5.5,
              width: SizeConfig.screenHeight/3.5,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Center(
                          child: Container(
                            alignment: Alignment.center,
                            height: SizeConfig.screenHeight/6.8,
                            width: SizeConfig.screenHeight/3.8,
                            child: _chewieController1 != null &&
                                _chewieController1!
                                    .videoPlayerController.value.isInitialized
                                ? Chewie(
                              controller: _chewieController1!,
                            )
                                : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                CircularProgressIndicator(color: ColorsApp.primary,),
                                SizedBox(height: 20),
                                Text('در حال بارگذاری...',style: TextStyle(color: ColorsApp.primary),),
                              ],
                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Center(
                          child: Image.asset("${ConstAddress.image}play2.png",height: 50,width: 50,color: Colors.white,),
                        ),
                      )

                    ],
                  ),
                  const SizedBox(height: 5,),
                  Wrap(
                    alignment: WrapAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(widget.message.showDate,textDirection: TextDirection.rtl, style:
                        const TextStyle(fontSize: 8 , fontWeight: FontWeight.normal ,
                            color: ColorsApp.colorTextNormal
                            ,fontFamily: "IranSANS"),),
                      ),
                      const SizedBox(width: 5,),
                    ],
                  ),


                ],
              ),
            ),
          ),
        )
        :widget.isMyMessage==false&&widget.isColleagueMessage?
        ChatBubble(
          clipper: ChatBubbleClipper9(type: BubbleType.sendBubble),
          alignment: Alignment.topRight,
          backGroundColor: ColorsApp.colorItemChatHost,
          child: GestureDetector(
            onTap: (){
              Get.to(()=>VideoPlayerMessage(file:widget.message.file ,url: widget.message.message,));
            },
            child: Container(
              alignment: Alignment.center,
              height: SizeConfig.screenHeight/5.5,
              width: SizeConfig.screenHeight/3.5,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Center(
                          child: Container(
                            alignment: Alignment.center,
                            height: SizeConfig.screenHeight/6.8,
                            width: SizeConfig.screenHeight/3.8,
                            child: _chewieController1 != null &&
                                _chewieController1!
                                    .videoPlayerController.value.isInitialized
                                ? Chewie(
                              controller: _chewieController1!,
                            )
                                : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                CircularProgressIndicator(color: ColorsApp.primary,),
                                SizedBox(height: 20),
                                Text('در حال بارگذاری...',style: TextStyle(color: ColorsApp.primary),),
                              ],
                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Center(
                          child: Image.asset("${ConstAddress.image}play2.png",height: 50,width: 50,color: Colors.white,),
                        ),
                      )

                    ],
                  ),
                  const SizedBox(height: 5,),
                  Wrap(
                    alignment: WrapAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(widget.message.showDate,textDirection: TextDirection.rtl, style:
                        const TextStyle(fontSize: 8 , fontWeight: FontWeight.normal ,
                            color: ColorsApp.colorTextNormal
                            ,fontFamily: "IranSANS"),),
                      ),
                      const SizedBox(width: 5,),
                      widget. message.isView?
                      SvgPicture.asset(
                        "${ConstAddress.icon}doublecheck.svg",
                        color: ColorsApp.primaryLight,
                        matchTextDirection: true,
                        height: 15,
                        width: 15,
                      ):
                      widget.message.isReceive?
                      SvgPicture.asset(
                        "${ConstAddress.icon}doublecheck.svg",
                        color: ColorsApp.iconTextField,
                        matchTextDirection: true,
                        height: 15,
                        width: 15,

                      ):widget.message.isGetServer?
                      SvgPicture.asset(
                        "${ConstAddress.icon}check.svg",
                        color: ColorsApp.iconTextField,
                        matchTextDirection: true,
                        height: 20,
                        width: 20,
                      ):SvgPicture.asset(
                        "${ConstAddress.icon}time.svg",
                        color: ColorsApp.iconTextField,
                        matchTextDirection: true,
                        height: 12,
                        width: 12,
                      ),
                    ],
                  ),


                ],
              ),
            ),
          ),
        ):const SizedBox()

    );
  }
}

