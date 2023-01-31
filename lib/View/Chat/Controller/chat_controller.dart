
import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:signalr_core/signalr_core.dart';
import '../../../Controller/controller_main_page.dart';
import '../../../Models/SignalR_Model/chat_get_server_model.dart'as getServer;
import '../../../Models/SignalR_Model/status_chat_model.dart' as statusModel;
import '../../../Network/service_helper.dart';
import '../../../Network/service_url.dart';
import '../../../Repository/chat.dart';
import '../../../Widget/modal_info_message.dart';
import '../../../Widget/snackbar.dart';
import '../../../utils/dialog.dart';
import '../../../utils/res/colors.dart';
import '../Model/chat_messages_model.dart';
import '../Model/chat_messages_model.dart'as messages;
import '../Model/chat_page_model.dart';
import '../Model/support_check_user_model.dart';
import '../Model/support_page_model.dart';
import '../Model/supports_model.dart'as chatModel;
import '../Page/chat_detail_page.dart';

class ChatController extends GetxController{
  late final ChatRepository _repository;
  late ScrollController scrollController;
  late ScrollController scrollControllerChat;
  final chatListKey = GlobalKey<AnimatedListState>();
  final chatListKeyList = GlobalKey<AnimatedListState>();
  var isLoading=false.obs;
  var isChecked=false.obs;
  var idUpload=false.obs;
  var isLock=false.obs;
  var isInfo=false.obs;
  var isLoadingList=false.obs;
  var audioPath="".obs;
  var idSendMessage=-2.obs;
  var typeSendMessage=0.obs;
  var isLoadingChatList=false.obs;
  var box=GetStorage();
  File? file;
  File? fileV;
  File? fileAudio;
  String? imageAddress;
  var fileId=0.obs;
  var loadingFile = false.obs;
  final TextEditingController messageController = TextEditingController();
  final TextEditingController controllerSearch = TextEditingController();
  SupportPageModel? supportPageModel;
  chatModel. SupportsModel? supportsModel;
  SupportCheckUserModel? supportCheckUserModel;
  SupportCheckUserModel? supportCheckUserModel1;
  ChatPageModel? chatPageModel;
  ChatMessagesModel? chatMessagesModel;
  //var listChat=<chatModel.Chat>[].obs;
  static RxList listChat=[].obs;
  var listBuy=<chatModel.Chat>[].obs;
  var listCourse=<Course>[].obs;
 // var listMessages=<Message>[].obs;
  static RxList listMessages=[].obs;
  late final ServiceHelper _helper = ServiceHelper();
  getServer.ChatGetServerModel? chatGetServerModel;
  statusModel. StatusChatModel? statusChatModel;
  var countListChat=0.obs;
  //Message? messageModel;
  var role="".obs;
  final connection = HubConnectionBuilder().withUrl(ServiceURL.baseUrl + "chatHub",
      HttpConnectionOptions(
        logging: (level, message) => print(message),
      )).build();

  getConnectionId()async {
    await  connection.start();
    await  connection.invoke('GetConnectionId')
        .then((connectionId) {
      box.write("connectionId", connectionId);
      connection.invoke("SetConnectionId",args:[0, connectionId, box.read("userId"), 4] );
      print("$connectionId hhhhhhhhhhhhhhh");
    });

  }

