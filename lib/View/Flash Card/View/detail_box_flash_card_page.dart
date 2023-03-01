import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Network/service_url.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Controller/flash_card_controller.dart';

class DetailBoxFlashCardPage extends StatelessWidget {
  final String title;
  final int flashCardCategory;
  final int box;
  final  bool? next;
  final  bool? prev;
  const DetailBoxFlashCardPage({Key? key,required this.title,required this.box,required this.flashCardCategory,
    this.next,this.prev}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
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
                  Get.back();
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
                  Text(title , style: const TextStyle(fontSize: 18 , fontWeight: FontWeight.bold , color: ColorsApp.white,fontFamily: "IranSANS"),),
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
                      Column(
                        children: [
                          Image.asset(
                            "${ConstAddress.image}translate.png",height: 45,width: 45,
                          ),
                          Text("لانگمن" , style: const TextStyle(fontSize: 15 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),
                        ],
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
                                        top: 25),
                                    decoration:  BoxDecoration(
                                        borderRadius:
                                        BorderRadius.all(
                                            Radius.circular(
                                                10)),
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
                                    height:
                                    SizeConfig.screenHeight / 2.5,
                                    width: SizeConfig.screenWidth /
                                        1.3,
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
                              "${ConstAddress.icon}jomle.svg",height: 50,width: 50,
                            ),
                            Text("جمله" , style: const TextStyle(fontSize: 15 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            "${ConstAddress.icon}volume.svg",height: 55,width: 55,
                          ),
                          Text("صدا" , style: const TextStyle(fontSize: 15 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  flashCardController.isFinish.value==false?Container(
                    child: FlipCard(
                      key: cardKey,
                      flipOnTouch: true,
                      front: Stack(
                        children: [
                          Card(
                            color:   ColorsApp.primary,
                            elevation: 2,
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
                              child:Image.network(ServiceURL.baseUrl2+flashCardController.getKeywordModel!.photo),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            color: ColorsApp.white.withOpacity(0.6),
                            child: Align(
                                alignment: Alignment.topCenter,
                                child: Text(flashCardController.getKeywordModel!.keywrod , style: const TextStyle(fontSize: 30 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),)),
                          ),

                        ],
                      ),
                      fill: Fill.fillBack,
                      back: Card(
                        color:   ColorsApp.white,
                        elevation: 2,
                        surfaceTintColor: Colors.grey,
                        shadowColor:Colors.grey ,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(color: ColorsApp.primary)
                        ),
                        semanticContainer: true,
                        clipBehavior: Clip.hardEdge,
                        child: GestureDetector(
                          //onTap: () => cardKey.currentState?.toggleCard(),
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            height:SizeConfig.screenHeight/2.3,
                            width:SizeConfig.screenWidth/1.22,
                            child: Text(flashCardController.getKeywordModel!.text,
                              style: const TextStyle(fontSize: 30 ,wordSpacing: 2, fontWeight: FontWeight.bold , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),textAlign: TextAlign.justify,
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ):  SizedBox()  ,
                  Spacer(),
                  Container(
                    color: ColorsApp.iconTextField,
                    height: 1,
                    width:SizeConfig.screenWidth,
                  ),
                  flashCardController.isFinish.value?const SizedBox() : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        prev==true? GestureDetector(
                          onTap: (){
                            flashCardController.keyWordSendToBox(flashCardController.getKeywordModel!.id, box, context,flashCardCategory,title);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  "${ConstAddress.icon}arrowL.svg",height: 30,width: 30
                              ),
                              const Text("PackA" , style: TextStyle(fontSize: 13 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),
                            ],
                          ),
                        ):const SizedBox(width: 20,),
                        GestureDetector(
                          onTap: (){
                            flashCardController.getKeyWord(flashCardCategory, context, box, flashCardController.getKeywordModel!.id,
                                title,true,true);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "${ConstAddress.icon}reload.svg",height: 30,width: 30,color: ColorsApp.primary,
                              ),
                              Text("Stay" , style: const TextStyle(fontSize: 13 , fontWeight: FontWeight.bold , color: ColorsApp.primary,fontFamily: "IranSANS"),),
                            ],
                          ),
                        ),
                        next==true?  GestureDetector(
                          onTap: (){
                            flashCardController.keyWordSendToBox(flashCardController.getKeywordModel!.id, box+1, context,flashCardCategory,title);
                          },
                          child: Row(
                            children: [

                              const Text("NextPack" , style: TextStyle(fontSize: 13 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),
                              SvgPicture.asset(
                                "${ConstAddress.icon}arrowR.svg",height: 30,width: 30,
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
            backgroundColor: ColorsApp.white,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });

  }
}
