import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_9.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voice_message_package/voice_message_package.dart';

import '../../../Network/service_url.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../Model/chat_messages_model.dart';

class VoiceMessageComponent extends StatelessWidget {
  final bool isMyMessage;
  final bool isColleagueMessage;
  final Message message;
  const VoiceMessageComponent({Key? key,required this.isMyMessage,required this.isColleagueMessage,required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isMyMessage&&isColleagueMessage==false?
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
              VoiceMessage(
                contactPlayIconColor:Colors.black ,
                meFgColor: ColorsApp.primary,
                mePlayIconColor: Colors.white,
                meBgColor: ColorsApp.colorItemChatHost,
                audioSrc:  message.message,
                played: true,
                me: true,
                onPlay: () {},
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
      ):isMyMessage==false&&isColleagueMessage==false?
      ChatBubble(
        clipper: ChatBubbleClipper9(type: BubbleType.receiverBubble),
        alignment: Alignment.topLeft,
        backGroundColor: ColorsApp.colorItemChatGuest,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child:   Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              VoiceMessage(
                contactPlayIconColor:Colors.white ,
                contactFgColor: ColorsApp.primary,
                mePlayIconColor: Colors.white,
                contactBgColor: ColorsApp.colorItemChatGuest,
                audioSrc:  message.message,
                played: true,
                me: false,
                onPlay: () {},
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
                  ),const SizedBox(width: 5,),
                ],
              ),


            ],
          ),
        ),
      ):isMyMessage==false&&isColleagueMessage?
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
              VoiceMessage(
                contactPlayIconColor:ColorsApp.black,
                meFgColor: ColorsApp.primary,
                mePlayIconColor: Colors.white,
                meBgColor: ColorsApp.colorItemChatHost,
                audioSrc:  message.message,
                played: true,
                me: true,
                onPlay: () {},
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