  reConnectSignalR()async{
    connection.onclose((exception) {
      getConnectionId();
      exception.reactive;
      print("reactive : reactive on SignalR");
    });
  }
  receiveMessage(){
    connection.on('ReceiveMessage', (message)
    {
      isLoadingList.value=false;
      print("${message.toString()}mmmmmmmmmm");
      var type  = message![0]["type"];
      var data  = message[0]["data"];
      print("${type}kkkkkkkkkkkkkk");
      print("${data}kkkkkkkkkkkkkk");
      if(type==2){
        chatGetServerModel= getServer.ChatGetServerModel.fromJson(data);
        print("setConnectionId : ${chatGetServerModel!.id}");
        for(int i=0;i<listMessages.length;i++){
          if(listMessages[i].id==-2){
            print(listMessages[i].id);
            listMessages[i].id=chatGetServerModel!.id;
          }
          if(listMessages[i].id==chatGetServerModel!.id){
            if(chatGetServerModel!.status==2){
              listMessages[i].isReceive=true;
            }else if(chatGetServerModel!.status==3){
              listMessages[i].isView=true;
            }else if(chatGetServerModel!.status==1){
              listMessages[i].isGetServer=true;
            }
          }
        }listMessages.refresh();
        update();
      }
      else if(type==3){

        var mess=messages.Message.fromJson(message[0]["data"]);
        chatListKey.currentState?.insertItem(0);
        listMessages.insert(0,messages.Message.fromJson(message[0]["data"]));
        print("message : ${mess.message}");
        print("message : ${listMessages.first.name}");
        print(listMessages[0].name);
        print(listMessages[1].name);
        print(listMessages.length);
        listMessages.refresh();
        update();

      }
      else if(type==4) {
        statusChatModel= statusModel.StatusChatModel.fromJson(data);
        for(int i=0;i<listMessages.length;i++){
          if(listMessages[i].id==statusChatModel!.id){

            if(statusChatModel!.status==2){
              listMessages[i].isReceive=true;
            }else if(statusChatModel!.status==3){
              listMessages[i].isView=true;
            }else if(statusChatModel!.status==1){
              listMessages[i].isGetServer=true;
            }
          }
        }
        listMessages.refresh();
        update();
      }
      else if(type==5){
        print(chatModel.Chat.fromJson(data));
        for(int i=0;i<listChat.length;i++){
          if(chatModel.Chat.fromJson(data).chatId==listChat[i].chatId){
            listChat.remove(listChat[i]);
          }
        }
        chatListKeyList.currentState?.insertItem(0);
        listChat.insert(0,chatModel.Chat.fromJson(data));
        print("chat : ${chatModel.Chat.fromJson(data)}");

        listChat.refresh();

      }
      else if(type==7){
        print("Count : ${data["Count"]}");
        countListChat.value=data["Count"];
      }
      else if(type==1){
        GetSnackBar snackBar=GetSnackBar(backgroundColor: ColorsApp.white,messageText:GestureDetector(
            onTap: (){
              Get.back();
              listMessages.removeAt(0);
            },
            child: Text( data["text"],textDirection: TextDirection.rtl,
              style:
              const TextStyle(fontSize: 15 , fontWeight: FontWeight.w500 ,
                  color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),
            )),titleText:Text( "خطا",textDirection: TextDirection.rtl,
          style:
          const TextStyle(fontSize: 18 , fontWeight: FontWeight.w500 ,
              color: ColorsApp.colorTextTitle,fontFamily: "IranSANS"),),
        );
        Get.showSnackbar(snackBar);
        update();
      }

      update();
      //listMessages.refresh();
    });
  }
  sendMessage(int chatId,String message,int messageType,String tempId)async{
    await connection.invoke('SendMessage', args: [box.read("userId"),chatId,message,messageType, tempId,"" ]);
  }


  setConnectionId(int chatId,int pageType)async{
    await connection.invoke('SetConnectionId', args: [chatId,box.read("connectionId"),box.read("userId"),pageType ]);
  }
  chatGet(String tempId,int id,int status)async{
    await connection.invoke('SetConnectionId', args: [tempId,id,status ]);
  }


