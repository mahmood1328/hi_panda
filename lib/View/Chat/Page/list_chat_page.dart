import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Components/item_list_chat.dart';
import '../Components/loading_chat_list.dart';
import '../Controller/chat_controller.dart';

class ListChatPage extends StatelessWidget {
  const ListChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chatController=Get.put(ChatController());
    return GetX<ChatController>(
        init: Get.put(ChatController()),
        builder: (chatController) {
          return chatController.isLoadingChatList.value
              ? Scaffold(
                  backgroundColor: ColorsApp.white,
                  body: Stack(
                    children: [
                      SizedBox(
                        height: SizeConfig.screenHeight,
                        width: SizeConfig.screenWidth,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              // Container(
                              //   height:40,
                              //   width:SizeConfig.screenWidth,
                              //   decoration: const BoxDecoration(
                              //     color: ColorsApp.primary,
                              //     borderRadius:BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                              //     //border: Border.all(width: 1,color: ColorsApp.primaryLight.withOpacity(0.3))
                              //
                              //   ),
                              // ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20,),
                                child: TextField(
                                  controller:chatController. controllerSearch,

                                  cursorColor: Colors.grey,
                                  onChanged: (value) {},
                                  onEditingComplete: () =>
                                      FocusScope.of(context).nextFocus(),
//                  autofocus: true,
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
                                      onTap: (){
                                        ChatController.listChat.clear();
                                        chatController.chatsList(1,10,chatController.controllerSearch.text);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(7),
                                        margin: const EdgeInsets.only(left: 10),
                                        child: SvgPicture.asset(
                                          "${ConstAddress.icon}Search.svg",
                                          color: ColorsApp.iconTextField,
                                        ),
                                      ),
                                    ),
                                    counterText: "",
                                    contentPadding:
                                        const EdgeInsets.only(left: 16, right: 5),
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
                                    hintText: "جستجو ",
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
                              ChatController.listChat.isEmpty
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                          top: SizeConfig.screenHeight / 4),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            ConstAddress.image + "nochat.png",
                                            color: ColorsApp.iconTextField,
                                          ),
                                          const Text(
                                            "موردی یافت نشد ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: ColorsApp.iconTextField,
                                                fontFamily: "IranSANS"),
                                          ),

                                        ],
                                      ),
                                    )
                                  : SizedBox(),
                              SizedBox(
                                height: SizeConfig.screenHeight -
                                    SizeConfig.screenHeight / 4,
                                width: SizeConfig.screenWidth,
                                child:RefreshIndicator(
                                  color: ColorsApp.white,
                                  backgroundColor: ColorsApp.primary,
                                  onRefresh: () =>chatController.fetchFruit(),
                                  child: ListView.builder(
                                      key: chatController.chatListKeyList,
                                      controller:
                                      chatController.scrollControllerChat,
                                      physics: const BouncingScrollPhysics(),
                                      reverse: false,
                                      itemCount: ChatController
                                          .listChat.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                            child: ItemListChatComponent(
                                              chat: ChatController
                                                  .listChat[index],
                                            ));
                                      }),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      chatController.isLoadingScroll.value?  const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: CircularProgressIndicator(color: ColorsApp.primary,),
                        ),
                      ):const SizedBox(),
                    ],
                  ),
                )
              : const LoadingChatList();
        });
  }
}
