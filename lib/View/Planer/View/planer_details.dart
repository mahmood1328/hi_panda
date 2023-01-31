import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hi_panda/View/Planer/Components/call_comonents.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Components/courses_components.dart';
import '../Components/description_componrms.dart';
import '../Controller/planner_controller.dart';

class PlanerDetailsPage extends StatelessWidget {
  final PlanerType tabSelect;
  const PlanerDetailsPage({Key? key,required this.tabSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var plannerController=Get.put(PlannerController());
    return DefaultTabController(
      initialIndex: tabSelect == PlanerType.curses ? 2 : 0,
      length: 3,
      child: Scaffold(
        backgroundColor: ColorsApp.white,
        body: SizedBox(
          height:SizeConfig.screenHeight,
          width:SizeConfig.screenWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height:SizeConfig.screenHeight/3.5,
                  width:SizeConfig.screenWidth,
                  child: Stack(
                    children: [
                      Container(
                        height:90,
                        width:SizeConfig.screenWidth,
                        decoration: const BoxDecoration(
                          color: ColorsApp.primary,
                          borderRadius:BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                          //border: Border.all(width: 1,color: ColorsApp.primaryLight.withOpacity(0.3))
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30),

                        child: GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: SizedBox(
                            height: 25,
                            width: 25,
                            child: SvgPicture.asset(
                              "${ConstAddress.icon}arrowLeft.svg",color: ColorsApp.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 65,left:10,right: 10 ),
                        width:SizeConfig.screenWidth,
                        decoration:  BoxDecoration(
                            color: ColorsApp.white,
                            borderRadius:const BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                            border: Border.all(width: 1.5,color: ColorsApp.black.withOpacity(0.3))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(plannerController.plannerListModel!.plannerInfo.countSection.toString(),textDirection: TextDirection.rtl,
                                        style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 14,fontFamily: "IranSANS",fontWeight: FontWeight.bold),),
                                      Text(" تعداد جلسات :",textDirection: TextDirection.rtl,
                                        style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 14,fontFamily: "IranSANS",fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(plannerController.plannerListModel!.plannerInfo.title,textDirection: TextDirection.rtl,
                                        style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 14,fontFamily: "IranSANS",fontWeight: FontWeight.bold),),
                                      Text(" عنوان :",textDirection: TextDirection.rtl,
                                        style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 14,fontFamily: "IranSANS",fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  plannerController.plannerListModel!.plannerInfo.isMyPlanner   ?
                                  Container(
                                    padding: const EdgeInsets.only(top: 1,bottom: 1,left: 8,right: 8),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                                        border: Border.all(color: ColorsApp.primary,width: 2)
                                    ),
                                    child: Row(
                                      children: const [
                                        Text("پلنر من",textDirection: TextDirection.rtl,
                                          style: TextStyle(color: ColorsApp.primary,fontSize: 12,fontFamily: "IranSANS",fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ):
                                  Container(
                                    padding: const EdgeInsets.only(top: 1.5,bottom: 1.5,left: 3,right: 3),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                                        border: Border.all(color: Colors.red,width: 2)
                                    ),
                                    child: Row(
                                      children: const [
                                        Text("پلنر فروشی",textDirection: TextDirection.rtl,
                                          style: TextStyle(color: ColorsApp.red,fontSize: 11,fontFamily: "IranSANS",fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(plannerController.plannerListModel!.plannerInfo.duration.toString(),textDirection: TextDirection.rtl,
                                        style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 14,fontFamily: "IranSANS",fontWeight: FontWeight.bold),),
                                      Text(" مدت آموزشی :",textDirection: TextDirection.rtl,
                                        style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 14,fontFamily: "IranSANS",fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child:  LinearPercentIndicator(
                                animation: true,
                                lineHeight: 15.0,
                                animationDuration: 5000,
                                percent: (plannerController.plannerListModel!.plannerInfo.percent.toDouble())>100?1:plannerController.plannerListModel!.plannerInfo.percent.toDouble()/100,
                                center:   Text("${((plannerController.plannerListModel!.plannerInfo.percent.toDouble())>100?100:plannerController.plannerListModel!.plannerInfo.percent.toDouble()).toString()} %" ,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900,color: Colors.green.shade600),),
                                linearStrokeCap: LinearStrokeCap.round,
                                progressColor: Color(0xffa5f8a1),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                              child: Wrap(
                                alignment: WrapAlignment.end,
                                children: [
                                  // Text(" توضیحات : ",textDirection: TextDirection.rtl,
                                  //   style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 12,fontFamily: "IranSANS",fontWeight: FontWeight.bold),),
                                  Text(plannerController.plannerListModel!.plannerInfo.descript.toString(),textDirection: TextDirection.rtl,
                                    style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 11,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  color: ColorsApp.primary,
                  margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: const TabBar(
                    indicatorColor: ColorsApp.white,
                    indicatorWeight: 3,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                    labelStyle: TextStyle(fontFamily: "IranSANS", fontWeight: FontWeight.normal,fontSize: 14,color: ColorsApp.black),
                    tabs: [
                      Tab(
                        text: 'پشتیبانی',
                      ),
                      Tab(
                        text: 'توضیحات',
                      ),
                      Tab(
                        text: 'جلسات',
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height:SizeConfig.screenHeight/1.6,
                  width:SizeConfig.screenWidth,
                  child:  TabBarView(
                    children: [
                      CallComponents(
                        plannerUserId: plannerController.plannerListModel!.plannerInfo.plannerUserId,
                        isMyPlanner: plannerController.plannerListModel!.plannerInfo.isMyPlanner,),
                      const DescriptionComponents(),
                      CursesComponents(plannerPart: plannerController.plannerListModel!.parts,
                        isMyPlanner: plannerController.plannerListModel!.plannerInfo.isMyPlanner,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
enum PlanerType { curses, des,call }
