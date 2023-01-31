import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Widget/snackbar.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Controller/planner_controller.dart';
import '../Models/getLevelQuestionsModel.dart';
import 'answer_components.dart';



class SpecifyLevelComponents extends StatefulWidget {
 final String title;
 final String desc;
 final List<QuestionGroup?> questionGroup;
  const SpecifyLevelComponents({Key? key,required this.title,required this.questionGroup,required this.desc}) : super(key: key);


  @override
  _SpecifyLevelComponentsState createState() => _SpecifyLevelComponentsState();

}

class _SpecifyLevelComponentsState extends State<SpecifyLevelComponents> {

  @override
  void initState() {
    super.initState();

  }

  bool isError=false;
  var plannerController=Get.put(PlannerController());
  @override
  Widget build(BuildContext context) {
    return Material(
        color: ColorsApp.white,
        child: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${widget.title} ",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: ColorsApp.colorTextT1.withOpacity(0.5),
                      fontFamily: "IranSANS"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 1,width: SizeConfig.screenWidth,
                  color: ColorsApp.backTextField,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Wrap(
                    alignment: WrapAlignment.end,
                    children: [
                      Text(
                      widget.desc
                        ,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: ColorsApp.colorTextT1.withOpacity(0.5),
                            fontFamily: "IranSANS"),textDirection: TextDirection.rtl,
                      ),
                      Text(
                        "توضیحات : ",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: ColorsApp.colorTextT1.withOpacity(0.5),
                            fontFamily: "IranSANS"),textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),


                Column(
                  children: widget.questionGroup.map((e) => Column(
                    children: e!.questions!.map((f) => Card(
                      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      color:   ColorsApp.white,
                      elevation: 3,
                      surfaceTintColor: Colors.grey,
                      shadowColor:Colors.grey ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      semanticContainer: true,
                      clipBehavior: Clip.hardEdge,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                alignment: WrapAlignment.start,
                                textDirection: TextDirection.ltr,
                                children: [
                                  Text(
                                    f?.question??"",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: ColorsApp.colorTextT1.withOpacity(0.6),
                                        fontFamily: "yekan"),textDirection: TextDirection.rtl,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: AnswerComponents(value: f!.items!, id: f.id!,),
                            ),


                          ],
                        ),
                      ),
                    )).toList(),
                  )).toList(),
                ),
                isError?  const Text(
                  "لطفا تست ها را کامل انجام دهید",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: ColorsApp.red,
                      fontFamily: "IranSANS"),
                ) :const SizedBox(),
                widget.questionGroup.isNotEmpty?  Padding(
                  padding:  const EdgeInsets.only(top: 10,left: 30,right: 30,bottom: 10),
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
                        setState(() {
                          isError=false;
                        });
                        print("add");
                        if(plannerController.answerModel.isNotEmpty){
                          plannerController.addLevelQuestion(context,plannerController.answerModel,0);
                        }else{

                          setState(() {
                            isError=true;
                          });
                        }

                      },

                      child: const Text(
                        "ارسال",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                            color: ColorsApp.white),
                        textAlign: TextAlign.center,
                      ),),
                  ),
                ) :SizedBox() ,


              ],
            ),
          ),
        ));
  }

}