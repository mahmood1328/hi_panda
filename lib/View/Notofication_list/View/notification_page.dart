import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Controller/notification_controller.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  var notificationController= Get.put(NotificationController());
  int more=0;
  List<int> viewNotification=[];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: SizedBox(
        width:SizeConfig.screenWidth,
        height:SizeConfig.screenHeight,
        child: Column(
          children: [
            SizedBox(
              height:SizeConfig.screenHeight/8,
              width:SizeConfig.screenWidth,
              child: Stack(
                children: [
                  Container(
                    height:90,
                    width:SizeConfig.screenWidth,
                    decoration: const BoxDecoration(
                      color: ColorsApp.primary,
                      borderRadius:BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                      //border: Border.all(width: 1,color: ColorsApp.primaryLight.withOpacity(0.3))
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(35),

                    child: GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: SvgPicture.asset(
                          "${ConstAddress.icon}arrowLeft.svg",color: ColorsApp.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

           Column(
             children: notificationController.getNotificationModel!.notifies.map((e) => Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
               child: Stack(
                 children: [

                   Container(
                     decoration:  BoxDecoration(borderRadius:const BorderRadius.all(Radius.circular(15)),color: e.isView|| viewNotification.contains(e.id)? ColorsApp.greenBlueLight:
                     ColorsApp.primary),
                     width:SizeConfig.screenWidth,
                     height:SizeConfig.screenHeight/7,
                   ),
                   AnimatedContainer(
                     margin: const EdgeInsets.only(right: 20),
                     padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                     decoration: BoxDecoration(borderRadius:const BorderRadius.all(Radius.circular(15)),color: ColorsApp.white,
                         border: Border.all(color:e.isView? ColorsApp.greenBlueLight:ColorsApp.primary,width: 1)),
                     width:SizeConfig.screenWidth,
                     height:more==e.id? SizeConfig.screenHeight/3.7:SizeConfig.screenHeight/7,
                     duration: const Duration(milliseconds: 1000),
                     child:more==e.id?
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children:  [
                         Text(e.title , style: const TextStyle(fontSize: 12 , fontWeight: FontWeight.bold , color: ColorsApp.black,fontFamily: "IranSANS"),),
                         Text(e.description , style:
                         const TextStyle(fontSize: 11 , fontWeight: FontWeight.normal ,
                             color: ColorsApp.black,fontFamily: "IranSANS"),textAlign: TextAlign.justify,
                           textDirection: TextDirection.rtl),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                           e.url!="" ? GestureDetector(
                               onTap: (){
                                launchUrl( Uri.parse(e.url));
                                 // launch(e.url);
                               },
                               child: Container(
                                 padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                                 decoration:const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: ColorsApp.primary),
                                 child:const Text("نمایش" , style: TextStyle(fontSize: 11 , fontWeight: FontWeight.normal , color: ColorsApp.white,fontFamily: "IranSANS"),),

                               ),
                             ):
                             const SizedBox(),
                           ],
                         )

                       ],
                     ):
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children:  [
                         Text(e.title , style: const TextStyle(fontSize: 12 , fontWeight: FontWeight.bold , color: ColorsApp.black,fontFamily: "IranSANS"),),
                         Text(e.description , style:
                         const TextStyle(fontSize: 11 , fontWeight: FontWeight.normal ,
                             color: ColorsApp.black,fontFamily: "IranSANS"),textAlign: TextAlign.justify,
                           textDirection: TextDirection.rtl,maxLines: 2,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             GestureDetector(
                               onTap: (){

                                 notificationController.addViewNotifi(context,e.id);
                                 setState(() {
                                   more=e.id;
                                   viewNotification.add(e.id);
                                 });
                                
                               },
                               child: Container(
                                 padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                                 margin:const EdgeInsets.only(top: 10),
                                 decoration: BoxDecoration(borderRadius:const BorderRadius.all(Radius.circular(10)),
                                     color:e.isView|| viewNotification.contains(e.id)?ColorsApp.greenBlueLight: ColorsApp.primary),
                                 child:const Text("بیشتر" , style: TextStyle(fontSize: 11 , fontWeight: FontWeight.normal , color: ColorsApp.white,fontFamily: "IranSANS"),),

                               ),
                             ),
                           ],
                         )

                       ],
                     ),
                   ),

                 ],
               ),
             )).toList(),
           ),

          ],
        ),
      ),
    );
  }
}
