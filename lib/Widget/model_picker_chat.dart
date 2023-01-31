import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:record/record.dart';
import '../utils/const.dart';
import '../utils/res/colors.dart';
import '../utils/size_config.dart';


class ModelPickerChat extends StatefulWidget {
  final void Function(String path) onStop;
  final  Function callBackCamera;
  final  Function callBackGallery;
  final  Function callBackFile;
  final  Function callBackMusic;
  final  Function callBackVideo;

  const ModelPickerChat({Key? key, required this.onStop,required this.callBackCamera,required this.callBackFile,required this.callBackGallery,required this.callBackMusic,required this.callBackVideo}) : super(key: key);



  @override
  _ModelPickerChatState createState() => _ModelPickerChatState();

}

class _ModelPickerChatState extends State<ModelPickerChat> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: ColorsApp.white,
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              Container(
                margin: const EdgeInsets.only(bottom: 4,top: 8),
                width: 80,
                height: 4,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(16)
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    GestureDetector(
                      onTap: (){
                        widget.callBackFile();
                      },
                      child: Column(
                        children: [
                          SizedBox(
                              height: 50,width: 50,
                              child: Image.asset(ConstAddress.image+"file.png")),
                         const Text("فایل" , style:
                           TextStyle(fontSize: 14 , fontWeight: FontWeight.w600 ,
                              color: ColorsApp.iconTextField,fontFamily: "IranSANS"),),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20,),
                    GestureDetector(
                      onTap: (){
                        widget.callBackCamera();
                      },
                      child: Column(
                        children: [
                          SizedBox(
                              height: 50,width: 50,
                              child: Image.asset(ConstAddress.image+"camera.png")),
                          const   Text("دوربین" , style:
                          TextStyle(fontSize: 14 , fontWeight: FontWeight.w600 ,
                              color: ColorsApp.iconTextField,fontFamily: "IranSANS"),),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20,),
                    GestureDetector(
                      onTap: (){
                        widget.callBackGallery();
                      },
                      child: Column(
                        children: [

                          SizedBox(
                              height: 50,width: 50,
                              child: Image.asset(ConstAddress.image+"photo.png")),
                          const  Text("گالری" , style:
                          TextStyle(fontSize: 14 , fontWeight: FontWeight.w600 ,
                              color: ColorsApp.iconTextField,fontFamily: "IranSANS"),),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20,),
                    GestureDetector(
                      onTap: (){
                        widget.callBackMusic();
                      },
                      child: Column(
                        children: [
                          SizedBox(
                              height: 50,width: 50,
                              child: Image.asset(ConstAddress.image+"music.png")),
                          const Text("موزیک" , style:
                          TextStyle(fontSize: 14 , fontWeight: FontWeight.w600 ,
                              color: ColorsApp.iconTextField,fontFamily: "IranSANS"),),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20,),
                    GestureDetector(
                      onTap: (){
                        widget.callBackVideo();
                      },
                      child: Column(
                        children: [
                          SizedBox(
                              height: 50,width: 50,
                              child: Image.asset(ConstAddress.image+"video.png")),
                          const Text("ویدیو" , style:
                          TextStyle(fontSize: 14 , fontWeight: FontWeight.w600 ,
                              color: ColorsApp.iconTextField,fontFamily: "IranSANS"),),
                        ],
                      ),
                    )

                  ],
                ),
              ),

            ],
          ),
        ));
  }

}
