import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../Widget/custom_physics.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../../Blog/View/blog_screen.dart';
import '../../Chat/Controller/chat_controller.dart';
import '../../Chat/Page/chat_page.dart';
import '../../Chat/Page/list_chat_page.dart';
import '../../Consult/Page/consultPage.dart';
import '../../Dictionary Page/View/dictionary_page.dart';
import '../../Flash Card/View/flash_card_page.dart';
import '../../Planer/View/planer_page.dart';
import '../../Profile/Page/profile_page.dart';
import '../../SplashScreen/Controller/splash_controller.dart';
import '../../beta/coming_soon.dart';
import '../../test_farahi/page/home_test.dart';
import '../Controller/controller_main_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var chatController = Get.put(ChatController());
    final controller = Get.put(MainPageController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primary,
        elevation: 5,
       toolbarHeight: 55,
       title: Row(
         mainAxisAlignment: MainAxisAlignment.end,
         children: [
           GestureDetector(

             child: Padding(
               padding: const EdgeInsets.all(0),
               child: CircleAvatar(
                   radius: 20,
                   backgroundColor: Colors.white,
                   child: SvgPicture.asset("${ConstAddress.icon}cards.svg",height: 25,width: 25,color: ColorsApp.primary,)),
             ),
             onTap: (){
               Get.to(()=> const FlashCardPage());
             },
           ),
         ],
       ),
        leading:  GestureDetector(

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.white,
              child: SvgPicture.asset("${ConstAddress.icon}dic.svg",height: 22,width: 22,color: ColorsApp.primary,),
            ),
          ),
          onTap: (){
            Get.to(()=> const DictionaryPage(tabSelect: DictionaryType.online,));
          },
        ),
      ),
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorsApp.white,
        bottomNavigationBar: Obx(() =>  Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: ColorsApp.primaryTextColor.withOpacity(0.3),blurRadius: 30,spreadRadius: 0.4)
            ]
          ),
          child: SnakeNavigationBar.color(
            height: 70,
            backgroundColor: ColorsApp.white,
            elevation: 30,
            behaviour: SnakeBarBehaviour.floating,
            snakeShape: SnakeShape.indicator,
            snakeViewColor: ColorsApp.primary,
            selectedItemColor: ColorsApp.primary,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            currentIndex: controller.navMenuIndex.value,
            onTap: (index) {
              controller.onItemTapped(index);
            },
            items: [
              BottomNavigationBarItem(
                icon:controller.navMenuIndex.value==0?
                SizedBox(
                  height: 25,
                  width: 25,
                  child: SvgPicture.asset(
                      "${ConstAddress.icon}profileS.svg",color: ColorsApp.primary,
                    ),
                ):
                SizedBox(
                  height: 23,
                  width: 23,
                  child: SvgPicture.asset(
                      "${ConstAddress.icon}profile.svg",color:ColorsApp.textUnSelected,

                     ),
                )
              ),

              BottomNavigationBarItem(
                icon:controller.navMenuIndex.value==1?
                SizedBox(
                  height: 25,
                  width: 25,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        "${ConstAddress.icon}ChatS.svg",color: ColorsApp.primary, height: 25,
                        width: 25,
                      ),
                      chatController.countListChat.value != 0? Container(
                        alignment: Alignment.center,
                        height: 15,
                        width: 15,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: ColorsApp.primary,
                        ),
                        child: Text(
                          chatController.countListChat.value.toString(),
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: ColorsApp.white,
                              fontFamily: "IranSANS"),
                        ),
                      ):Container(),
                    ],
                  ),
                ):SizedBox(
                  height: 20,
                  width: 20,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        "${ConstAddress.icon}Chat.svg",color: ColorsApp.textUnSelected,

                      ),
                      chatController.countListChat.value != 0? Container(
                        alignment: Alignment.center,
                        height: 15,
                        width: 15,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: ColorsApp.white,
                        ),
                        child: Text(
                          chatController.countListChat.value.toString(),
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: ColorsApp.black,
                              fontFamily: "IranSANS"),
                        ),
                      ):Container(),
                    ],
                  ),
                )
              ),
              BottomNavigationBarItem(
                icon:controller.navMenuIndex.value==2?
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(
                    "${ConstAddress.image}listV.png",color: ColorsApp.primary,
                  ),
                ):SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset(
                    "${ConstAddress.image}listVS.png",color: ColorsApp.textUnSelected,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon:controller.navMenuIndex.value==3?
                SizedBox(
                  height: 25,
                  width: 25,
                  child: SvgPicture.asset(
                    "${ConstAddress.icon}Home.svg",color: ColorsApp.primary,

                  ),
                ):SizedBox(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset(
                    "${ConstAddress.icon}HomeS.svg",color: ColorsApp.textUnSelected,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                  icon:controller.navMenuIndex.value==4?
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(
                      "${ConstAddress.image}blogger.png",color: ColorsApp.primary,
                    ),
                  ):
                  SizedBox(
                    height: 23,
                    width: 23,
                    child: Image.asset(
                      "${ConstAddress.image}bloggerS.png",color:ColorsApp.colorTextTitle,

                    ),
                  )
              ),
            ],
          ),
        ),),
        body: SafeArea(
          child: WillPopScope(
              onWillPop: () =>controller.handleWillPop(context),
              child:  SizedBox(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                child: PageView(
                  physics: const CustomPhysics(),
                  onPageChanged: (index) {
                    controller.onItemTapped(index);
                  },
                  controller: controller.pageController,
                  children:  [
                     ProfilePage(),
                    controller.box.read("role")==4&&controller.box.read("isSupport")? ListChatPage():
                    controller.box.read("role")==4&&controller.box.read("isConsult")? ConsultPage():
                    controller.box.read("role")!=3?const ComingSoonPage( name: 'دسترسی برای شما وجود ندارد ',)
                        : ChatPage(),
                    PlanerPage(),
                       const HomeTestPage(),
                    BlogScreen(),
                  ],
                ),
              ),),
        ));
  }
}
