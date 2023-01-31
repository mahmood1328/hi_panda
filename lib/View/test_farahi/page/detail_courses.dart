  import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../Network/service_url.dart';
import '../../../Widget/snackbar.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/res/dimensions.dart';
import '../../../utils/size_config.dart';
import '../../test_farahi/controller/courses.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailCoursesPage extends StatefulWidget {
  final int id;
  final bool isBuy;
  const DetailCoursesPage({Key? key, required this.id, required this.isBuy})
      : super(key: key);

  @override
  State<DetailCoursesPage> createState() => _DetailCoursesPageState();
}

class _DetailCoursesPageState extends State<DetailCoursesPage> {
  late VideoPlayerController _videoPlayerController1;
  ChewieController? _chewieController;
  var coursesController = Get.put(CoursesController());
  String idVideo = "";

  @override
  void initState() {
    super.initState();

    setState(() {
      idVideo = widget.isBuy == false
          ? ""
          : coursesController.listMyCoursesDetail[0].sessions[0].newVideoUrl;
    });
    print("${ServiceURL.baseUrlVideo}$idVideo");
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
    _videoPlayerController1 = widget.isBuy == false
        ? VideoPlayerController.network(
            "${ServiceURL.baseUrl}${coursesController.myCoursesDetailModel!.course.videoUrl}")
        : VideoPlayerController.network(
            "${ServiceURL.baseUrlVideo}$idVideo",
            httpHeaders: {
                "Authorization": "bearer ${coursesController.token}"
              });
    await Future.wait([
      _videoPlayerController1.initialize(),
    ]);
    _createChewieController();
    setState(() {});
  }

