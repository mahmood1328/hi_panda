import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:slide_countdown/slide_countdown.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Models/planner_list_model.dart';

class ItemCursesComponent extends StatelessWidget {
  final Part part;
  const ItemCursesComponent({Key? key,required this.part}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:SizeConfig.screenHeight/8,
      width:SizeConfig.screenWidth,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        color:   ColorsApp.white,
        surfaceTintColor: Colors.grey,
        elevation: 5,
        shadowColor:Colors.grey ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          //side: BorderSide(color: ColorsApp.textUnSelected.withOpacity(0.5),width: 1)
        ),
        semanticContainer: true,
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                   SlideCountdownSeparated(
                    duration: Duration(minutes: part.startHourFromBase),
                    height: 20,width: 20,
                    decoration: const BoxDecoration(
                      color: ColorsApp.primary,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    textStyle:const TextStyle(fontSize: 12,fontWeight: FontWeight.bold,fontFamily: "IranSANS"),

                  ),
                  Text(part.title??"" , style: TextStyle(fontSize: 13 , fontWeight: FontWeight.w600 , color: ColorsApp.colorTextT1.withOpacity(0.5),fontFamily: "IranSANS"),),

                ],
              ),

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(part.subTitle2Value??"" , style: TextStyle(fontSize: 12 , fontWeight: FontWeight.w600 , color: ColorsApp.colorTextT1.withOpacity(0.5),fontFamily: "IranSANS"),),
                Text(part.subTitle1Value??"" , style: TextStyle(fontSize: 12 , fontWeight: FontWeight.w600 , color: ColorsApp.colorTextT1.withOpacity(0.5),fontFamily: "IranSANS"),),
              ],
            ),

            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:  LinearPercentIndicator(
                animation: true,
                lineHeight: 15.0,
                animationDuration: 5000,
                percent: (part.percent.toDouble())>100?1:part.percent.toDouble()/100,
                center: Text("${((part.percent.toDouble())>100?100:part.percent.toDouble()).toString()} %" ,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900,color: Colors.green.shade600),),
                linearStrokeCap: LinearStrokeCap.round,
                progressColor: Color(0xffa5f8a1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
