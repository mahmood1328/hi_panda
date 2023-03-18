import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Components/item_flash_card_hor.dart';
import '../Components/item_flash_card_ver.dart';
import '../Controller/flash_card_controller.dart';
import '../Widgets/add_flash_card_modal.dart';
import 'details_flash_card_page.dart';

class FlashCardPage extends StatelessWidget {
  const FlashCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<FlashCardController>(
        init: Get.put(FlashCardController()),
        builder: (flashCardController) {
          return flashCardController.isLoading.value
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
                children: const [

                  Text("فلش کارت " , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: ColorsApp.white,fontFamily: "IranSANS"),),

                ],
              ),
            ),

            body: SizedBox(
              height:SizeConfig.screenHeight,
              width:SizeConfig.screenWidth,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          GestureDetector(
                              child: SvgPicture.asset("${ConstAddress.icon}add2.svg",height: 30,width: 30,color: ColorsApp.primary,),
                          onTap: (){

                            showCupertinoModalBottomSheet(
                                expand: false,
                                context: context,
                                useRootNavigator: true,
                                backgroundColor: ColorsApp.white,
                                builder: (BuildContext context) =>

                                SizedBox(
                                    height:SizeConfig.screenHeight/2,
                                    width:SizeConfig.screenWidth,
                                    child: ModalAddFlashCard()));

                          },
                          ),

                          const Text("فلش کارت های من " , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),

                        ],
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Column(
                      children: flashCardController.getFlashCardListModel!.myFlashCards.map((e) =>  GestureDetector(
                          onTap: (){

                            flashCardController.getBox(e.id, context, e.title);
                          },
                          child: ItemFlashCardHor(flashCard: e,)),).toList(),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      height:4,
                      width:SizeConfig.screenWidth,
                      color: ColorsApp.backTextField,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Tooltip(
                              child: SvgPicture.asset("${ConstAddress.icon}info2.svg",height: 20,width: 20,color: ColorsApp.iconTextField,),
                              message: "رنگ ها میزان سطح فلش کارت ها را مشخص می کنند \n رنگ قرمز سطح بالا \n رنگ سبز متوسط \n رنگ زرد پایین",
                              decoration: BoxDecoration(color: ColorsApp.greenBlueLight,borderRadius: BorderRadius.all(Radius.circular(10))),
                              textStyle: TextStyle(fontSize: 13 , fontWeight: FontWeight.normal , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),
                            ),
                          ),
                          const SizedBox(width: 5,),
                          const Text("فلش کارت های عمومی " , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      height: SizeConfig.screenHeight/4.3,
                      width: SizeConfig.screenWidth,
                      child: SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: flashCardController.getFlashCardListModel!.generalFlashCard.map((e) => ItemFlashCardVer(flashCard: e,)).toList(),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      height:4,
                      width:SizeConfig.screenWidth,
                      color: ColorsApp.backTextField,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Tooltip(
                              child: SvgPicture.asset("${ConstAddress.icon}info2.svg",height: 20,width: 20,color: ColorsApp.iconTextField,),
                              message: "رنگ ها میزان سطح فلش کارت ها را مشخص می کنند \n رنگ قرمز سطح بالا \n رنگ سبز متوسط \n رنگ زرد پایین",
                              decoration: BoxDecoration(color: ColorsApp.greenBlueLight,borderRadius: BorderRadius.all(Radius.circular(10))),
                              textStyle: TextStyle(fontSize: 13 , fontWeight: FontWeight.normal , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),
                            ),
                          ),
                          const SizedBox(width: 5,),
                          const Text("فلش کارت های دوستان " , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),

                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      height: SizeConfig.screenHeight/4.3,
                      width: SizeConfig.screenWidth,
                      child: SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: flashCardController.getFlashCardListModel!.friendFlashCard.map((e) => ItemFlashCardVer(flashCard: e,)).toList(),
                        ),
                      ),
                    ),

                  ],
                ),
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
