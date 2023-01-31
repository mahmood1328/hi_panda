import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Widget/modal_image_upload.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/res/dimensions.dart';
import '../../../utils/size_config.dart';
import '../Controller/planner_controller.dart';

class CallComponents extends StatelessWidget {
  final int plannerUserId;
  final bool isMyPlanner;
  const CallComponents({Key? key,required this.plannerUserId,required this.isMyPlanner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    File? file;
    return GetX<PlannerController>(
        init: Get.put(PlannerController()),
        builder: (plannerController) {
          return plannerController.isLoadingCall.value
              ? Scaffold(
            backgroundColor: ColorsApp.white,
            body: SizedBox(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "ارسال تیکت به پشتیبانی : ",
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
                            " در صورت بروز مشکل و نیاز به پشتیبانی میتوانید در این قسمت پیام ارسال کنید. در کوتاهترین زمان رسیدگی می شود.",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: ColorsApp.colorTextT1.withOpacity(0.5),
                                fontFamily: "IranSANS"),textDirection: TextDirection.rtl,maxLines: 5,textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50,),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding:const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius:const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: ColorsApp.colorTextNormal)
                      ),
                      child: Column(
                        children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
//                       child: TextFormField(
//                         onChanged: (value) {
//                           // if(value.length==11){
//                           //   setState(() {
//                           //     phone=true;
//                           //   });
//                           // }else{
//                           //   setState(() {
//                           //     phone=false;
//                           //   });
//                           // }
//                         },
//                         onEditingComplete: () => FocusScope.of(context).nextFocus(),
// //                  autofocus: true,
//                         //controller: controllerPhone,
//                         textAlign: TextAlign.right,
//                         style: const TextStyle(
//                             fontSize: 18.0,
//                             color: Colors.black,
//                             fontWeight: FontWeight.normal,fontFamily: "IranSANS"
//                         ),
//                         decoration: InputDecoration(
//                           fillColor: const Color(0xffF9F9F9),
//                           filled: true,
//                           counterText: "",
//                           contentPadding:
//                           const EdgeInsets.only(left: 16, right: 16),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                             borderSide: const BorderSide(
//                               color: Color(0xffF9F9F9),
//                               width: 0.7,
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Color(0xffF9F9F9),
//                               width: 0.7,
//                             ),
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Color(0xffF9F9F9),
//                               width: 0.7,
//                             ),
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           hintText: "... عنوان",
//                           hintStyle: const TextStyle(
//                               fontSize: 15.0,
//                               fontWeight: FontWeight.normal,
//                               color: ColorsApp.colorTextNormal,
//                               fontFamily: 'IRANSans'),
//                         ),
//                         maxLines: 1,
//                         keyboardType: TextInputType.phone,maxLength: 11,
//                       ),
//                     ),
                          isMyPlanner?
                          Column(
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
                                  maxLines: 3,
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
                                              plannerController.file = File(ff.path);
                                              if (plannerController.file != null) {
                                                plannerController.uploadImage(plannerController.file);
                                              }
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
                                              plannerController.file = File(ff.path);
                                              plannerController.uploadImage(plannerController.file);
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
                              const SizedBox(height: 10,),
                              plannerController.box.read("idImage")!=null?
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

                                      plannerController.plannerAddSupport(
                                          context,
                                          plannerController.controllerDesc.text,
                                          plannerController.box.read("idImage")!=null? true : false,
                                          plannerController.box.read("idImage") ?? ""
                                          , plannerUserId);
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
                          ):
                          Column(
                            children: [

                              plannerController.box.read("idImage")!=null?
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:   [
                                  Text(
                                    "برای شرکت در پلنر و خرید اشتراک به سایت مراجعه کنید",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                        color: ColorsApp.black.withOpacity(0.7)),
                                    textAlign: TextAlign.center,
                                  ),
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
                                      launch("https://hipanda.ir/");
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "هدایت به سایت",
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
                          ) ,
                        ],
                      ),
                    ),
                    isMyPlanner?   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [

                        Text(
                          "PDF",
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
                    ) :const SizedBox()
                  ],
                ),
              ),
            ),
          )
              : const Scaffold(backgroundColor: ColorsApp.white,body: Center(child: CircularProgressIndicator()));
        });

  }
}
