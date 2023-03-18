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
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import '../Network/service_url.dart';
import '../View/Planer/Controller/planner_controller.dart';
import '../View/Verify/Controller/verify_controller.dart';
import '../View/audio_player/Page/player_page.dart';
import '../main.dart';
import '../utils/const.dart';
import '../utils/res/colors.dart';
import '../utils/res/dimensions.dart';
import '../utils/size_config.dart';
import 'gradient_containers.dart';
import 'modal_image_upload.dart';

class ModalCourseFile extends StatefulWidget {
final  String title;
final  String des;
final  String url;
final  int id;
  const ModalCourseFile({Key? key,required this.id,required this.title,required this.url,required this.des}) : super(key: key);


  @override
  _ModalCourseFileState createState() => _ModalCourseFileState();

}

class _ModalCourseFileState extends State<ModalCourseFile> {

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return GetX<PlannerController>(
        init: Get.put(PlannerController()),
        builder: (plannerController) {
          return plannerController.isLoadingCall.value
              ? Material(
              color: ColorsApp.white,
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                child: SingleChildScrollView(
                  child: Column(

                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "نمایش فایل تمرین ",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: ColorsApp.colorTextT1.withOpacity(0.5),
                            fontFamily: "IranSANS"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 1,width: SizeConfig.screenWidth,
                        color: ColorsApp.backTextField,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "توضیحات فایل تمرین : ",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: ColorsApp.colorTextT1.withOpacity(0.5),
                                  fontFamily: "IranSANS"),textDirection: TextDirection.rtl,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Wrap(
                          children: [
                            Text(
                              widget.des,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: ColorsApp.colorTextT1.withOpacity(0.5),
                                  fontFamily: "IranSANS"),textDirection: TextDirection.rtl,maxLines: 5,textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:  const EdgeInsets.only(top: 40,left: 40,right: 40),
                        child: Center(
                          child: ElevatedButton(

                            style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenHeight/1.5, 50)),
                                foregroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                                backgroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(Dimensions.borderRadiusComponents),
                                        side: const BorderSide(color:ColorsApp.primary)
                                    )
                                )
                            ),

                            onPressed: () {

                              launchUrl(Uri.parse("https://hipanda.ir${widget.url}"));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "دریافت فایل تمرین",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                      color: ColorsApp.white),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(width: 5,),
                                Image.asset("${ConstAddress.image}download2.png",color: ColorsApp.white,height: 30,width: 30,)
                              ],
                            ),),
                        ),
                      ),

                      const SizedBox(height: 100,),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding:const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius:const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: ColorsApp.colorTextNormal)
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                              child: TextFormField(
                                onChanged: (value) {
                                  // if(value.length==11){
                                  //   setState(() {
                                  //     phone=true;
                                  //   });
                                  // }else{
                                  //   setState(() {
                                  //     phone=false;
                                  //   });
                                  // }
                                },
                                onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                                controller:plannerController.controllerDesc,

                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,fontFamily: "IranSANS"
                                ),
                                decoration: InputDecoration(
                                  fillColor: const Color(0xffF9F9F9),
                                  filled: true,
                                  counterText: "",
                                  contentPadding:
                                  const EdgeInsets.only(left: 16, right: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(
                                      color: Color(0xffF9F9F9),
                                      width: 0.7,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xffF9F9F9),
                                      width: 0.7,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xffF9F9F9),
                                      width: 0.7,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  hintText: "... توضیحات",
                                  hintStyle: const TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                      color: ColorsApp.colorTextNormal,
                                      fontFamily: 'IRANSans'),
                                ),
                                maxLines: 4,
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showCupertinoModalBottomSheet(
                                    expand: false,
                                    context: context,
                                    useRootNavigator: true,
                                    backgroundColor: ColorsApp.primary,
                                    builder: (BuildContext context) => ModalImageUpload(
                                      callBackGallery: () async {
                                        plannerController.showProgress(context);
                                        Get.back();
                                        final result = await ImagePicker()
                                            .pickImage(source: ImageSource.gallery);
                                        if (result != null) {
                                          CroppedFile? ff = await ImageCropper().cropImage(
                                            sourcePath: result.path,
                                            aspectRatioPresets: [
                                              CropAspectRatioPreset.square,
                                            ],
                                          );
                                          if (ff != null) {
                                            plannerController.file2 = File(ff.path);
                                              plannerController.uploadImage(plannerController.file2);
                                          }
                                          Future.delayed(const Duration(seconds: 4), () {
                                            plannerController.removeProgress();
                                          });
                                        }
                                      },
                                      callBackCamera: () async {

                                        plannerController.showProgress(context);
                                        Get.back();
                                        final result = await ImagePicker()
                                            .pickImage(source: ImageSource.camera);
                                        if (result != null) {
                                          CroppedFile? ff = await ImageCropper().cropImage(
                                            sourcePath: result.path,
                                            aspectRatioPresets: [
                                              CropAspectRatioPreset.square,
                                            ],
                                          );
                                          if (ff != null) {
                                            plannerController.file2 = File(ff.path);
                                            plannerController.uploadImage(plannerController.file2);
                                          }
                                          Future.delayed(const Duration(seconds: 4), () {
                                            plannerController.removeProgress();
                                          });
                                        }
                                      },
                                    ));

                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "بارگزاری فایل تمرین",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,fontFamily: "IranSANS",decoration: TextDecoration.underline,
                                        color: ColorsApp.primary),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(width: 5,),
                                  Image.asset("${ConstAddress.image}uploaded.png",color: ColorsApp.primary,height: 30,width: 30,)
                                ],
                              ),
                            ),
                            plannerController.box.read("idImage")!=null?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(onPressed: (){
                                 setState(() {
                                   plannerController.box.remove("idImage");
                                 });
                                }, icon: const Icon(Icons.close,color: Colors.black,)),
                                const SizedBox(width: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  const [
                                    Text(
                                      "فایل آپلود شده",
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                          color: ColorsApp.black),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(width: 5,),
                                    Icon(Icons.file_copy,color: ColorsApp.black,size: 17,),
                                  ],
                                ),
                                const SizedBox(width: 20,),
                              ],
                            ):const SizedBox(),

                            Padding(
                              padding:  const EdgeInsets.only(top: 20,left: 40,right: 40),
                              child: Center(
                                child: ElevatedButton(

                                  style: ButtonStyle(
                                      minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenHeight/1.5, 50)),
                                      foregroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                                      backgroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(Dimensions.borderRadiusComponents),
                                              side: const BorderSide(color:ColorsApp.primary)
                                          )
                                      )
                                  ),

                                  onPressed: () {
                                    plannerController.plannerItemPartAddPractise(
                                        context,widget.id
                                        ,plannerController.controllerDesc.text,
                                        plannerController.box.read("idImage")!=null? true : false,
                                        plannerController.box.read("idImage") ?? ""
                                        , 0);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "ارسال فایل تمرین",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                            color: ColorsApp.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [

                          Text(
                            "PDF , PNG , JPG",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                color: ColorsApp.black),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "<= بهترین پسوند برای خواندن و نوشتن",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                color: ColorsApp.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ))
              : const Scaffold(backgroundColor: ColorsApp.white,body: Center(child: CircularProgressIndicator()));
        });

  }

}