  Future<void> initializePlayer2() async {
    _videoPlayerController1 = VideoPlayerController.network(
        "${ServiceURL.baseUrlVideo}$idVideo.m3u8",
        httpHeaders: {"Authorization": "bearer ${coursesController.token}"});
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
    return GetX<CoursesController>(
        init: coursesController,
        builder: (coursesController) {
          return Scaffold(
            backgroundColor: ColorsApp.white,
            body: SizedBox(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          height: 100,
                          width: SizeConfig.screenWidth,
                          decoration: const BoxDecoration(
                            color: ColorsApp.primary,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0)),
                            //border: Border.all(width: 1,color: ColorsApp.primaryLight.withOpacity(0.3))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, bottom: 20, top: 10),
                                  height: 25,
                                  width: 25,
                                  child: SvgPicture.asset(
                                    "${ConstAddress.icon}arrowLeft.svg",
                                    color: ColorsApp.white,
                                  ),
                                ),
                              ),
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20, bottom: 20, top: 10),
                                  child: Text(
                                    coursesController
                                        .myCoursesDetailModel!.course.title,
                                    style: const TextStyle(
                                        color: ColorsApp.white,
                                        fontSize: 18,
                                        fontFamily: "IranSANS",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 0, bottom: 20),
                          height: SizeConfig.screenHeight / 3.4,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "نظرات",
                                    style: TextStyle(
                                        color: ColorsApp.black.withOpacity(0.2),
                                        fontSize: 14,
                                        fontFamily: "IranSANS",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    height: 2,
                                    width: SizeConfig.screenWidth / 3.4,
                                    color: ColorsApp.black.withOpacity(0.2),
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  coursesController.getIndex(false);
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      "شرح دوره",
                                      style: TextStyle(
                                          color: coursesController.index.value
                                              ? ColorsApp.black.withOpacity(0.8)
                                              : ColorsApp.primary,
                                          fontSize: 14,
                                          fontFamily: "IranSANS",
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      height: 2,
                                      width: SizeConfig.screenWidth / 3.4,
                                      color: coursesController.index.value
                                          ? ColorsApp.black.withOpacity(0.2)
                                          : ColorsApp.primary,
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  coursesController.getIndex(true);
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      "سرفصل ها",
                                      style: TextStyle(
                                          color: coursesController.index.value
                                              ? ColorsApp.primary
                                              : ColorsApp.black
                                                  .withOpacity(0.8),
                                          fontSize: 14,
                                          fontFamily: "IranSANS",
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      height: 2,
                                      width: SizeConfig.screenWidth / 3.5,
                                      color: coursesController.index.value
                                          ? ColorsApp.primary
                                          : ColorsApp.black.withOpacity(0.2),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight / 2,
                          width: SizeConfig.screenWidth,
                          child: ListView(
                            children: [
                              const SizedBox(
                                height: 0,
                              ),
                              coursesController.index.value
                                  ? AnimatedOpacity(
                                      curve: Curves.fastOutSlowIn,
                                      duration:
                                          const Duration(milliseconds: 3000),
                                      opacity:
                                          coursesController.index.value ? 1 : 0,
                                      child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Column(
                                          children:
                                              coursesController
                                                  .listMyCoursesDetail
                                                  .map(
                                                    (element) => Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 25,
                                                              right: 25,
                                                              bottom: 10),
                                                      decoration:
                                                          const BoxDecoration(
                                                        color:
                                                            Color(0xffF9F9F9),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)),
                                                        //border: Border.all(width: 1,color: Colors.grey.withOpacity(0.4))
                                                      ),
                                                      child: ExpansionTile(
                                                          key: Key(coursesController
                                                              .listMyCoursesDetail[
                                                                  0]
                                                              .title),
                                                          initiallyExpanded: element
                                                                  .title ==
                                                              coursesController
                                                                  .listMyCoursesDetail[
                                                                      0]
                                                                  .title,
                                                          collapsedIconColor:
                                                              Colors.black,
                                                          iconColor:
                                                              Colors.black,
                                                          title: Text(
                                                              element.title,
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .black,
                                                                  fontFamily:
                                                                      "IranSANS")),
        //https://kingmohtava.ir/Files/Tolid%20Mohtava/music/%DA%86%D8%A7%D9%84%D8%B4%20%D9%86%D8%A7%D8%AE%D9%86%20%D8%B3%D9%88%D9%87%D8%A7%D9%86.mp3

                                                          children:
                                                              element.sessions
                                                                  .map(
                                                                    (e) =>
                                                                        SizedBox(
                                                                      height:
                                                                          45,
                                                                      child:
                                                                          ListTile(
                                                                            minLeadingWidth: 10,
                                                                        leading:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(top: 0),
                                                                          child: GestureDetector(
                                                                              onTap: () {
                                                                                if (e.attachmentUrl != null) {
                                                                                  launch( "${ServiceURL.baseUrl2}${e.attachmentUrl!}");
                                                                                }
                                                                              },
                                                                              child:e.attachmentUrl != null && e.attachmentUrl != ""
                                                                                  ? Container(
                                                                                padding:const EdgeInsets.all(3),
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius:const BorderRadius.all(Radius.circular(15)),
                                                                                    border: Border.all(width: 1.5,color: ColorsApp.green)
                                                                                  ),
                                                                                  child: const Icon(Icons.attach_file,color: ColorsApp.green,size: 15,))
                                                                                  : const SizedBox(
                                                                                      width: 0,
                                                                                    )),
                                                                        ),
                                                                        title:
                                                                            Row(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(top: 4),
                                                                              child: e.videoId == idVideo
                                                                                  ? Image.asset(
                                                                                      "${ConstAddress.image}pause.png",
                                                                                      color: Colors.red,
                                                                                      height: 15,
                                                                                      width: 15,
                                                                                    )
                                                                                  : e.isLock
                                                                                      ? Image.asset(
                                                                                          "${ConstAddress.image}lock.png",
                                                                                          height: 15,
                                                                                          width: 15,
                                                                                          color: Colors.grey,
                                                                                        )
                                                                                      : e.hasView
                                                                                          ? Image.asset(
                                                                                              "${ConstAddress.image}play.png",
                                                                                              color: Color(0xff0F8845),
                                                                                              height: 15,
                                                                                              width: 15,
                                                                                            )
                                                                                          : Image.asset(
                                                                                              "${ConstAddress.image}play.png",
                                                                                              color: Colors.black,
                                                                                              height: 15,
                                                                                              width: 15,
                                                                                            ),
                                                                            ),
                                                                            const SizedBox(
                                                                              width: 10,
                                                                            ),
                                                                            SizedBox(
                                                                              width: SizeConfig.screenWidth / 2,
                                                                              child: Wrap(
                                                                                children: [
                                                                                  GestureDetector(
                                                                                    onTap: () {
                                                                                      if (e.isLock) {
                                                                                        ShowSnackBar().showSnackBar(
                                                                                          context,
                                                                                          "اقساط مربوط به این بخش پرداخت نشده",
                                                                                          duration: const Duration(seconds: 7),
                                                                                        );
                                                                                      } else {
                                                                                        _videoPlayerController1.dispose();
                                                                                        _chewieController?.dispose();
                                                                                        setState(() {
                                                                                          idVideo = e.videoId;
                                                                                          print(idVideo);
                                                                                          coursesController.getIndexVal(false);
                                                                                          //initializePlayer();
                                                                                        });
                                                                                        initializePlayer2();
                                                                                      }
                                                                                    },
                                                                                    child: Text(
                                                                                      e.title,
                                                                                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13, color: e.isLock ? Colors.black.withOpacity(0.4) : Colors.black.withOpacity(0.9), fontFamily: "IranSANS"),
                                                                                      maxLines: 2,
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        trailing: Text(
                                                                            "${Duration(seconds: e.secounds).inMinutes.remainder(60).toString()}:${(Duration(seconds: e.secounds).inSeconds.remainder(60) % 60).toString().padLeft(2, '0')}",
                                                                            style: TextStyle(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontSize: 11,
                                                                                color: e.isLock ? ColorsApp.colorTextNormal : ColorsApp.primaryTextColor,
                                                                                fontFamily: "IranSANS")),
                                                                      ),
                                                                    ),
                                                                  )
                                                                  .toList()),
                                                    ),
                                                  )
                                                  .toList(),
                                        ),
                                      ),
                                    )
                                  : Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: Text(
                                          coursesController
                                              .myCoursesDetailModel!.descript,
                                          style: const TextStyle(
                                              color: ColorsApp.colorTextNormal,
                                              fontSize: 13,
                                              fontFamily: "IranSANS",
                                              fontWeight: FontWeight.normal),
                                          textAlign: TextAlign.justify,
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  widget.isBuy
                      ? Container()
                      : Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: SizeConfig.screenHeight / 8,
                            width: SizeConfig.screenWidth,
                            decoration: BoxDecoration(
                                color: ColorsApp.white,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5)),
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorsApp.textColorSub
                                          .withOpacity(0.7),
                                      blurRadius: 30)
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 0, left: 0, right: 0),
                                  child: Center(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          minimumSize:
                                              MaterialStateProperty.all(Size(
                                                  SizeConfig.screenHeight / 6,
                                                  50)),
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  ColorsApp.primary),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  ColorsApp.primary),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(
                                                      Dimensions.borderRadiusComponents),
                                                  side: const BorderSide(color: ColorsApp.primary)))),
                                      onPressed: () {
                                        launch(coursesController
                                            .myCoursesDetailModel!.course.link);
                                      },
                                      child: const Text(
                                        "خرید",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: "IranSANS",
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            coursesController
                                                        .myCoursesDetailModel!
                                                        .course
                                                        .price ==
                                                    coursesController
                                                        .myCoursesDetailModel!
                                                        .course
                                                        .totalPrice
                                                ? ""
                                                : "تومان",
                                            style: const TextStyle(
                                                color: ColorsApp.red,
                                                fontSize: 18,
                                                fontFamily: "IranSANS",
                                                fontWeight: FontWeight.normal,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            coursesController
                                                        .myCoursesDetailModel!
                                                        .course
                                                        .price ==
                                                    coursesController
                                                        .myCoursesDetailModel!
                                                        .course
                                                        .totalPrice
                                                ? ""
                                                : coursesController
                                                    .myCoursesDetailModel!
                                                    .course
                                                    .price,
                                            style: const TextStyle(
                                                color: ColorsApp.red,
                                                fontSize: 18,
                                                fontFamily: "IranSANS",
                                                fontWeight: FontWeight.normal,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            coursesController
                                                        .myCoursesDetailModel!
                                                        .course
                                                        .totalPrice ==
                                                    "رایگان"
                                                ? ""
                                                : "تومان",
                                            style: const TextStyle(
                                                color: ColorsApp.black,
                                                fontSize: 22,
                                                fontFamily: "IranSANS",
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            coursesController
                                                .myCoursesDetailModel!
                                                .course
                                                .totalPrice,
                                            style: const TextStyle(
                                                color: ColorsApp.black,
                                                fontSize: 22,
                                                fontFamily: "IranSANS",
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                ],
              ),
            ),
          );
        });
  }
}
