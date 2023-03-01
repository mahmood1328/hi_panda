import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../Network/service_url.dart';
import '../../../Widget/gradient_containers.dart';
import '../../../main.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../../audio_player/Page/player_page.dart';
import '../../test_farahi/controller/courses.dart';
import '../Model/get_pdf_book_details_model.dart';

class DetailCoursesBookAndPdfPage extends StatefulWidget {
  final GetBookAndPdfDetailModel getBookAndPdfDetailModel;
  final String image;
  const DetailCoursesBookAndPdfPage({Key? key,required this.getBookAndPdfDetailModel,required this.image}) : super(key: key);

  @override
  State<DetailCoursesBookAndPdfPage> createState() => _DetailCoursesBookAndPdfPageState();
}

class _DetailCoursesBookAndPdfPageState extends State<DetailCoursesBookAndPdfPage> {
  var coursesController = Get.put(CoursesController());

  @override
  void initState() {
    super.initState();

    if(widget.getBookAndPdfDetailModel.url!=""){
      audioHandler.stop();
      audioHandler.updateQueue([
        MediaItem(
            id: widget.getBookAndPdfDetailModel.url,
            album: "",
            title: widget.getBookAndPdfDetailModel.title,
            artist: "Hi Panda",
            duration:  Duration(seconds: widget.getBookAndPdfDetailModel.duration),
            artUri: Uri.parse(
                ServiceURL.baseUrl +  widget.image),

            extras: {"url":"${ServiceURL.baseUrl2+widget.getBookAndPdfDetailModel.url}",
              "token":"Bearer ${coursesController.token.value}","lyric":widget.getBookAndPdfDetailModel.abstract}
        ),

      ]);


      audioHandler.skipToQueueItem(0);
      audioHandler.seek(Duration(seconds: 0));
      audioHandler.play();
      // Navigator.push(context, MaterialPageRoute(builder: (context) =>
      //     PlayerPage(),));
    }


  }

  @override
  void dispose() {
    audioHandler.stop();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: Stack(
        children: [
          SizedBox(
            height:SizeConfig.screenHeight,
            width:SizeConfig.screenWidth,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  Row                                                                                                                                                                                                                          (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 20,bottom: 20,top: 10),
                          height: 25,
                          width: 25,
                          child: SvgPicture.asset(
                            "${ConstAddress.icon}arrowLeft.svg",color: ColorsApp.black,
                          ),
                        ),
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20,bottom: 20,top: 10),
                          child: Text(widget.getBookAndPdfDetailModel.title,
                            style:const TextStyle(color: ColorsApp.black,fontSize: 18,fontFamily: "robot",fontWeight: FontWeight.bold),),
                        ),
                      ),

                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 0,bottom: 20),
                    height: SizeConfig.screenHeight/3.1,
                    child:  ClipRect(
                        child: Image.network(ServiceURL.baseUrl +  widget.image,fit: BoxFit.fill,)),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Html(
                        data: widget.getBookAndPdfDetailModel.descript,
                        tagsList: Html.tags..addAll(["bird", "flutter"]),
                        style: {
                          "body": Style(
                              textAlign: TextAlign.justify,fontFamily: "robot",color: Colors.black,
                          ),
                          "tr": Style(textAlign: TextAlign.justify,
                            border:const Border(bottom: BorderSide(color: Colors.black,)),
                          ),
                          "th": Style(
                            padding:const EdgeInsets.all(6),textAlign: TextAlign.justify,fontFamily: "robot",
                            backgroundColor: Colors.black,
                          ),
                          "td": Style(
                            padding:const EdgeInsets.all(6),textAlign: TextAlign.justify,fontFamily: "robot",
                            alignment: Alignment.topLeft,
                          ),
                          'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis
                              ,textAlign: TextAlign.justify,fontFamily: "robot"),
                        },
                      ),
                    ),
                  ),
                  // Container(
                  //   height: 200,
                  //   width: 200,
                  //   child: SfPdfViewer.network(
                  //     filePath:ServiceURL.baseUrl2 +  widget.getBookAndPdfDetailModel.pdfUrl!,
                  //     enableSwipe: true,
                  //     swipeHorizontal: true,
                  //     autoSpacing: false,
                  //     pageFling: false,
                  //     onRender: (_pages) {
                  //     },
                  //     onError: (error) {
                  //       print(error.toString());
                  //     },
                  //     onPageError: (page, error) {
                  //       print('$page: ${error.toString()}');
                  //     },
                  //     // onViewCreated: (PDFViewController pdfViewController) {
                  //     //   _controller.complete(pdfViewController);
                  //     // },
                  //   ),
                  // ),
                  const SizedBox(height: 40,),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: StreamBuilder<PlaybackState>(
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
                        return ValueListenableBuilder(
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
                                          // subtitle: Text(
                                          //   mediaItem.artist ?? '',
                                          //   maxLines: 1,
                                          //   overflow: TextOverflow.ellipsis,
                                          // ),
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
                            });
                      });
                }),
          )
        ],
      ),
    );


  }
}

