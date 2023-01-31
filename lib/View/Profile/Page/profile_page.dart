import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../Widget/modal_logout.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../../Chat/Controller/chat_controller.dart';
import '../../Notofication_list/Controller/notification_controller.dart';

class ProfilePage extends StatelessWidget {
   const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var box=GetStorage();
    var chatController= Get.put(ChatController());
    var notificationController= Get.put(NotificationController());
    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                height: SizeConfig.screenHeight/6,
                width: SizeConfig.screenWidth,
                decoration: const BoxDecoration(
                    color: ColorsApp.primary,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
                ),
                child: Padding(
                  padding:  EdgeInsets.only(top: SizeConfig.screenHeight/5/2.2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row(
                        children: [


                          GestureDetector(
                            onTap: (){
                              showCupertinoModalBottomSheet(
                                  expand: false,
                                  context: context,
                                  useRootNavigator: true,
                                  backgroundColor: ColorsApp.white,
                                  builder: (BuildContext context) =>

                                  const ModalLogout());
                            } ,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: SvgPicture.asset(
                                "${ConstAddress.icon}close.svg",color: ColorsApp.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          GestureDetector(
                            onTap: (){
                              notificationController.notificationList(context,1,10,"",0);
                            },
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: SvgPicture.asset(
                                "${ConstAddress.icon}bell2.svg",color: ColorsApp.white,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const Text("پروفایل" , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold , color: ColorsApp.white,fontFamily: "IranSANS"),),

                    ],
                  ),
                ),
              ),
             const SizedBox(height: 30,),
              Container(
                margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                padding:const EdgeInsets.all(7),
                height: 170,
                width: 170,
                decoration:  const BoxDecoration(
                  color: ColorsApp.primary,
                    borderRadius: BorderRadius.all(Radius.circular(90),
                    ),
                ),
                child: Container(
                  height: 150,
                  width: 150,
                  decoration:  const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(75),
                      ),
                      image: DecorationImage(fit: BoxFit.fill,image:
                      NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS54088iJjHpn-y9FCxGAh5NBEdHugwIXewWQ&usqp=CAU"))
                  ),

                ),
              ),
              const SizedBox(height: 20,),
               Text("${box.read("name")}" , style: const TextStyle(fontSize: 25 , fontWeight: FontWeight.bold , color: ColorsApp.primary,fontFamily: "IranSANS"),),
              const SizedBox(height: 5,),
               Text("${box.read("phone")}" , style:const TextStyle(fontSize: 18 , fontWeight: FontWeight.normal , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // margin: EdgeInsets.symmetric(horizontal: 50,vertical:  SizeConfig.screenHeight/5),
                    // padding:const EdgeInsets.symmetric(horizontal: 20),
                    height: 40,
                    width: SizeConfig.screenHeight/5,
                    decoration:  const BoxDecoration(
                      color: ColorsApp.primary,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Row(
                           children: [
                             const Text("  روز " , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.normal , color: ColorsApp.white,fontFamily: "IranSANS"),),
                             Text(chatController.supportPageModel!=null?chatController.supportPageModel!.supportEndDatePerDay.toString():"" , style:const TextStyle(fontSize: 17 , fontWeight: FontWeight.normal , color: ColorsApp.white,fontFamily: "IranSANS"),),
                           ],
                         ),

                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: SizeConfig.screenHeight/5,
                    decoration:   BoxDecoration(
                      color: ColorsApp.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10),

                        ),
                      border: Border.all(color: ColorsApp.primary,width: 2)
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(" مانده ایام پشتیبانی " , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.normal , color: ColorsApp.primary,fontFamily: "IranSANS"),),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
