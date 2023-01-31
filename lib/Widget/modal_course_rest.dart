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
import 'package:lottie/lottie.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:video_player/video_player.dart';
import '../Network/service_url.dart';
import '../View/Verify/Controller/verify_controller.dart';
import '../View/audio_player/Page/player_page.dart';
import '../main.dart';
import '../utils/const.dart';
import '../utils/res/colors.dart';
import '../utils/res/dimensions.dart';
import '../utils/size_config.dart';
import 'gradient_containers.dart';

class ModalCourseRest extends StatefulWidget {
  final int timeRest;
  const ModalCourseRest({Key? key,required this.timeRest}) : super(key: key);


  @override
  _ModalCourseRestState createState() => _ModalCourseRestState();

}

class _ModalCourseRestState extends State<ModalCourseRest> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: ColorsApp.white,
        child: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "استراحت ",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ColorsApp.colorTextT1.withOpacity(0.5),
                      fontFamily: "IranSANS"),
                ),

                const SizedBox(
                  height: 60,
                ),
                Center(child: Lottie.asset(ConstAddress.lottie + "rest.json",height: 300,width: 300)),
                const SizedBox(
                  height: 30,
                ),
                SlideCountdownSeparated(
                  onDone: (){
                    Navigator.pop(context);
                  },
                  suffixIcon: const Icon(Icons.timer,color: ColorsApp.red,size: 40,),
                  duration: Duration(minutes: widget.timeRest),
                  height: 40,width: 40,
                  decoration: const BoxDecoration(
                    color: ColorsApp.primary,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  textStyle:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "IranSANS"),

                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "خوب استراحت کن بعداز اتمام تایم ادامه بده ",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: ColorsApp.primary,
                      fontFamily: "IranSANS"),
                ),
              ],
            ),
          ),
        ));
  }

}