  void scrollToBottom() {
    final bottomOffset = scrollController.position.maxScrollExtent;
    scrollController.animateTo(
      bottomOffset,
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }
  getAudioPath(String path){
    audioPath.value=path;
  }

  getAudioFile(File file){
    fileAudio=file;
  }
  getVideoFile(File fileed){
    fileV=fileed;
  }

  getLoadingFile(bool loading){
    loadingFile.value=loading;

  }
  checkTextMessage(){
    if(messageController.text!=""){
      isChecked.value=true;
    }else if(messageController.text==""){
      isChecked.value=false;
    }
  }
  // @override
  // void onClose() {
  //   // TODO: implement onClose
  //   super.onClose();
  //   chatsList(1,10,"");
  // }

  var hasPage=false.obs;
  var pager=1.obs;
  var isLoadingScroll=false.obs;
  @override
  void onReady() {
    super.onReady();
    reConnectSignalR();
    scrollControllerChat.addListener(() {
      if (scrollControllerChat.offset >= scrollControllerChat.position.maxScrollExtent &&
          !scrollControllerChat.position.outOfRange) {

        if(hasPage.value==false){
          return;
        }else{
          isLoadingScroll.value=true;
          pager.value+=1;
          chatsList(pager.value,10,"");
        }

      }
      // if (scrollController.offset <= scrollController.position.minScrollExtent &&
      //     !scrollController.position.allowImplicitScrolling) {
      //   isLoading.value=true;
      //   consultList(1,10,showFilter.value,
      //       callFilter.value,chatFilter.value,
      //       buyFilter.value,-1,controllerSearch.text);
      // }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    chatsList(1,10,"");
  }
  @override
  void onInit() {

    _repository = ChatRepository();
    super.onInit();
    chatsList(1,10,"");
    scrollController = ScrollController();
    scrollControllerChat = ScrollController();
    getConnectionId();
    isLoadingList.value=false;
    receiveMessage();
    supportPage();
  }

  late OverlayEntry overlayEntry;
  showProgress(BuildContext context){
    overlayEntry = OverlayEntry(builder: (c) {
      return const FunkyOverlay();
    });
    Overlay.of(context)!.insert(overlayEntry);
  }

  removeProgress(){
    overlayEntry.remove();
  }

  supportPage() async {
    isLoading.value=false;
    await _repository.supportPage().then((value) {
      try {
        if(value.title!=""){
       supportPageModel=value;
       isLoading.value=true;
        }else{

        }

      } catch (e) {
        print(e.toString());
      }
    }).catchError((value) {
      print(value.toString());

    });
  }
  final now = DateTime.now();
  var appController = Get.put(AppController());
  uploadFile(String useId,BuildContext context,File? file,int type) async {
    idUpload.value=true;
    await _helper.imageProfile("MainApp/FileUpload",
        file: file,keyName: "fileUpload",
        data: {"url":useId,}).then((value) {

      try {
        print(value!["fileId"]);
        fileId.value=value["fileId"];
        sendMessage(
            chatPageModel!.chatId,
            fileId.value.toString()
            ,
            type,idSendMessage.toString());
        idUpload.value=false;
      } catch (e) {
        // ShowSnackBar().showSnackBar(
        //   context,
        //   e.toString(),duration: const Duration(seconds: 5),
        // );
      }
    }).catchError((value) {
      print(value);
      ShowSnackBar().showSnackBar(
        context,
        value.toString(),duration: const Duration(seconds: 5),
      );
    });
  }

  uploadFileV(String useId,BuildContext context,File? file,int type) async {
    idUpload.value=true;
    await _helper.imageProfile("MainApp/FileUpload",
        file: file,keyName: "fileUpload",
        data: {"url":useId,}).then((value) {

      try {
        print(value!["fileId"]);
        fileId.value=value["fileId"];
        sendMessage(
            chatPageModel!.chatId,
            fileId.value.toString()
            ,
            type,idSendMessage.toString());
        chatListKey.currentState?.insertItem(0);
        listMessages.insert(0,Message(
            id: idSendMessage,
            chatId: 0,
            message:
            "",
            isView: false,
            isReceive: false,
            isMyMessage: true,
            isColleagueMessage:
            false,
            senderId: 0,
            date: now,
            showDate:
            "${now.hour} : ${now.minute}",
            type: 4,
            senderName: "",
            file: file, url: '', isGetServer: false, name: ''));
        print(listMessages[0].name);
        print(listMessages[1].name);
        print(listMessages.length);
        idUpload.value=false;
      } catch (e) {
        // ShowSnackBar().showSnackBar(
        //   context,
        //   e.toString(),duration: const Duration(seconds: 5),
        // );
      }
    }).catchError((value) {
      print(value);
      ShowSnackBar().showSnackBar(
        context,
        value.toString(),duration: const Duration(seconds: 5),
      );
    });
  }


  uploadFileFile(String useId,BuildContext context,File? file,int type) async {
    idUpload.value=true;
    await _helper.imageProfile("MainApp/FileUpload",
        file: file,keyName: "fileUpload",
        data: {"url":useId,}).then((value) {

      try {
        print(value!["fileId"]);
        fileId.value=value["fileId"];

        sendMessage(
            chatPageModel!.chatId,
            fileId.value.toString()
            ,
            type,idSendMessage.toString());
        chatListKey.currentState?.insertItem(0);
        listMessages.insert(0,Message(isGetServer: false,
            id: idSendMessage,
            chatId: 0,
            message:ServiceURL.baseUrl+ value["file"],
            isView: false,
            isReceive: false,
            isMyMessage: true,
            isColleagueMessage:
            false,
            senderId: 0,
            date: now,
            showDate:
            "${now.hour} : ${now.minute}",
            type: 2,
            senderName: "",
            file:
           file, url: '', name:  value["name"]));

        idUpload.value=false;
      } catch (e) {
        // ShowSnackBar().showSnackBar(
        //   context,
        //   e.toString(),duration: const Duration(seconds: 5),
        // );


        //https://hasanamiri.com//File/UserUpload/23/icons8-camera-64.png
      }
    }).catchError((value) {
      print(value);
      ShowSnackBar().showSnackBar(
        context,
        value.toString(),duration: const Duration(seconds: 5),
      );
    });
  }

  chatsList(int page,int pageSize,String search) async {
    isLoadingChatList.value=false;
    listChat.clear();
    await _repository.supports(page, pageSize, search).then((value) {
      try {
        if(value!=""){
          supportsModel=value;
          hasPage.value=supportsModel!.hasNextPage;
          listChat.addAll(supportsModel!.chats);
          isLoadingChatList.value=true;
          isLoadingScroll.value=false;

        }else{

        }

      } catch (e) {
        print(e.toString());
      }
    }).catchError((value) {
      print(value.toString());

    });
  }


  buysList(int page,int pageSize,String search) async {
    isLoading.value=false;
    await _repository.buys(page, pageSize, search).then((value) {
      try {
        if(value!=""){
          listBuy.addAll(value.chats);
          isLoading.value=true;
        }else{
        }

      } catch (e) {
        print(e.toString());
      }
    }).catchError((value) {
      print(value.toString());

    });
  }


  chatUnlock(int id,BuildContext context) async {
    isLoading.value=false;
    await _repository.chatUnlock(id).then((value) {
      try {
        if(value!=""){
          ShowSnackBar().showSnackBar(
            context,
            "صفحه چت باز شد...",duration: const Duration(seconds: 5),
          );
          isLoading.value=true;
        }else{
          ShowSnackBar().showSnackBar(
            context,
            "خطا در باز کردن چت...",duration: const Duration(seconds: 5),
          );
        }

      } catch (e) {
        print(e.toString());
      }
    }).catchError((value) {
      print(value.toString());

    });
  }


  infoUser(String phoneNumber,BuildContext context) async {
    showProgress( context);
    listCourse.clear();
    await _repository.supportCheckUser(phoneNumber).then((value) {
      try {
        if(value!=""){
          supportCheckUserModel=value;
          listCourse.addAll(supportCheckUserModel!.courses);
          showCupertinoModalBottomSheet(
              expand: false,
              context: context,
              useRootNavigator: true,
              backgroundColor: ColorsApp.white,
              builder: (BuildContext context) =>

                  ModalInfoMessage(supportCheckUserModel:supportCheckUserModel!,));
          removeProgress();
        }else{


        }

      } catch (e) {
        print(e.toString());
        removeProgress();
      }
    }).catchError((value) {
      print(value.toString());
      removeProgress();
      ShowSnackBar().showSnackBar(
        context,
        "$value",duration: const Duration(seconds: 5),
      );

    });
  }

  infoUserPageChat(String phoneNumber,BuildContext context) async {
    isInfo.value=false;
    await _repository.supportCheckUser(phoneNumber).then((value) {
      try {
        if(value!=""){
          supportCheckUserModel1=value;
          isInfo.value=true;
        }else{
          isInfo.value=false;
        }

      } catch (e) {
        print(e.toString());
        isInfo.value=false;
      }
    }).catchError((value) {
      print(value.toString());
      isInfo.value=false;
    });
  }
  var rng = Random();

  exitChatPage(){
    setConnectionId(0, 1);
  }

  exitChatList(){
    setConnectionId(0, 4);
  }


  Future fetchFruit() async {
    chatsList(1,10,"");
  }


  chatPage(String id,BuildContext context) async {
    showProgress( context);
    listMessages.clear();
    await _repository.chatPage(id).then((value) {
      try {
        if(value!=""){
          chatPageModel=value;
          removeProgress();
          setConnectionId(int.parse(id), 3);
          Get.to(()=> ChatDetailPage());
          listMessages.addAll(chatPageModel!.messages!);


        }else{
        }

      } catch (e) {
        print(e.toString());
        removeProgress();
      }
    }).catchError((value) {
      print(value.toString());
      removeProgress();
    });
  }


  // chatMessages(int id,int page,BuildContext context) async {
  //   isLoading.value=false;
  //   await _repository.chatMessages(id,page).then((value) {
  //     try {
  //       if(value!=""){
  //         chatMessagesModel=value;
  //         listMessages.addAll(chatMessagesModel!.messages!);
  //         isLoading.value=true;
  //       }else{
  //
  //       }
  //
  //     } catch (e) {
  //       print(e.toString());
  //     }
  //   }).catchError((value) {
  //     print(value.toString());
  //
  //   });
  // }

  Future<bool> handleWillPop(BuildContext context) async {
    if (isLoading.value) {
      chatsList(1,10,"");
      return true;

    }
    chatsList(1,10,"");
    return true;
  }

}