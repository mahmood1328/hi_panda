
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_9.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Model/chat_messages_model.dart';

class ImageMessageComponent extends StatelessWidget {
  final bool isMyMessage;
  final bool isColleagueMessage;
  final Message message;
  const ImageMessageComponent({Key? key,required this.isMyMessage,required this.isColleagueMessage,required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 12),
      child: isMyMessage&&isColleagueMessage==false?
      ChatBubble(
        clipper: ChatBubbleClipper9(type: BubbleType.sendBubble),
        alignment: Alignment.topRight,
        backGroundColor: ColorsApp.colorItemChatHost,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child:  GestureDetector(
            onTap: (){
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.transparent,
                    contentPadding: EdgeInsets.zero,
                    content: Container(
                      height: MediaQuery.of(context).size.height/2.5,
                      width: MediaQuery.of(context).size.height/2.5,
                      child:  message.file!=null? Image.file( message.file!,
                        height: SizeConfig.screenHeight/5,
                        width: SizeConfig.screenWidth/2,
                      ):Image.network(  message.message,
                        height: SizeConfig.screenHeight/5,
                        width: SizeConfig.screenWidth/2,
                      ),
                      ),
                  );

                },
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                message.file!=null? Image.file( message.file!,
                  height: SizeConfig.screenHeight/5,
                  width: SizeConfig.screenWidth/2,
                ):Image.network(  message.message,
                  height: SizeConfig.screenHeight/5,
                  width: SizeConfig.screenWidth/2,
                ),
                Wrap(
                  alignment: WrapAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(message.showDate,textDirection: TextDirection.rtl, style:
                      const TextStyle(fontSize: 8 , fontWeight: FontWeight.normal ,
                          color: ColorsApp.colorTextNormal
                          ,fontFamily: "IranSANS"),),
                    ),
                    const SizedBox(width: 5,),
                    message.isView?
                    SvgPicture.asset(
                      "${ConstAddress.icon}doublecheck.svg",
                      color: ColorsApp.primaryLight,
                      matchTextDirection: true,
                      height: 15,
                      width: 15,
                    ):
                    message.isReceive?
                    SvgPicture.asset(
                      "${ConstAddress.icon}doublecheck.svg",
                      color: ColorsApp.iconTextField,
                      matchTextDirection: true,
                      height: 15,
                      width: 15,

                    ):message.isGetServer?
                    SvgPicture.asset(
                      "${ConstAddress.icon}check.svg",
                      color: ColorsApp.iconTextField,
                      matchTextDirection: true,
                      height: 20,
                      width: 20,
                    ):SvgPicture.asset(
                      "${ConstAddress.icon}time.svg",
                      color: ColorsApp.iconTextField,
                      matchTextDirection: true,
                      height: 12,
                      width: 12,
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      ):isMyMessage==false&&isColleagueMessage==false?

      ChatBubble(
        clipper: ChatBubbleClipper9(type: BubbleType.receiverBubble),
        alignment: Alignment.topLeft,
        backGroundColor: ColorsApp.colorItemChatGuest,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child:  GestureDetector(
            onTap: (){
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.transparent,
                    contentPadding: EdgeInsets.zero,
                    content: Container(
                      height: MediaQuery.of(context).size.height/2.5,
                      width: MediaQuery.of(context).size.height/2.5,
                      child:  message.file!=null? Image.file( message.file!,
                        height: SizeConfig.screenHeight/5,
                        width: SizeConfig.screenWidth/2,
                      ):Image.network(  message.message,
                        height: SizeConfig.screenHeight/5,
                        width: SizeConfig.screenWidth/2,
                      ),
                    ),
                  );

                },
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                message.file!=null? Image.file( message.file!,
                  height: SizeConfig.screenHeight/5,
                  width: SizeConfig.screenWidth/2,
                ):Image.network(  message.message,
                  height: SizeConfig.screenHeight/5,
                  width: SizeConfig.screenWidth/2,
                ),
                Wrap(
                  alignment: WrapAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(message.showDate,textDirection: TextDirection.rtl, style:
                      const TextStyle(fontSize: 8 , fontWeight: FontWeight.normal ,
                          color: ColorsApp.colorTextNormal
                          ,fontFamily: "IranSANS"),),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      )
      :isMyMessage==false&&isColleagueMessage?
      ChatBubble(
        clipper: ChatBubbleClipper9(type: BubbleType.sendBubble),
        alignment: Alignment.topRight,
        backGroundColor: ColorsApp.colorItemChatHost,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              message.file!=null? Image.file( message.file!,
                height: SizeConfig.screenHeight/5,
                width: SizeConfig.screenWidth/2,
              ):Image.network(  message.message,
                height: SizeConfig.screenHeight/5,
                width: SizeConfig.screenWidth/2,
              ),
              Wrap(
                alignment: WrapAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(message.showDate,textDirection: TextDirection.rtl, style:
                    const TextStyle(fontSize: 8 , fontWeight: FontWeight.normal ,
                        color: ColorsApp.colorTextNormal
                        ,fontFamily: "IranSANS"),),
                  ),
                  const SizedBox(width: 5,),
                  message.isView?
                  SvgPicture.asset(
                    "${ConstAddress.icon}doublecheck.svg",
                    color: ColorsApp.primaryLight,
                    matchTextDirection: true,
                    height: 15,
                    width: 15,
                  ):
                  message.isReceive?
                  SvgPicture.asset(
                    "${ConstAddress.icon}doublecheck.svg",
                    color: ColorsApp.iconTextField,
                    matchTextDirection: true,
                    height: 15,
                    width: 15,

                  ):message.isGetServer?
                  SvgPicture.asset(
                    "${ConstAddress.icon}check.svg",
                    color: ColorsApp.iconTextField,
                    matchTextDirection: true,
                    height: 20,
                    width: 20,
                  ):SvgPicture.asset(
                    "${ConstAddress.icon}time.svg",
                    color: ColorsApp.iconTextField,
                    matchTextDirection: true,
                    height: 12,
                    width: 12,
                  ),
                ],
              ),


            ],
          ),
        ),
      ):const SizedBox()

    );
  }
}
