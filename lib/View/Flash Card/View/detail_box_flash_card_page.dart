import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../Network/service_url.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/res/dimensions.dart';
import '../../../utils/size_config.dart';
import '../Controller/flash_card_controller.dart';

class DetailBoxFlashCardPage extends StatefulWidget {
  final String title;
  final int flashCardCategory;
  final int box;
  final  bool? next;
  final  bool? prev;
  const DetailBoxFlashCardPage({Key? key,required this.title,required this.box,required this.flashCardCategory,
    this.next,this.prev}) : super(key: key);

  @override
  State<DetailBoxFlashCardPage> createState() => _DetailBoxFlashCardPageState();
}

class _DetailBoxFlashCardPageState extends State<DetailBoxFlashCardPage> {

  TextToSpeech tts = TextToSpeech();
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GetX<FlashCardController>(
        init: Get.put(FlashCardController()),
        builder: (flashCardController) {
          return flashCardController.isKeyWord.value
              ? Scaffold(
            backgroundColor: ColorsApp.white,
            appBar: AppBar(
              backgroundColor: ColorsApp.primary,
              leading: GestureDetector(
                onTap: (){
                  flashCardController.getBox2(flashCardController.idFlash.value, context, flashCardController.titleFlash.value);
                },
                child: Container(
                  padding:const EdgeInsets.all(15),
                  margin:const EdgeInsets.only(left: 3),
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset(
                    "${ConstAddress.icon}arrowLeft.svg",color: ColorsApp.white,
                  ),
                ),
              ),
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:  [
                  Text(widget.title , style: const TextStyle(fontSize: 18 , fontWeight: FontWeight.bold , color: ColorsApp.white,fontFamily: "IranSANS"),textDirection: TextDirection.rtl),
                ],
              ),
            ),
            body: SizedBox(
              height:SizeConfig.screenHeight,
              width:SizeConfig.screenWidth,
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  contentPadding: EdgeInsets.zero,
                                  content: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration:  const BoxDecoration(
                                        borderRadius:
                                        BorderRadius.all(
                                            Radius.circular(
                                                15)),
                                        boxShadow: [
                                          BoxShadow(

                                              color: ColorsApp
                                                  .backTextField,
                                              blurRadius: 70,
                                              offset: Offset.zero,
                                              spreadRadius: 0.2,
                                              blurStyle:
                                              BlurStyle.solid)
                                        ],
                                        color: ColorsApp.white),
                                    height: SizeConfig.screenHeight / 1.5,
                                    width: SizeConfig.screenWidth / 1.1,
                                    child: WebView(
                                      onPageFinished: (String url) {
                                        print(
                                            'Page finished loading: $url');
                                      },
                                      initialUrl: '${ServiceURL
                                          .baseUrl}${flashCardController
                                          .getKeywordModel?.dictionary}',
                                      javascriptMode: JavascriptMode
                                          .unrestricted,
                                    ),
                                  ),
                                );
                              });},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "${ConstAddress.icon}translate2.svg",height: 40,width: 40,color: ColorsApp.iconTextField,
                            ),
                            const Text("لانگمن" , style: TextStyle(fontSize: 14 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                contentPadding: EdgeInsets.zero,
                                content: Container(
                                    padding: const EdgeInsets.only(
                                        top: 25,left: 10,right: 10,bottom: 10),
                                    decoration:  const BoxDecoration(
                                        borderRadius:
                                        BorderRadius.all(
                                            Radius.circular(
                                                15)),
                                        boxShadow: [
                                          BoxShadow(

                                              color: ColorsApp
                                                  .backTextField,
                                              blurRadius: 70,
                                              offset: Offset.zero,
                                              spreadRadius: 0.2,
                                              blurStyle:
                                              BlurStyle.solid)
                                        ],
                                        color: ColorsApp.white),
                                    height: SizeConfig.screenHeight / 1.5,
                                    width: SizeConfig.screenWidth / 1.1,

                                    child: Column(
                                      children: [
                                        Text(flashCardController.getKeywordModel!.sentence ,
                                          style: const TextStyle(fontSize: 16 , fontWeight: FontWeight.bold ,
                                              color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),
                                      ],
                                    )),
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "${ConstAddress.icon}jomle.svg",height: 40,width: 40,color: ColorsApp.iconTextField,
                            ),
                            const Text("جمله" , style: TextStyle(fontSize: 14 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          tts.speak(flashCardController.getKeywordModel!.keywrod);
                        },
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "${ConstAddress.icon}volume.svg",height: 40,width: 40,color: ColorsApp.iconTextField,
                            ),
                            const Text("صدا" , style: TextStyle(fontSize: 14 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  flashCardController.isFinish.value==false?
                  FlipCard(
                    side:flashCardController.isRotate.value? CardSide.BACK:CardSide.FRONT,
                    key: cardKey,
                    flipOnTouch: true,
                    front: Card(
                      color:   ColorsApp.white,
                      elevation: 0,
                      surfaceTintColor: Colors.grey,
                      shadowColor:Colors.grey ,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: ColorsApp.primary)
                      ),
                      semanticContainer: true,
                      clipBehavior: Clip.hardEdge,
                      child: GestureDetector(
                        onTap: () => cardKey.currentState?.toggleCard(),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          height:SizeConfig.screenHeight/2,
                          width:SizeConfig.screenWidth/1.22,
                          child: Text(flashCardController.getKeywordModel!.keywrod,
                            style: const TextStyle(fontSize: 30 ,wordSpacing: 2, fontWeight: FontWeight.bold , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),textAlign: TextAlign.justify,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                    ),
                    fill: Fill.fillBack,

                    back: Card(
                      color:   ColorsApp.white,
                      elevation: 0,
                      surfaceTintColor: Colors.grey,
                      shadowColor:Colors.grey ,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: ColorsApp.primary)
                      ),
                      semanticContainer: true,
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            alignment: Alignment.center,
                            width:SizeConfig.screenWidth,
                            padding: const EdgeInsets.only(top: 0),
                            color: ColorsApp.primary,
                            child: Align(
                                alignment: Alignment.topCenter,
                                child: Text(flashCardController.getKeywordModel!.text , style: const TextStyle(fontSize: 30 , fontWeight: FontWeight.bold , color: ColorsApp.white,fontFamily: "IranSANS"),)),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => cardKey.currentState?.toggleCard(),
                              child:Image.network(ServiceURL.baseUrl2+flashCardController.getKeywordModel!.photo,fit: BoxFit.contain,),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ):
                  Container(
                    decoration: BoxDecoration(
                        color: ColorsApp.backTextField,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: ColorsApp.backTextField)
                    ),
                    margin: EdgeInsets.only(top: SizeConfig.screenHeight/6,left: 60,right: 60),
                    padding:const EdgeInsets.only(top: 30,bottom: 30),
                    child: Column(
                      children: [
                        const Text("فلش کارت به پایان رسید" , style: TextStyle(fontSize: 14 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS")),
                        Padding(
                          padding:  const EdgeInsets.only(top: 20,left: 40,right: 40),
                          child: Center(
                            child: ElevatedButton(

                              style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all( Size(100, 40)),
                                  foregroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                                  backgroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(Dimensions.borderRadiusComponents),
                                          side: const BorderSide(color:ColorsApp.primary)
                                      )
                                  )
                              ),

                              onPressed: () {
                                flashCardController.getBox2(flashCardController.idFlash.value, context, flashCardController.titleFlash.value);
                              },
                              child: const Text(
                                "برگشت",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                    color: ColorsApp.white),
                                textAlign: TextAlign.center,
                              ),),
                          ),
                        ),
                      ],
                    ),
                  )  ,
                  Spacer(),
                  Container(
                    color: ColorsApp.iconTextField,
                    height: 0.7,
                    width:SizeConfig.screenWidth,
                  ),
                  flashCardController.isFinish.value?const SizedBox() : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                       widget. prev==true? GestureDetector(
                          onTap: (){
                            flashCardController.keyWordSendToBox(flashCardController.getKeywordModel!.id,1, context, widget.flashCardCategory, widget.title,widget. box);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "${ConstAddress.icon}arrowL.svg",height: 30,width: 30,color: ColorsApp.iconTextField,
                              ),
                              const Text("PackA" , style: TextStyle(fontSize: 13 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),
                            ],
                          ),
                        ):const SizedBox(width: 20,),
                        GestureDetector(
                          onTap: (){
                            flashCardController.getKeyWord2( widget.flashCardCategory, context,  widget.box, flashCardController.getKeywordModel!.id,
                                widget.title,true,true);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "${ConstAddress.icon}reload.svg",height: 27,width: 27,color: ColorsApp.primary,
                              ),
                              Text("Stay" , style: const TextStyle(fontSize: 13 , fontWeight: FontWeight.bold , color: ColorsApp.primary,fontFamily: "IranSANS"),),
                            ],
                          ),
                        ),
                        widget.next==true?  GestureDetector(
                          onTap: (){
                            flashCardController.keyWordSendToBox(flashCardController.getKeywordModel!.id, widget. box+1, context, widget.flashCardCategory, widget.title,widget. box);
                          },
                          child: Row(
                            children: [

                              const Text("NextPack" , style: TextStyle(fontSize: 13 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),
                              SvgPicture.asset(
                                "${ConstAddress.icon}arrowR.svg",height: 30,width: 30,color: ColorsApp.iconTextField,
                              ),
                            ],
                          ),
                        ):const SizedBox(width: 20,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
              : Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });

  }
}


