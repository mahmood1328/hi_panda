import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Network/service_url.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Controller/chat_controller.dart';
import '../Model/supports_model.dart';

class ItemListChatComponent extends StatelessWidget {
  final Chat chat;
  const ItemListChatComponent({Key? key,required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chatController=Get.put(ChatController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child:  Column(
        children: [
          GestureDetector(
            onTap: (){
              chatController.chatPage(chat.chatId.toString(),context);
              chatController.infoUserPageChat(chat.phoneNumber,context);
              // Get.to(()=> ChatDetailPage());
            },
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 23),
              leading: Container(
                width: 55,
                height: 55,
                padding: const EdgeInsets.all(2),
                decoration:  const BoxDecoration(
                  color: ColorsApp.primaryLight,
                  borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child:  CircleAvatar(
                  backgroundColor: ColorsApp.primary,
                  backgroundImage: NetworkImage(chat.photo),
                  radius: 25,
                ),
              ),
              title: Wrap(
                children:  [
                  Text( chat.title, style:
                  const TextStyle(fontSize: 16 , fontWeight: FontWeight.w500 ,
                      color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),
                  const SizedBox(width: 5,),
                  chat.countMessage!=0?  CircleAvatar(
                    backgroundColor: ColorsApp.primary,
                    radius: 9,
                    child:Text(chat.countMessage.toString() ,textAlign: TextAlign.center, style:
                    const  TextStyle(fontSize: 12 , fontWeight: FontWeight.normal ,
                        color: ColorsApp.white,fontFamily: "IranSANS"),),
                  ):Container()
                ],
              ),
              subtitle: Text(chat.lastMessage , style:
               TextStyle(fontSize: 12 , fontWeight: FontWeight.normal ,
                  color: ColorsApp.primaryTextColor.withOpacity(0.8),fontFamily: "IranSANS"),),

              trailing:   Text(chat.persianDate , style:
              const  TextStyle(fontSize: 10 , fontWeight: FontWeight.normal ,
                  color: ColorsApp.textColorSub,fontFamily: "IranSANS"),),
            ),
          ),
          Container(
            margin:const EdgeInsets.symmetric(horizontal: 25),
            height: 1,
            width: SizeConfig.screenWidth,
            color: ColorsApp.backTextField,
          )
        ],
      ),
    );
  }
}
