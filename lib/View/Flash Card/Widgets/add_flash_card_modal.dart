import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hi_panda/utils/const.dart';
import '../../../Widget/snackbar.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/res/dimensions.dart';
import '../../../utils/size_config.dart';
import '../../Chat/Controller/chat_controller.dart';
import '../Controller/flash_card_controller.dart';



class ModalAddFlashCard extends StatefulWidget {
  const ModalAddFlashCard({Key? key,}) : super(key: key);


  @override
  _ModalAddFlashCardState createState() => _ModalAddFlashCardState();

}

class _ModalAddFlashCardState extends State<ModalAddFlashCard> {

  @override
  void initState() {
    super.initState();

  }

  var flashCardController=Get.put(FlashCardController());
  bool isError=false;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: ColorsApp.white,
        child: SafeArea(
          top: false,
          child: SizedBox(
            height:SizeConfig.screenHeight,
            width:SizeConfig.screenWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                Container(
                  margin: const EdgeInsets.only(bottom: 4,top: 8),
                  width: 80,
                  height: 4,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(16)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
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
                    controller: flashCardController.titleController,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,fontFamily: "IranSANS"
                    ),
                    decoration: InputDecoration(
                      fillColor:  ColorsApp.textColorSub,
                      filled: true,
                      // suffixIcon:const Icon(Icons.phone_android,color: ColorsApp.iconTextField,),
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
                      hintText: "..... عنوان ",
                      hintStyle: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          color: ColorsApp.colorTextNormal,
                          fontFamily: 'IRANSans'),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          child: SvgPicture.asset(ConstAddress.icon+"image3.svg",height: 40,width: 40,color:flashCardController.idUpload.value?ColorsApp.iconTextField: ColorsApp.iconTextField,),
                      onTap: ()async{
                        FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);
                        if (result != null) {
                          flashCardController.file =
                              File(result.files.single.path!);
                          flashCardController
                              .getLoadingFile(
                              true);
                          if (flashCardController
                              .file !=
                              null) {
                            flashCardController.uploadFile(flashCardController.box.read("userId").toString(), context,flashCardController.file,2);
                            flashCardController
                                .getLoadingFile(

                                false);
                          }

                        }
                      },
                      ),
                      Text(
                        "بارگزاری عکس",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                            color: ColorsApp.colorTextNormal),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(right: 50,top: 10,bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "سطح بندی",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                            color: ColorsApp.colorTextNormal),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Obx(() => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          flashCardController.levelIndex(3);
                        },
                        child: Column(
                          children: [
                            Image.asset(ConstAddress.image+"lol.png",height: 40,width: 40,color: flashCardController.levelNumber.value==3?
                            ColorsApp.primaryLight2:ColorsApp.iconTextField,),
                            Text(
                              "سخت",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                color:  flashCardController.levelNumber.value==3?
                                ColorsApp.primaryLight2:ColorsApp.iconTextField,),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          flashCardController.levelIndex(2);
                        },
                        child: Column(
                          children: [
                            Image.asset(ConstAddress.image+"happy.png",height: 40,width: 40,color: flashCardController.levelNumber.value==2?
                            ColorsApp.primaryLight2:ColorsApp.iconTextField,),
                            Text(
                              "متوسط",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                color: flashCardController.levelNumber.value==2?
                                ColorsApp.primaryLight2:ColorsApp.iconTextField,),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          flashCardController.levelIndex(1);
                        },
                        child: Column(
                          children: [

                            Image.asset(ConstAddress.image+"sleeping.png",height: 40,width: 40,color: flashCardController.levelNumber.value==1?
                            ColorsApp.primaryLight2:ColorsApp.iconTextField,),
                            Text(
                              "آسان",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                color: flashCardController.levelNumber.value==3?
                                ColorsApp.primaryLight2:ColorsApp.iconTextField,),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),),

                Padding(
                  padding:  const EdgeInsets.only(top: 70,left: 40,right: 40),
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

                        if(flashCardController.titleController.text!=""&&flashCardController.fileId.value!=0) {
                          flashCardController.addItemToFlashCardCategory(flashCardController.titleController.text,
                            flashCardController.fileId.value.toString(), flashCardController.levelNumber.value, context);
                        }else{
                          ShowSnackBar().showSnackBar(
                            context,
                            "فیلد ها را تکمیل کنید",duration: const Duration(seconds: 5),
                          );
                        }
                      },
                      child: const Text(
                        "ثبت کلمه جدید",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                            color: ColorsApp.white),
                        textAlign: TextAlign.center,
                      ),),
                  ),
                ),
                const Divider(height: 24.0,color: Colors.transparent,),

              ],
            ),
          ),
        ));
  }

}