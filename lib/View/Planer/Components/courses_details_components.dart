import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Controller/planner_controller.dart';

class CourseDetailsComponents extends StatelessWidget {
  const CourseDetailsComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var plannerController = Get.put(PlannerController());
    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: ColorsApp.primary,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                padding: const EdgeInsets.only(
                    top: 30, left: 20, right: 15, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: SvgPicture.asset(
                          "${ConstAddress.icon}arrowLeft.svg",
                          color: ColorsApp.white,
                        ),
                      ),
                    ),
                    Text(
                      plannerController.plannerSessionItemsModel!
                          .plannerSessionItemsModelPart.title,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ColorsApp.white,
                          fontFamily: "IranSANS"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: plannerController.plannerSessionItemsModel!.partItems
                    .map(
                      (e) => SizedBox(
                        height: SizeConfig.screenHeight / 7,
                        width: SizeConfig.screenWidth,
                        child: Stack(
                          children: [
                            Card(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              color: ColorsApp.white,
                              surfaceTintColor: Colors.grey,
                              elevation: 3,
                              shadowColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                //side: BorderSide(color: ColorsApp.textUnSelected.withOpacity(0.5),width: 1)
                              ),
                              semanticContainer: true,
                              clipBehavior: Clip.hardEdge,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 5,
                                            bottom: 5),
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(5)),
                                            border: Border.all(
                                                color: ColorsApp.primaryLight,
                                                width: 1),
                                            color: ColorsApp.white),
                                        child: Row(
                                          children: [
                                            Text(
                                              e.typeValue,
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorsApp.primaryLight
                                                      .withOpacity(0.5),
                                                  fontFamily: "IranSANS"),
                                            ),
                                            // Icon(
                                            //   e.typeValue=="ویدیو" ?  Icons.video_camera_back:,size: 18,
                                            //   color: ColorsApp.primaryLight.withOpacity(0.5),
                                            // ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerRight,
                                        width: SizeConfig.screenWidth / 1.4,
                                        height: 30,
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Wrap(
                                          alignment: WrapAlignment.end,
                                          children: [
                                            Text(
                                              "${e.title} ",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorsApp.colorTextT1
                                                      .withOpacity(0.5),
                                                  fontFamily: "IranSANS"),
                                              maxLines: 3,
                                              textDirection: TextDirection.rtl,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 30, left: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        e.isView
                                            ? IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.check_box,
                                                  color: ColorsApp.primary,
                                                  size: 27,
                                                ))
                                            : IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.check_box_outline_blank,
                                                  color: ColorsApp.textColorSub,
                                                  size: 27,
                                                )),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                              minimumSize: MaterialStateProperty.all(Size(
                                                  SizeConfig.screenHeight / 3.5,
                                                  30)),
                                              foregroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      ColorsApp.primary),
                                              backgroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      ColorsApp.primary),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5),
                                                      side: const BorderSide(color: ColorsApp.primary)))),
                                          onPressed: () {
                                           plannerController.plannerSessionItemDetail(context,e.id,e.type,);
                                          },
                                          child: const Text(
                                            "شروع / ادامه",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: "IranSANS",
                                                color: ColorsApp.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showCupertinoModalBottomSheet(
                                    expand: true,
                                    context: context,
                                    useRootNavigator: true,
                                    backgroundColor: ColorsApp.white,
                                    builder: (BuildContext context) => Material(
                                        color: ColorsApp.white,
                                        child: SizedBox(
                                          height: SizeConfig.screenHeight,
                                          width: SizeConfig.screenWidth,
                                          child: Stack(
                                            children: [
                                              SizedBox(
                                                height: SizeConfig.screenHeight,
                                                width: SizeConfig.screenWidth,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      const SizedBox(
                                                        height: 30,
                                                      ),
                                                      Text(
                                                        ": توضیحات",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: ColorsApp
                                                                .black
                                                                .withOpacity(
                                                                    0.5),
                                                            fontFamily:
                                                                "IranSANS"),
                                                      ),
                                                      const SizedBox(
                                                        height: 30,
                                                      ),
                                                      Text(
                                                        "${e.descript} ",
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: ColorsApp
                                                                .black
                                                                .withOpacity(
                                                                    0.5),
                                                            fontFamily:
                                                                "IranSANS"),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )));
                              },
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 2),
                                  margin: const EdgeInsets.only(left: 25),
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      color: Colors.red),
                                  child: const Text(
                                    "توضیحات ",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: ColorsApp.white,
                                        fontFamily: "IranSANS"),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              )
              // SizedBox(
              //   height: SizeConfig.screenHeight / 7.5,
              //   width: SizeConfig.screenWidth,
              //   child: Card(
              //     margin:
              //         const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              //     color: ColorsApp.white,
              //     surfaceTintColor: Colors.grey,
              //     elevation: 3,
              //     shadowColor: Colors.grey,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10),
              //       //side: BorderSide(color: ColorsApp.textUnSelected.withOpacity(0.5),width: 1)
              //     ),
              //     semanticContainer: true,
              //     clipBehavior: Clip.hardEdge,
              //     child: Column(
              //       children: [
              //         Row(
              //           children: [
              //             Container(
              //               padding: const EdgeInsets.only(
              //                   left: 10, right: 10, top: 5, bottom: 5),
              //               margin: const EdgeInsets.only(left: 10, top: 10),
              //               decoration:  BoxDecoration(
              //                   borderRadius:
              //                   const  BorderRadius.all(Radius.circular(5)),
              //                   border: Border.all(color: ColorsApp.primaryLight,width: 1),
              //                   color: ColorsApp.white),
              //               child: Row(
              //                 children: [
              //                   Text(
              //                     "ویدیو ",
              //                     style: TextStyle(
              //                         fontSize: 11,
              //                         fontWeight: FontWeight.w600,
              //                         color: ColorsApp.primaryLight
              //                             .withOpacity(0.5),
              //                         fontFamily: "IranSANS"),
              //                   ),
              //                   Icon(
              //                     Icons.video_camera_back,size: 18,
              //                     color: ColorsApp.primaryLight.withOpacity(0.5),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(right: 10),
              //               child: Text(
              //                 "قسمت اول ",
              //                 style: TextStyle(
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.w600,
              //                     color: ColorsApp.colorTextT1.withOpacity(0.5),
              //                     fontFamily: "IranSANS"),
              //               ),
              //             ),
              //           ],
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         ),
              //         Padding(
              //           padding:  const EdgeInsets.only(top: 0,left: 40,right: 40),
              //           child: Center(
              //             child: ElevatedButton(
              //
              //               style: ButtonStyle(
              //                   minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenHeight/1.5, 30)),
              //                   foregroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
              //                   backgroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
              //                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //                       RoundedRectangleBorder(
              //                           borderRadius: BorderRadius.circular(5),
              //                           side: const BorderSide(color:ColorsApp.primary)
              //                       )
              //                   )
              //               ),
              //
              //               onPressed: () {
              //
              //                 showCupertinoModalBottomSheet(
              //                     expand: false,
              //                     context: context,
              //                     useRootNavigator: true,
              //                     backgroundColor: ColorsApp.white,
              //                     builder: (BuildContext context) =>
              //
              //                     const ModalCourseVideo());
              //
              //
              //               },
              //               child: const Text(
              //                 "شروع / ادامه",
              //                 style: TextStyle(
              //                     fontSize: 13,
              //                     fontWeight: FontWeight.normal,fontFamily: "IranSANS",
              //                     color: ColorsApp.white),
              //                 textAlign: TextAlign.center,
              //               ),),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: SizeConfig.screenHeight / 7.5,
              //   width: SizeConfig.screenWidth,
              //   child: Card(
              //     margin:
              //     const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              //     color: ColorsApp.white,
              //     elevation: 3,
              //     surfaceTintColor: Colors.grey,
              //     shadowColor: Colors.grey,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10),
              //       //side: BorderSide(color: ColorsApp.textUnSelected.withOpacity(0.5),width: 1)
              //     ),
              //     semanticContainer: true,
              //     clipBehavior: Clip.hardEdge,
              //     child: Column(
              //       children: [
              //         Row(
              //           children: [
              //             Container(
              //               padding: const EdgeInsets.only(
              //                   left: 10, right: 10, top: 5, bottom: 5),
              //               margin: const EdgeInsets.only(left: 10, top: 10),
              //               decoration:  BoxDecoration(
              //                   borderRadius:
              //                   const  BorderRadius.all(Radius.circular(5)),
              //                   border: Border.all(color: ColorsApp.primaryLight,width: 1),
              //                   color: ColorsApp.white),
              //               child: Row(
              //                 children: [
              //                   Text(
              //                     "صوتی ",
              //                     style: TextStyle(
              //                         fontSize: 11,
              //                         fontWeight: FontWeight.w600,
              //                         color: ColorsApp.primaryLight
              //                             .withOpacity(0.5),
              //                         fontFamily: "IranSANS"),
              //                   ),
              //                   Icon(
              //                     Icons.audiotrack,size: 18,
              //                     color: ColorsApp.primaryLight.withOpacity(0.5),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(right: 10),
              //               child: Text(
              //                 "قسمت اول ",
              //                 style: TextStyle(
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.w600,
              //                     color: ColorsApp.colorTextT1.withOpacity(0.5),
              //                     fontFamily: "IranSANS"),
              //               ),
              //             ),
              //           ],
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         ),
              //         Padding(
              //           padding:  const EdgeInsets.only(top: 0,left: 40,right: 40),
              //           child: Center(
              //             child: ElevatedButton(
              //
              //               style: ButtonStyle(
              //                   minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenHeight/1.5, 30)),
              //                   foregroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
              //                   backgroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
              //                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //                       RoundedRectangleBorder(
              //                           borderRadius: BorderRadius.circular(5),
              //                           side: const BorderSide(color:ColorsApp.primary)
              //                       )
              //                   )
              //               ),
              //
              //               onPressed: () {
              //
              //                 audioHandler.stop();
              //                   audioHandler.updateQueue([
              //                     MediaItem(
              //                         id: "1",
              //                         album: "Album",
              //                         title: "Title",
              //                         artist: "Artist",
              //                         duration:  Duration(seconds: 4000),
              //                         artUri: Uri.parse(
              //                             "https://music-fa.com/wp-content/uploads/2022/12/Majid-Ahmadi-Arazel-Bome-Music-fa.com_.jpg"),
              //
              //                         extras: {
              //                           "url": "https://ups.music-fa.com/tagdl/8e401/Majid Ahmadi - Zibaye Man (320).mp3",
              //                            "token":"Bearer ","lyric":""
              //                         }
              //                     ),
              //
              //                   ]);
              //
              //
              //
              //
              //                 audioHandler.skipToQueueItem(0);
              //                 audioHandler.seek(Duration(seconds: 0));
              //                 audioHandler.play();
              //                 showCupertinoModalBottomSheet(
              //                     expand: false,
              //                     context: context,
              //                     useRootNavigator: true,
              //                     backgroundColor: ColorsApp.white,
              //                     builder: (BuildContext context) =>
              //
              //                     const ModalCourseAudio());
              //               },
              //               child: const Text(
              //                 "شروع / ادامه",
              //                 style: TextStyle(
              //                     fontSize: 13,
              //                     fontWeight: FontWeight.normal,fontFamily: "IranSANS",
              //                     color: ColorsApp.white),
              //                 textAlign: TextAlign.center,
              //               ),),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: SizeConfig.screenHeight / 7.5,
              //   width: SizeConfig.screenWidth,
              //   child: Card(
              //     margin:
              //     const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              //     color: Color(0xffb7fab5),
              //     elevation: 3,
              //     surfaceTintColor: Colors.grey,
              //     shadowColor: Colors.grey,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10),
              //       //side: BorderSide(color: ColorsApp.textUnSelected.withOpacity(0.5),width: 1)
              //     ),
              //     semanticContainer: true,
              //     clipBehavior: Clip.hardEdge,
              //     child: Column(
              //       children: [
              //         Row(
              //           children: [
              //             Container(
              //               padding: const EdgeInsets.only(
              //                   left: 10, right: 10, top: 5, bottom: 5),
              //               margin: const EdgeInsets.only(left: 10, top: 10),
              //               decoration:  BoxDecoration(
              //                   borderRadius:
              //                   const  BorderRadius.all(Radius.circular(5)),
              //                   border: Border.all(color: ColorsApp.primaryLight,width: 1),
              //                   color: ColorsApp.white),
              //               child: Row(
              //                 children: [
              //                   Text(
              //                     "استراحت ",
              //                     style: TextStyle(
              //                         fontSize: 11,
              //                         fontWeight: FontWeight.w600,
              //                         color: ColorsApp.primaryLight
              //                             .withOpacity(0.5),
              //                         fontFamily: "IranSANS"),
              //                   ),
              //                   Icon(
              //                     Icons.coffee,size: 18,
              //                     color: ColorsApp.primaryLight.withOpacity(0.5),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(right: 10),
              //               child: Text(
              //                 "قسمت اول ",
              //                 style: TextStyle(
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.w600,
              //                     color: ColorsApp.colorTextT1.withOpacity(0.5),
              //                     fontFamily: "IranSANS"),
              //               ),
              //             ),
              //           ],
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         ),
              //         const Padding(
              //           padding: EdgeInsets.only(top: 10),
              //           child: SlideCountdownSeparated(
              //             duration: Duration(hours: 1,minutes: 30),
              //             height: 20,width: 20,
              //             decoration: BoxDecoration(
              //               color: ColorsApp.primary,
              //               borderRadius: BorderRadius.all(Radius.circular(5)),
              //             ),
              //             textStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,),
              //
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: SizeConfig.screenHeight / 7.5,
              //   width: SizeConfig.screenWidth,
              //   child: Card(
              //     margin:
              //     const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              //     color: ColorsApp.white,
              //     surfaceTintColor: Colors.grey,
              //     shadowColor: Colors.grey,
              //     elevation: 3,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10),
              //       //side: BorderSide(color: ColorsApp.textUnSelected.withOpacity(0.5),width: 1)
              //     ),
              //     semanticContainer: true,
              //     clipBehavior: Clip.hardEdge,
              //     child: Column(
              //       children: [
              //         Row(
              //           children: [
              //             Container(
              //               padding: const EdgeInsets.only(
              //                   left: 10, right: 10, top: 5, bottom: 5),
              //               margin: const EdgeInsets.only(left: 10, top: 10),
              //               decoration:  BoxDecoration(
              //                   borderRadius:
              //                   const  BorderRadius.all(Radius.circular(5)),
              //                   border: Border.all(color: ColorsApp.primaryLight,width: 1),
              //                   color: ColorsApp.white),
              //               child: Row(
              //                 children: [
              //                   Text(
              //                     "تمرین ",
              //                     style: TextStyle(
              //                         fontSize: 11,
              //                         fontWeight: FontWeight.w600,
              //                         color: ColorsApp.primaryLight
              //                             .withOpacity(0.5),
              //                         fontFamily: "IranSANS"),
              //                   ),
              //                   Icon(
              //                     Icons.edit_note,size: 18,
              //                     color: ColorsApp.primaryLight.withOpacity(0.5),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(right: 10),
              //               child: Text(
              //                 "قسمت اول ",
              //                 style: TextStyle(
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.w600,
              //                     color: ColorsApp.colorTextT1.withOpacity(0.5),
              //                     fontFamily: "IranSANS"),
              //               ),
              //             ),
              //           ],
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         ),
              //         Padding(
              //           padding:  const EdgeInsets.only(top: 0,left: 40,right: 40),
              //           child: Center(
              //             child: ElevatedButton(
              //
              //               style: ButtonStyle(
              //                   minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenHeight/1.5, 30)),
              //                   foregroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
              //                   backgroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
              //                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //                       RoundedRectangleBorder(
              //                           borderRadius: BorderRadius.circular(5),
              //                           side: const BorderSide(color:ColorsApp.primary)
              //                       )
              //                   )
              //               ),
              //
              //               onPressed: () {
              //                 showCupertinoModalBottomSheet(
              //                     expand: false,
              //                     context: context,
              //                     useRootNavigator: true,
              //                     backgroundColor: ColorsApp.white,
              //                     builder: (BuildContext context) =>
              //
              //                     const ModalCourseTesting());
              //
              //               },
              //               child: const Text(
              //                 "شروع / ادامه",
              //                 style: TextStyle(
              //                     fontSize: 13,
              //                     fontWeight: FontWeight.normal,fontFamily: "IranSANS",
              //                     color: ColorsApp.white),
              //                 textAlign: TextAlign.center,
              //               ),),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: SizeConfig.screenHeight / 7.5,
              //   width: SizeConfig.screenWidth,
              //   child: Card(
              //     margin:
              //     const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              //     color: ColorsApp.white,
              //     surfaceTintColor: Colors.grey,
              //     shadowColor: Colors.grey,
              //     elevation: 3,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10),
              //       //side: BorderSide(color: ColorsApp.textUnSelected.withOpacity(0.5),width: 1)
              //     ),
              //     semanticContainer: true,
              //     clipBehavior: Clip.hardEdge,
              //     child: Column(
              //       children: [
              //         Row(
              //           children: [
              //             Container(
              //               padding: const EdgeInsets.only(
              //                   left: 10, right: 10, top: 5, bottom: 5),
              //               margin: const EdgeInsets.only(left: 10, top: 10),
              //               decoration:  BoxDecoration(
              //                   borderRadius:
              //                   const  BorderRadius.all(Radius.circular(5)),
              //                   border: Border.all(color: ColorsApp.primaryLight,width: 1),
              //                   color: ColorsApp.white),
              //               child: Row(
              //                 children: [
              //                   Text(
              //                     "فایل ",
              //                     style: TextStyle(
              //                         fontSize: 11,
              //                         fontWeight: FontWeight.w600,
              //                         color: ColorsApp.primaryLight
              //                             .withOpacity(0.5),
              //                         fontFamily: "IranSANS"),
              //                   ),
              //                   Icon(
              //                     Icons.file_open,size: 18,
              //                     color: ColorsApp.primaryLight.withOpacity(0.5),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(right: 10),
              //               child: Text(
              //                 "قسمت اول ",
              //                 style: TextStyle(
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.w600,
              //                     color: ColorsApp.colorTextT1.withOpacity(0.5),
              //                     fontFamily: "IranSANS"),
              //               ),
              //             ),
              //           ],
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         ),
              //         Padding(
              //           padding:  const EdgeInsets.only(top: 0,left: 40,right: 40),
              //           child: Center(
              //             child: ElevatedButton(
              //
              //               style: ButtonStyle(
              //                   minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenHeight/1.5, 30)),
              //                   foregroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
              //                   backgroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
              //                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //                       RoundedRectangleBorder(
              //                           borderRadius: BorderRadius.circular(5),
              //                           side: const BorderSide(color:ColorsApp.primary)
              //                       )
              //                   )
              //               ),
              //
              //               onPressed: () {
              //                 showCupertinoModalBottomSheet(
              //                     expand: false,
              //                     context: context,
              //                     useRootNavigator: true,
              //                     backgroundColor: ColorsApp.white,
              //                     builder: (BuildContext context) =>
              //
              //                     const ModalCourseFile());
              //               },
              //               child: const Text(
              //                 "شروع / ادامه",
              //                 style: TextStyle(
              //                     fontSize: 13,
              //                     fontWeight: FontWeight.normal,fontFamily: "IranSANS",
              //                     color: ColorsApp.white),
              //                 textAlign: TextAlign.center,
              //               ),),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
