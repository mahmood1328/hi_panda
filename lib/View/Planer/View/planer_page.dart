import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../../Blog/Components/loading_blog_list.dart';
import '../Components/item_planer.dart';
import '../Controller/planner_controller.dart';

class PlanerPage extends StatefulWidget {
  const PlanerPage({Key? key}) : super(key: key);

  @override
  State<PlanerPage> createState() => _PlanerPageState();
}
class _PlanerPageState extends State<PlanerPage> {
  String? selectedValue;
  bool isPlanner=false;
  @override
  Widget build(BuildContext context) {
    return GetX<PlannerController>(
        init: Get.put(PlannerController()),
        builder: (plannerController) {
          return plannerController.isLoading.value
              ? Scaffold(
            backgroundColor: ColorsApp.white,
            body: SizedBox(
              height:SizeConfig.screenHeight,
              width:SizeConfig.screenWidth,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height:40,
                      width:SizeConfig.screenWidth,
                      decoration: const BoxDecoration(
                        color: ColorsApp.primary,
                        borderRadius:BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                        //border: Border.all(width: 1,color: ColorsApp.primaryLight.withOpacity(0.3))
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text("پلنر پیشنهادی براساس سطح شما",
                            style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 14,fontFamily: "IranSANS",fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Wrap(
                        alignment: WrapAlignment.end,
                        children: [
                          Text("${plannerController.getPlannerBasePageModel!.levelData!.text} ",textDirection: TextDirection.rtl,
                            style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 11,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                          Text(" توضیحات : ",textDirection: TextDirection.rtl,
                            style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 12,fontFamily: "IranSANS",fontWeight: FontWeight.bold),),


                        ],
                      ),
                    ),
                    plannerController.getPlannerBasePageModel!.levelData!.hasPlanner! ?
                    GestureDetector(
                      onTap: (){
                        plannerController.getLevelQuestion(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:const [
                            Text("تعیین سطح جدید",
                              style: TextStyle(color: Colors.green,fontSize: 11,fontFamily: "IranSANS",fontWeight: FontWeight.bold,decoration:
                              TextDecoration.underline
                              ),),
                          ],
                        ),
                      ),
                    ):const SizedBox(),
                    plannerController.getPlannerBasePageModel!.levelData!.hasPlanner! ? const SizedBox():
                    Padding(
                      padding:  const EdgeInsets.only(top: 10,left: 30,right: 30),
                      child: Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenHeight/1.5, 35)),
                              foregroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                              backgroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(color:ColorsApp.primary)
                                  )
                              )
                          ),

                          onPressed: () {
                            plannerController.getLevelQuestion(context);
                          },
                          child: const Text(
                            "تعیین سطح",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                color: ColorsApp.white),
                            textAlign: TextAlign.center,
                          ),),
                      ),
                    ) ,
                    plannerController.getPlannerBasePageModel!.levelData!.hasPlanner! ?
                    ItemPlanerComponent(planner: plannerController.getPlannerBasePageModel!.levelData!.planner!,):
                    const SizedBox(),
                    const SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text("پلنر پیشنهادی براساس علاقه ی شما",
                            style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 14,fontFamily: "IranSANS",fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Wrap(
                        alignment: WrapAlignment.end,
                        children: [

                          Text("${plannerController.getPlannerBasePageModel!.smartData!.text}  ",textDirection: TextDirection.rtl,
                            style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 11,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                          Text(" توضیحات : ",textDirection: TextDirection.rtl,
                            style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 12,fontFamily: "IranSANS",fontWeight: FontWeight.bold),),


                        ],
                      ),
                    ),
                    plannerController.getPlannerBasePageModel!.smartData!.hasPlanner! ?
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text("تعیین علاقمندی جدید",
                            style: TextStyle(color: Colors.green,fontSize: 11,fontFamily: "IranSANS",fontWeight: FontWeight.bold,decoration:
                            TextDecoration.underline
                            ),),
                        ],
                      ),
                    ):const SizedBox(),
                    plannerController.getPlannerBasePageModel!.smartData!.hasPlanner! ? const SizedBox():  Padding(
                      padding:  const EdgeInsets.only(top: 10,left: 30,right: 30),
                      child: Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenHeight/1.5, 35)),
                              foregroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                              backgroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(color:ColorsApp.primary)
                                  )
                              )
                          ),

                          onPressed: () {
                           plannerController.getSmartQuestion(context);
                          },
                          child: const Text(
                            "علاقمندی",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                color: ColorsApp.white),
                            textAlign: TextAlign.center,
                          ),),
                      ),
                    ),
                    plannerController.getPlannerBasePageModel!.smartData!.hasPlanner! ?
                    ItemPlanerComponent(planner: plannerController.getPlannerBasePageModel!.smartData!.planner!,):
                    const SizedBox(),
                    const SizedBox(height: 10,),
                    Container(

                      width: SizeConfig.screenHeight,
                      decoration:const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(0)),color: ColorsApp.white),
                      child: Column(
                        children: [
                          const SizedBox(height: 0,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Card(
                              color:   ColorsApp.primary,
                              surfaceTintColor: Colors.grey,
                              shadowColor:Colors.grey ,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              semanticContainer: true,
                              clipBehavior: Clip.hardEdge,
                              child:Container(
                                width: SizeConfig.screenHeight,
                                padding: const EdgeInsets.only(right: 15,top: 0,left: 15,bottom: 0),
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: PopupMenuButton(
                                        color: ColorsApp.white,
                                        offset: const Offset(-12, 52), // SET THE (X,Y) POSITION
                                        iconSize: 35,
                                        icon: SvgPicture.asset(
                                          "${ConstAddress.icon}sort.svg",color: ColorsApp.white,height: 25,width: 25,
                                        ),
                                        itemBuilder: (context) {
                                          return [
                                            PopupMenuItem(
                                              onTap: (){
                                                setState(() {
                                                  isPlanner=true;
                                                  plannerController.getIsMyPlanners(true);
                                                });
                                              },
                                              child:  Text("پلنرهای من",style: TextStyle(color:Theme.of(context).primaryColor,fontSize: 13,fontFamily: "IranSANS",fontWeight: FontWeight.normal, ),
                                                textDirection:TextDirection.rtl ,),
                                            ),
                                            PopupMenuItem(
                                              onTap: (){
                                                setState(() {
                                                  isPlanner=false;
                                                  //plannerController.getIsMyPlanners(true);
                                                });
                                              },

                                              child:  Text("پلنرهای فروش",style:  TextStyle(color:Theme.of(context).primaryColor,fontSize: 13,fontFamily: "IranSANS",fontWeight: FontWeight.normal, ),
                                                  textDirection:TextDirection.rtl),
                                            ),
                                            PopupMenuItem(
                                              onTap: (){
                                                setState(() {
                                                  isPlanner=false;
                                                  //plannerController.getIsMyPlanners(true);
                                                });
                                              },// DISABLED THIS ITEM
                                              child:  Text("همه پلنرها",style:  TextStyle(color:Theme.of(context).primaryColor,fontSize: 13,fontFamily: "IranSANS",fontWeight: FontWeight.normal, ),
                                                  textDirection:TextDirection.rtl ),
                                            ),

                                          ];
                                        },
                                      ),
                                    ),
                                    const Text(" لیست پلنرها",textDirection: TextDirection.rtl,
                                      style: TextStyle(color: ColorsApp.white,fontSize: 14,fontFamily: "IranSANS",fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ) ,
                            ),
                          ),
                          const SizedBox(height: 10,),
                          isPlanner || plannerController.listPlanner.isNotEmpty ?
                          Column(
                            children: plannerController.listPlanner.map((e) =>
                                ItemPlanerComponent(planner: e,)).toList(),
                          ):
                          Column(
                            children: plannerController.getPlannerBasePageModel!.planners!.map((e) =>
                                 ItemPlanerComponent(planner: e!,)).toList(),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          )
              : const LoadingBlogList();
        });

  }
}
