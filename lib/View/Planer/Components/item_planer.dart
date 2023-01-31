import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Controller/planner_controller.dart';
import '../Models/getPlannerBasePage_model.dart';

class ItemPlanerComponent extends StatelessWidget {
final  Planner planner;
  const ItemPlanerComponent({Key? key,required this.planner}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var plannerController=Get.put(PlannerController());
    return GestureDetector(
      onTap: (){

      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child: Card(
          color:   ColorsApp.white,
          surfaceTintColor: Colors.black,
          elevation: 8,
          shadowColor:Colors.black ,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          semanticContainer: true,
          clipBehavior: Clip.hardEdge,
          child:Padding(
            padding: const EdgeInsets.only(right: 10,top: 10,left: 15,bottom: 6),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(" ${planner.countSection}",textDirection: TextDirection.rtl,
                          style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 10,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                        Text(" تعداد جلسات :",textDirection: TextDirection.rtl,
                          style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 10,fontFamily: "IranSANS",fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("${planner.title}",textDirection: TextDirection.rtl,
                          style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 10,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                        Text(" عنوان پلنر :",textDirection: TextDirection.rtl,
                          style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 10,fontFamily: "IranSANS",fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    planner.isMyPlanner!  ?
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
                      padding: const EdgeInsets.only(top: 1,bottom: 1,left: 3,right: 3),
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("${planner.duration}",textDirection: TextDirection.rtl,
                          style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 10,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                        Text(" مدت آموزش :",textDirection: TextDirection.rtl,
                          style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 10,fontFamily: "IranSANS",fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child:  LinearPercentIndicator(
                    width: SizeConfig.screenHeight/2.5 ,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 5000,
                    percent: (planner.percent!.toDouble())>100?1:planner.percent!.toDouble()/100,
                    center:  Text("${((planner.percent!.toDouble())>100?100:planner.percent!.toDouble()).toString()} %",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900,color: Colors.green.shade600),),
                    linearStrokeCap: LinearStrokeCap.round,
                    progressColor: const Color(0xffb7fab5),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:  const EdgeInsets.only(top: 5,left: 0,right: 0),
                      child: Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenHeight/9, 25)),
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

                            plannerController.plannerList(context, planner.id!);
                          },
                          child: const Text(
                            "ادامه",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                color: ColorsApp.white),
                            textAlign: TextAlign.center,
                          ),),
                      ),
                    ),

                  ],
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Wrap(
                    alignment: WrapAlignment.end,
                    runAlignment: WrapAlignment.end,
                    children: [
                      Text("توضیحات :  ${planner.descript}  ",textDirection: TextDirection.rtl,
                        style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 10,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                    ],
                  ),
                ),
              ],
            ),
          ) ,
        ),
      ),
    );
  }
}
