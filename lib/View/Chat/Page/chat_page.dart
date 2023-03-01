import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Network/service_url.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Components/loading_chat.dart';
import '../Controller/chat_controller.dart';

class ChatPage extends StatelessWidget {
   const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chatController=Get.put(ChatController());
    chatController.supportPage();
    return GetX<ChatController>(
        init: Get.put(ChatController()),
        builder: (chatController) {
          return chatController.isLoading.value
              ? Scaffold(
            backgroundColor: ColorsApp.white,
            body:SizedBox(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Container(
                    //   height:80,
                    //   width:SizeConfig.screenWidth,
                    //   decoration: const BoxDecoration(
                    //     color: ColorsApp.primary,
                    //     borderRadius:BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                    //     //border: Border.all(width: 1,color: ColorsApp.primaryLight.withOpacity(0.3))
                    //
                    //   ),
                    // ),
                    const SizedBox(height: 20,),
                    Container(
                      padding:const EdgeInsets.only(top: 12,bottom: 12,right: 15,left: 15),
                      margin:const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(20),
                          ),
                          border: Border.all(color: ColorsApp.colorBorder)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          Container(

                            padding:const EdgeInsets.only(top: 6,bottom: 6,right: 25,left: 25),
                            decoration: BoxDecoration(
                                color: ColorsApp.white,
                                borderRadius:const  BorderRadius.all( Radius.circular(8),

                                ),
                                border: Border.all(color: ColorsApp.primary)
                            ),

                            child:  Row(
                              children:  [
                                const  Text(" روز " , style:  TextStyle(fontSize: 18 , fontWeight: FontWeight.normal , color: ColorsApp.primary,fontFamily: "IranSANS"),),
                                Text(chatController.supportPageModel!.supportEndDatePerDay.toString() , style:const TextStyle(fontSize: 18 , fontWeight: FontWeight.normal , color: ColorsApp.primary,fontFamily: "IranSANS"),),
                              ],
                            ),
                          ),
                          const Text("مانده ایام پشتیبانی " , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.normal , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),
                        ],
                      ),
                    ),
                    Container(
                      margin:const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                      height: SizeConfig.screenHeight/4,
                      width: SizeConfig.screenWidth,
                      decoration:   BoxDecoration(
                          borderRadius:const BorderRadius.all( Radius.circular(30),
                          ),

                          image: DecorationImage(fit: BoxFit.fill,image:
                          NetworkImage( ServiceURL.baseUrl + chatController.supportPageModel!.photo))
                      ),

                    ),
                     Text(chatController.supportPageModel!.title , style:const TextStyle(fontSize: 18 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextTitle,fontFamily: "IranSANS"),textDirection: TextDirection.rtl,),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                      child:  Text(chatController.supportPageModel!.descript,
                        textScaleFactor:1.08 , textDirection: TextDirection.rtl , textAlign: TextAlign.justify,style:const TextStyle(fontSize: 13 , fontWeight: FontWeight.normal , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),
                    ),
                    GestureDetector(
                      onTap: (){
                        chatController.chatPage(chatController.supportPageModel!.chatId.toString(),context);
                       // Get.to(()=> ChatDetailPage());
                      },
                      child: Container(
                        width: SizeConfig.screenWidth,
                        margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                        padding:const EdgeInsets.only(top: 10,bottom: 10),
                        decoration:const BoxDecoration(
                          color: ColorsApp.primary,
                          borderRadius:BorderRadius.all(Radius.circular(30),
                          ),
                        ),

                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(" شروع گفتگو" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.normal , color: ColorsApp.white,fontFamily: "IranSANS"),),
                          ],
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 50,top: 20),
                    //   child: Stack(
                    //     children: [
                    //       Container(
                    //         margin:const  EdgeInsets.only(left: 40),
                    //         height: 60,
                    //         width: 60,
                    //         decoration: BoxDecoration(
                    //             borderRadius: const BorderRadius.all(Radius.circular(50),
                    //             ),
                    //             image: DecorationImage(image: NetworkImage(image[0]),fit: BoxFit.cover)
                    //         ),
                    //
                    //       ),
                    //       Container(
                    //         margin: const EdgeInsets.only(left: 80),
                    //         height: 60,
                    //         width: 60,
                    //         decoration: BoxDecoration(
                    //             borderRadius: const BorderRadius.all(Radius.circular(50),
                    //             ),
                    //             image: DecorationImage(image: NetworkImage(image[0]),fit: BoxFit.cover)
                    //         ),
                    //
                    //       ),
                    //       Container(
                    //         margin:const  EdgeInsets.only(left: 120),
                    //         height: 60,
                    //         width: 60,
                    //         decoration: BoxDecoration(
                    //             borderRadius: const BorderRadius.all(Radius.circular(50),
                    //             ),
                    //             image: DecorationImage(image: NetworkImage(image[0]),fit: BoxFit.cover)
                    //         ),
                    //
                    //       ),
                    //       Container(
                    //         margin: const EdgeInsets.only(left: 160),
                    //         height: 60,
                    //         width: 60,
                    //         decoration: BoxDecoration(
                    //             borderRadius: const BorderRadius.all(Radius.circular(50),
                    //             ),
                    //             image: DecorationImage(image: NetworkImage(image[0]),fit: BoxFit.cover)
                    //         ),
                    //
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ) ,
          )
              : const LoadingChat();
        });

  }
}
