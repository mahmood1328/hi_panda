import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Widget/snackbar.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Controller/planner_controller.dart';
import '../Models/planner_list_model.dart';
import 'courses_details_components.dart';
import 'item_curses.dart';

class CursesComponents extends StatelessWidget {
 final List <Part?> plannerPart;
 final bool isMyPlanner;
  const CursesComponents({Key? key,required this.plannerPart,required this.isMyPlanner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var plannerController=Get.put(PlannerController());
    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: SizedBox(
        height:SizeConfig.screenHeight,
        width:SizeConfig.screenWidth,
        child:SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Column(
                children: plannerPart.map((e) => GestureDetector(
                    onTap: (){

                    isMyPlanner?  plannerController.plannerSessionItem(context,e!.id ) :
                    ShowSnackBar().showSnackBar(
                      context,
                      "برای دیدن جزییات نیاز به اشتراک دارید \n به قسمت پشتیبانی مراجعه فرمایید - با تشکر -",duration: const Duration(seconds: 10),
                    );

                    },
                    child:  ItemCursesComponent(part: e!)),).toList(),
              ),

            ],
          ),
        ) ,
      ),
    );
  }
}
