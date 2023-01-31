import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../Components/offline_components.dart';
import '../Components/online_components.dart';
import '../Controller/dictionary_controller.dart';

class DictionaryPage extends StatelessWidget {
  final DictionaryType tabSelect;
  const DictionaryPage({Key? key,required this.tabSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<DictionaryController>(
        init: Get.put(DictionaryController()),
        builder: (dictionaryController) {
          return dictionaryController.isLoading.value
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

                      Text("دیکشنری " , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: ColorsApp.white,fontFamily: "IranSANS"),),

                    ],
                  ),
                  // bottom: const TabBar(
                  //   indicatorColor: ColorsApp.white,
                  //   indicatorWeight: 3,
                  //
                  //   indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                  //   labelStyle: TextStyle(fontFamily: "IranSANS", fontWeight: FontWeight.normal,fontSize: 16),
                  //   tabs: [
                  //     Tab(
                  //       text: 'آفلاین',
                  //     ),
                  //     Tab(
                  //       text: 'آنلاین',
                  //     ),
                  //   ],
                  // ),
                ),
                body:OnlineComponent(lineDictionary: dictionaryController.dictionaryListModel!.onlineDictionaries,)

                // TabBarView(
                //   children: [
                //     OfflineComponent(lineDictionary: dictionaryController.dictionaryListModel!.onlineDictionaries,),
                //     OnlineComponent(lineDictionary: dictionaryController.dictionaryListModel!.onlineDictionaries,)
                //
                //
                //   ],
                // ),
              )
              : const Scaffold(backgroundColor: ColorsApp.white,body: Center(child: CircularProgressIndicator(),),);
        });

  }
}
enum DictionaryType { online, offline }
