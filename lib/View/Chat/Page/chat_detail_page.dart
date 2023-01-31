import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../Widget/modal_info_message.dart';
import '../../../Widget/model_audio_chat.dart';
import '../../../Widget/model_picker_chat.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Components/date_time_component.dart';
import '../Components/file_message_component.dart';
import '../Components/image_message_component.dart';
import '../Components/text_message_component.dart';
import '../Components/video_message_component.dart';
import '../Components/voice_message_component.dart';
import '../Controller/chat_controller.dart';
import '../Model/chat_messages_model.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({Key? key}) : super(key: key);

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
var chatController=Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    chatController.isLock.value?  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            width:SizeConfig.screenWidth,
            child: const Padding(
              padding: EdgeInsets.only(right: 20,top: 0),
              child: Text(
                "کاربر توسط پشتیبانی دیگر قفل شده است",
                textAlign: TextAlign.end,  style: TextStyle(
                fontFamily: 'IranSANS',
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
                color:ColorsApp.primary,
              ),
              ),
            ),
          ),
        );

      },
    ):const SizedBox();
    return GetX<ChatController>(
        init:Get.put(ChatController()),
        builder: (chatController) {
          return  WillPopScope(
            onWillPop: () =>chatController.handleWillPop(context),
            child: Scaffold(
              backgroundColor: ColorsApp.white,
              body: SizedBox(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                        margin: EdgeInsets.only(
                            top: SizeConfig.screenHeight / 8.5,
                            bottom: SizeConfig.screenHeight / 13),
                        height: SizeConfig.screenHeight,
                        width: SizeConfig.screenWidth,
                        child: ListView.builder(
                            shrinkWrap: true,
                            key: chatController.chatListKey,
                            controller: chatController.scrollController,
                            reverse: true,
                            itemCount:  ChatController.listMessages.length,
                            itemBuilder: (context, index) {
                              return Container(
                                  child: ChatController.listMessages[index].type == 1
                                      ? TextMessageComponent(
                                    isColleagueMessage:
                                    ChatController.listMessages[index].isColleagueMessage,
                                    isMyMessage: ChatController.listMessages[index].isMyMessage,
                                    message: ChatController.listMessages[index],
                                  )
                                      :ChatController.listMessages[index].type == 3
                                      ? ImageMessageComponent(
                                    isColleagueMessage: ChatController.listMessages[index]
                                        .isColleagueMessage,
                                    isMyMessage:
                                    ChatController.listMessages[index].isMyMessage,
                                    message: ChatController.listMessages[index],
                                  )
                                      : ChatController.listMessages[index].type == 4
                                      ?VideoMessageComponent(
                                    isColleagueMessage: ChatController.listMessages[index]
                                        .isColleagueMessage,
                                    isMyMessage:
                                    ChatController.listMessages[index].isMyMessage,
                                    message: ChatController.listMessages[index],
                                  )
                                      : ChatController.listMessages[index].type == 5
                                      ? VoiceMessageComponent(
                                    isColleagueMessage: ChatController.listMessages[index]
                                        .isColleagueMessage,
                                    isMyMessage:
                                    ChatController.listMessages[index].isMyMessage,
                                    message: ChatController.listMessages[index],
                                  )
                                      :ChatController.listMessages[index].type == 2
                                      ? FileMessageComponent(
                                    isColleagueMessage: ChatController.listMessages[index]
                                        .isColleagueMessage,
                                    isMyMessage:
                                    ChatController.listMessages[index].isMyMessage,
                                    message: ChatController.listMessages[index],
                                  )
                                      : DateTimeComponent(
                                    message: ChatController.listMessages[index],
                                  ));

                            }),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: SizeConfig.screenHeight / 6,
                        width: SizeConfig.screenWidth,
                        decoration: const BoxDecoration(
                            color: ColorsApp.primary,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(32),
                                bottomRight: Radius.circular(32))),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Container(
                            // width: SizeConfig.screenWidth/1.5,
                            padding: EdgeInsets.only(
                                top: SizeConfig.screenHeight / 5 / 4),
                            child: ListTile(
                              // contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                              leading: GestureDetector(
                                onTap: (){
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        backgroundColor: Colors.white,
                                        contentPadding: EdgeInsets.zero,
                                        content: Hero(
                                          tag: "chat",
                                          transitionOnUserGestures: true,
                                          child: Container(
                                              padding: const EdgeInsets.only(top: 25,right: 20,left: 20,bottom: 20),
                                              decoration: const BoxDecoration(
                                                  borderRadius:BorderRadius.all(Radius.circular(10)),
                                                  boxShadow: [
                                                    BoxShadow(color: ColorsApp.textUnSelected,blurRadius: 70,offset: Offset.zero,spreadRadius:0.2,blurStyle: BlurStyle.solid)
                                                  ],
                                                  color: ColorsApp.white
                                              ),
                                              height: SizeConfig.screenHeight/2.2,
                                              width: SizeConfig.screenWidth/1.2,
                                              child:  Image.network(chatController.chatPageModel!.chatPic)
                                          ),
                                        ),
                                      );

                                    },
                                  );
                                },
                                child: Hero(
                                  transitionOnUserGestures: true,
                                  tag: "chat",
                                  child: Container(
                                    width: 55,
                                    height: 55,
                                    padding: const EdgeInsets.all(2.5),
                                    decoration: const BoxDecoration(
                                        color: ColorsApp.white,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          chatController.chatPageModel!.chatPic),
                                      radius: 25,
                                    ),
                                  ),
                                ),
                              ),
                              title: Row(
                                children: [
                                  Container(
                                    width: SizeConfig.screenWidth/3,
                                    child: Wrap(
                                      children: [
                                        Text(
                                          chatController.chatPageModel!.chatName,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: ColorsApp.white,
                                              fontFamily: "IranSANS"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                 chatController.isInfo.value? Container(
                                    height: 20,width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                                      color:chatController.supportCheckUserModel1!.hasCourse && chatController.supportCheckUserModel1!.hasSupport?
                                        ColorsApp.green :chatController.supportCheckUserModel1!.hasCourse==false && chatController.supportCheckUserModel1!.hasSupport?
                                          ColorsApp.yellow:ColorsApp.red
                                    ),
                                  ):Container()
                                ],
                              ),
                              subtitle: Text(
                                chatController.chatPageModel!.chatDetail,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: ColorsApp.white,
                                    fontFamily: "IranSANS"),
                              ),

                              trailing: SizedBox(
                                width: SizeConfig.screenWidth / 5,
                                child: Row(
                                  children: [
                                    chatController.box.read("role") == 4
                                        ? GestureDetector(
                                      onTap: () {
                                        chatController.infoUser(
                                            chatController
                                                .chatPageModel!.chatPhone,
                                            context);
                                      },
                                      child: SizedBox(
                                        height: 25,
                                        width: 25,
                                        child: SvgPicture.asset(
                                          "${ConstAddress.icon}info4.svg",
                                          color: ColorsApp.white,
                                        ),
                                      ),
                                    )
                                        : const SizedBox(),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        chatController.exitChatPage();
                                        Get.back();
                                        chatController.onClose();
                                        ChatController.listChat.clear();
                                        chatController.chatsList(1,10,"");
                                      },
                                      child: SizedBox(
                                        height: 25,
                                        width: 25,
                                        child: SvgPicture.asset(
                                          "${ConstAddress.icon}arrowLeft.svg",
                                          color: ColorsApp.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: SizeConfig.screenHeight / 10,
                          width: SizeConfig.screenWidth,
                          decoration: BoxDecoration(
                              color: ColorsApp.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(32),
                                  topRight: Radius.circular(32)),
                              boxShadow: [
                                BoxShadow(
                                    color:
                                    ColorsApp.textColorSub.withOpacity(0.7),
                                    blurRadius: 30)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (chatController.isChecked.value) {
                                        chatController.chatListKey.currentState?.insertItem(0);
                                        ChatController.listMessages.insert(0,Message(isGetServer: false,
                                            id: chatController.idSendMessage,
                                            chatId: 0,
                                            message: chatController
                                                .messageController.text,
                                            isView: false,
                                            isReceive: false,
                                            isMyMessage: true,
                                            isColleagueMessage: false,
                                            senderId: 0,
                                            date: chatController.now,
                                            showDate: "${chatController.now.hour} : ${chatController.now.minute}",
                                            type: 1,
                                            senderName: "",
                                            file: null, url: '', name: chatController
                                                .messageController.text));

                                        chatController.isChecked.value = false;
                                        chatController.sendMessage(
                                            chatController.chatPageModel!.chatId,
                                            chatController.messageController.text,
                                            1,chatController.idSendMessage.toString());
                                        chatController.messageController.text =
                                        "";
                                      } else {
                                        showCupertinoModalBottomSheet(
                                            expand: false,
                                            context: context,
                                            useRootNavigator: true,
                                            backgroundColor: ColorsApp.white,
                                            builder: (BuildContext context) =>
                                                ModelAudioChat(
                                                  onStop: (String path) {
                                                    chatController
                                                        .getAudioPath(path);
                                                  },
                                                  callBack: () {
                                                    print(chatController
                                                        .audioPath.value);
                                                    chatController.chatListKey.currentState?.insertItem(0);
                                                    ChatController.listMessages.insert(0,Message(isGetServer: false,
                                                        id: chatController.idSendMessage,
                                                        chatId: 0,
                                                        message:
                                                        chatController
                                                            .audioPath
                                                            .value,
                                                        isView: false,
                                                        isReceive: false,
                                                        isMyMessage: true,
                                                        isColleagueMessage:
                                                        false,
                                                        senderId: 0,
                                                        date: chatController.now,
                                                        showDate:
                                                        "${chatController.now.hour} : ${chatController.now.minute}",
                                                        type: 5,
                                                        senderName: "",
                                                        file: null, url: '', name: chatController
                                                            .audioPath
                                                            .value));
                                                    chatController.uploadFile(chatController.box.read("userId").toString(), context,chatController.fileAudio,5);

                                                    // List<int> imageBytes =
                                                    // chatController
                                                    //     .fileAudio!
                                                    //     .readAsBytesSync();
                                                    // String base64Image =
                                                    // base64Encode(
                                                    //     imageBytes);
                                                    // appController.sendMessage(
                                                    //     chatController.chatPageModel!.chatId,
                                                    //     base64Image
                                                    //     ,
                                                    //     5);
                                                  }, onStopFile: (File file) {
                                                  chatController.getAudioFile(file);
                                                },
                                                ));
                                      }

                                    },

                                    child: CircleAvatar(
                                      radius: 22,
                                      child:
                                      chatController.isChecked.value == false
                                          ? SvgPicture.asset(
                                        "${ConstAddress.icon}Voice.svg",
                                        color: ColorsApp.white,

                                        height: 25,
                                        width: 25,
                                      )
                                          : Image.asset(
                                        "${ConstAddress.image}sendM.png",
                                        color: ColorsApp.white,
                                        matchTextDirection: true,
                                        height: 22,
                                        width: 22,
                                      ),
                                      backgroundColor: ColorsApp.primary,
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 50,
                                  width: SizeConfig.screenWidth / 1.3,
                                  child: TextField(
                                    controller: chatController.messageController,
                                    cursorColor: Colors.grey,
                                    onChanged: (value) {
                                      chatController.checkTextMessage();
                                    },
                                    onEditingComplete: () =>
                                        FocusScope.of(context).nextFocus(),
                                    autofocus: false,
                                    //controller: controllerPhone,
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      fontSize: 17.0,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    decoration: InputDecoration(
                                      fillColor: ColorsApp.backTextField,
                                      filled: true,
                                      prefixIcon: GestureDetector(
                                        onTap: () {
                                          showCupertinoModalBottomSheet(
                                              expand: false,
                                              context: context,
                                              useRootNavigator: true,
                                              backgroundColor: ColorsApp.white,
                                              builder: (BuildContext context) =>
                                                  ModelPickerChat(
                                                    onStop: (String path) {},
                                                    callBackGallery: () async {
                                                      Get.back();
                                                      final result =
                                                      await ImagePicker()
                                                          .pickImage(
                                                          source:
                                                          ImageSource
                                                              .gallery);
                                                      if (result != null) {
                                                        CroppedFile? ff =
                                                        await ImageCropper()
                                                            .cropImage(
                                                          sourcePath: result.path,
                                                          aspectRatioPresets: [
                                                            CropAspectRatioPreset
                                                                .square,
                                                            CropAspectRatioPreset
                                                                .original,
                                                            CropAspectRatioPreset
                                                                .ratio3x2,
                                                            CropAspectRatioPreset
                                                                .ratio4x3,
                                                            CropAspectRatioPreset
                                                                .ratio5x3,
                                                            CropAspectRatioPreset
                                                                .ratio5x4,
                                                            CropAspectRatioPreset
                                                                .ratio7x5,
                                                            CropAspectRatioPreset
                                                                .ratio16x9,
                                                          ],
                                                        );
                                                        if (ff != null) {
                                                          chatController.file =
                                                              File(ff.path);

                                                          chatController
                                                              .getLoadingFile(
                                                              true);
                                                          if (chatController
                                                              .file !=
                                                              null) {
                                                            List<int> imageBytes =
                                                            chatController
                                                                .file!
                                                                .readAsBytesSync();
                                                            String base64Image =
                                                            base64Encode(
                                                                imageBytes);
                                                            chatController.uploadFile(chatController.box.read("userId").toString(), context,chatController.file,3);
                                                            chatController.chatListKey.currentState?.insertItem(0);
                                                            ChatController.listMessages.insert(0,Message(isGetServer: false,
                                                                id: chatController.idSendMessage,
                                                                chatId: 0,
                                                                message:
                                                                chatController
                                                                    .file!
                                                                    .path,
                                                                isView: false,
                                                                isReceive: false,
                                                                isMyMessage: true,
                                                                isColleagueMessage:
                                                                false,
                                                                senderId: 0,
                                                                date: chatController.now,
                                                                showDate:
                                                                "${chatController.now.hour} : ${chatController.now.minute}",
                                                                type: 3,
                                                                senderName: "",
                                                                file:
                                                                chatController
                                                                    .file, url: '', name: chatController
                                                                    .file!
                                                                    .path));


                                                            chatController
                                                                .getLoadingFile(
                                                                false);
                                                          }
                                                        }
                                                      }
                                                    },
                                                    callBackCamera: () async {
                                                      Get.back();
                                                      final result =
                                                      await ImagePicker()
                                                          .pickImage(
                                                          source:
                                                          ImageSource
                                                              .camera);
                                                      if (result != null) {
                                                        CroppedFile? ff =
                                                        await ImageCropper()
                                                            .cropImage(
                                                          sourcePath: result.path,
                                                          aspectRatioPresets: [
                                                            CropAspectRatioPreset
                                                                .square,
                                                            CropAspectRatioPreset
                                                                .original,
                                                            CropAspectRatioPreset
                                                                .ratio3x2,
                                                            CropAspectRatioPreset
                                                                .ratio4x3,
                                                            CropAspectRatioPreset
                                                                .ratio5x3,
                                                            CropAspectRatioPreset
                                                                .ratio5x4,
                                                            CropAspectRatioPreset
                                                                .ratio7x5,
                                                            CropAspectRatioPreset
                                                                .ratio16x9,
                                                          ],
                                                        );
                                                        if (ff != null) {
                                                          chatController.file =
                                                              File(ff.path);

                                                          chatController
                                                              .getLoadingFile(
                                                              true);
                                                          if (chatController
                                                              .file !=
                                                              null) {
                                                            List<int> imageBytes =
                                                            chatController
                                                                .file!
                                                                .readAsBytesSync();
                                                            String base64Image =
                                                            base64Encode(
                                                                imageBytes);
                                                            chatController.uploadFile(chatController.box.read("userId").toString(), context,chatController.file,3);
                                                            chatController.chatListKey.currentState?.insertItem(0);
                                                            ChatController.listMessages.insert(0,Message(isGetServer: false,
                                                                id: chatController.idSendMessage,
                                                                chatId: 0,
                                                                message:
                                                                chatController
                                                                    .file!
                                                                    .path,
                                                                isView: false,
                                                                isReceive: false,
                                                                isMyMessage: true,
                                                                isColleagueMessage:
                                                                false,
                                                                senderId: 0,
                                                                date:chatController. now,
                                                                showDate:
                                                                "${chatController.now.hour} : ${chatController.now.minute}",
                                                                type: 3,
                                                                senderName: "",
                                                                file:
                                                                chatController
                                                                    .file, url: '', name:  chatController
                                                                  .file!
                                                                  .path,));
                                                            chatController
                                                                .getLoadingFile(
                                                                false);
                                                          }
                                                        }
                                                      }
                                                    },

                                                    callBackMusic: () async {
                                                      Get.back();
                                                      FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.audio);
                                                      if (result != null) {
                                                        chatController.file =
                                                            File(result.files.single.path!);
                                                        chatController
                                                            .getLoadingFile(
                                                            true);
                                                        if (chatController
                                                            .file !=
                                                            null) {
                                                          chatController.uploadFile(chatController.box.read("userId").toString(), context,chatController.file,5);
                                                          chatController.chatListKey.currentState?.insertItem(0);
                                                          ChatController.listMessages.insert(0,Message(isGetServer: false,
                                                              id: chatController.idSendMessage,
                                                              chatId: 0,
                                                              message:
                                                              chatController
                                                                  .file!
                                                                  .path,
                                                              isView: false,
                                                              isReceive: false,
                                                              isMyMessage: true,
                                                              isColleagueMessage:
                                                              false,
                                                              senderId: 0,
                                                              date:chatController. now,
                                                              showDate:
                                                              "${chatController.now.hour} : ${chatController.now.minute}",
                                                              type: 5,
                                                              senderName: "",
                                                              file: null, url: '', name: chatController
                                                                .file!
                                                                .path,
                                                          ));
                                                          chatController
                                                              .getLoadingFile(
                                                              false);
                                                        }

                                                      }
                                                    },
                                                    callBackFile: () async {
                                                      Get.back();
                                                      FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);
                                                      if (result != null) {
                                                        chatController.file =
                                                            File(result.files.single.path!);
                                                        chatController
                                                            .getLoadingFile(
                                                            true);
                                                        if (chatController
                                                            .file !=
                                                            null) {
                                                          chatController.uploadFileFile(chatController.box.read("userId").toString(), context,chatController.file,2);
                                                          chatController
                                                              .getLoadingFile(

                                                              false);
                                                        }

                                                      }
                                                    }, callBackVideo: ()async{
                                                    Get.back();
                                                    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.video);
                                                    if (result != null) {
                                                      chatController.getVideoFile(File(result.files.single.path!));
                                                      chatController
                                                          .getLoadingFile(
                                                          true);
                                                      if (chatController
                                                          .fileV !=
                                                          null)  {
                                                        chatController.uploadFileV(chatController.box.read("userId").toString(), context,chatController.fileV,4);
                                                        chatController
                                                            .getLoadingFile(
                                                            false);

                                                      }

                                                    }
                                                  },
                                                  ));
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(7),
                                          margin: const EdgeInsets.only(left: 10),
                                          child:chatController.idUpload.value? SizedBox(
                                              height: 60,width: 60,
                                              child:Lottie.asset(ConstAddress.lottie + "loading2.json")): SvgPicture.asset(
                                            "${ConstAddress.icon}Plus.svg",
                                            color: ColorsApp.iconTextField,
                                          ),
                                        ),
                                      ),
                                      counterText: "",
                                      contentPadding: const EdgeInsets.only(
                                          left: 16, right: 5),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(32),
                                        borderSide: const BorderSide(
                                          color: ColorsApp.backTextField,
                                          width: 0.7,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: ColorsApp.backTextField,
                                          width: 0.7,
                                        ),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: ColorsApp.backTextField,
                                          width: 0.7,
                                        ),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      hintText: " .... اینجا بنویسید ",
                                      hintStyle: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                          color: ColorsApp.iconTextField,
                                          fontFamily: 'IranSANS'),
                                    ),
                                    maxLines: 1,
                                    keyboardType: TextInputType.emailAddress,
                                    // maxLength: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

