import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../Network/service_url.dart';
import '../../../Widget/miniplayer.dart';
import '../../../main.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../../audio_player/Page/player_page.dart';
import '../../test_farahi/controller/courses.dart';

class DetailCoursesMusicPage extends StatefulWidget {
  final int id;
  final String image;
  const DetailCoursesMusicPage({Key? key,required this.id,required this.image}) : super(key: key);

  @override
  State<DetailCoursesMusicPage> createState() => _DetailCoursesMusicPageState();
}

class _DetailCoursesMusicPageState extends State<DetailCoursesMusicPage> {
  var coursesController = Get.put(CoursesController());
  String idVideo="";

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    audioHandler.stop();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return GetX<CoursesController>(
        init: coursesController,
        builder: (coursesController) {
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
                        const SizedBox(height: 40,),
                        Row(
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
                                child: Text(coursesController.myCoursesDetailModel!.course.title,
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
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text("پشتیبانی",
                                    style: TextStyle(color: ColorsApp.black.withOpacity(0.4),fontSize: 14,fontFamily: "robot",fontWeight: FontWeight.bold),),
                                  const  SizedBox(height: 8,),
                                  Container(
                                    height: 2,
                                    width: SizeConfig.screenWidth/3.5,
                                    color: ColorsApp.black.withOpacity(0.2),
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: (){

                                  coursesController.getIndex(false);
                                },
                                child: Column(
                                  children: [
                                    Text("شرح دوره",
                                      style: TextStyle(color: coursesController.index.value?ColorsApp.black.withOpacity(0.8): const Color(0xff0F8845),fontSize: 14,fontFamily: "robot",fontWeight: FontWeight.bold),),
                                    const SizedBox(height: 8,),
                                    Container(
                                      height: 2,
                                      width: SizeConfig.screenWidth/3.5,
                                      color: coursesController.index.value? ColorsApp.black.withOpacity(0.2):const Color(0xff0F8845),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  coursesController.getIndex(true);
                                },
                                child: Column(
                                  children: [
                                    Text("سرفصل ها",
                                      style: TextStyle(color:coursesController.index.value?const Color(0xff0F8845):ColorsApp.black.withOpacity(0.8),fontSize: 14,fontFamily: "robot",fontWeight: FontWeight.bold),),
                                    const SizedBox(height: 8,),
                                    Container(
                                      height: 2,
                                      width: SizeConfig.screenWidth/3.5,
                                      color:coursesController.index.value? const Color(0xff0F8845):ColorsApp.black.withOpacity(0.2),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height:SizeConfig.screenHeight/2.1,
                          width:SizeConfig.screenWidth,
                          child: ListView(
                            children: [
                              const SizedBox(height: 0,),
                              coursesController.index.value?
                              AnimatedOpacity(
                                curve: Curves.fastOutSlowIn,
                                duration: const Duration(milliseconds: 3000),
                                opacity:coursesController.index.value? 1:0,
                                child: Directionality(textDirection: TextDirection.rtl,
                                  child:  Column(
                                    children: coursesController.listMyCoursesDetail.map((element) =>
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(

                                              width:SizeConfig.screenWidth/1.3,
                                              margin: const EdgeInsets.only( right: 10,top: 10),
                                              decoration:  const BoxDecoration(
                                                color: Color(0xffF9F9F9),
                                                borderRadius:BorderRadius.all(Radius.circular(20)),
                                                //border: Border.all(width: 1,color: Colors.grey.withOpacity(0.4))
                                              ),
                                              child: ExpansionTile(
                                                  collapsedIconColor: Colors.black,
                                                  iconColor: Colors.black,
                                                  title: Text(element.title, style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 14,
                                                      color:Colors.black,
                                                      fontFamily: "robot")),
                                                  children: element.sessions.map((e) =>
                                                      SizedBox(
                                                        height: 50,
                                                        child: ListTile(
                                                          title: Row(
                                                            children: [
                                                              e.videoId==idVideo? Image.asset("${ConstAddress.image}pause.png",color: Colors.red,height: 15,width: 15,):
                                                              e.isLock?Image.asset("${ConstAddress.image}lock.png",height: 15,width: 15,color: Colors.grey,):e.hasView?
                                                              Image.asset("${ConstAddress.image}play.png",color: Color(0xff0F8845),height: 15,width: 15,):
                                                              Image.asset("${ConstAddress.image}play.png",color: Colors.black,height: 15,width: 15,),
                                                              const SizedBox(width: 10,),
                                                              Container(
                                                                width: SizeConfig.screenWidth/2,
                                                                child: Text(e.title, style:  TextStyle(
                                                                    fontWeight: FontWeight.normal,
                                                                    fontSize:13,color:e.isLock?  Colors.black.withOpacity(0.4):Colors.black.withOpacity(0.9),
                                                                    fontFamily: "robot"),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                                              ),
                                                            ],
                                                          ),
                                                          trailing: Text("${Duration(seconds: e.secounds).inMinutes.remainder(60).toString()}:${(Duration(seconds: e.secounds).inSeconds.remainder(60) % 60).toString().padLeft(2, '0')}", style:  TextStyle(
                                                              fontWeight: FontWeight.normal,
                                                              fontSize: 11,color:e.isLock?  ColorsApp.black.withOpacity(0.4):ColorsApp.black.withOpacity(0.9),
                                                              fontFamily: "robot")),
                                                          onTap: (){

                                                          },
                                                        ),
                                                      ),).toList()

                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: (){
                                                audioHandler.stop();
                                                for (int i = 0; i < element.sessions.length; i++) {
                                                  audioHandler.updateQueue([
                                                    MediaItem(
                                                        id: element.sessions[i].videoId,
                                                        album: element.sessions[i].title,
                                                        title: element.sessions[i].title,
                                                        artist: element.sessions[i].title,
                                                        duration:  Duration(seconds: element.sessions[i].secounds),
                                                        artUri: Uri.parse(
                                                            ServiceURL.baseUrl +  widget.image),

                                                        extras: {"url":"${ServiceURL.baseUrlVideo+element.sessions[i].videoId}.mp3",
                                                          "token":"Bearer ${coursesController.token.value}","lyric":element.sessions[i].text}
                                                    ),

                                                  ]);



                                                }
                                                audioHandler.skipToQueueItem(0);
                                                audioHandler.seek(Duration(seconds: 0));
                                                audioHandler.play();
                                                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                                    PlayerPage(),));
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 20),
                                                child: Image.asset("${ConstAddress.image}play.png",color: Color(0xff0F8845),height: 30,width: 30,),
                                              ),
                                            ),

                                          ],
                                        ),).toList(),
                                  ),),
                              ):
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 30),
                                  child: Text(coursesController.myCoursesDetailModel!.descript,style: TextStyle(color: ColorsApp.black.withOpacity(0.8),fontSize: 14,fontFamily: "robot",fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.start,softWrap: true

                                  ),),
                              ),

                            ],
                          ),
                        )




                      ],
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: MiniPlayer()),
              ],
            ),
          );

        });


  }
}

