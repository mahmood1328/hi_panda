import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hi_panda/View/Planer/Controller/planner_controller.dart';

import '../../../utils/res/colors.dart';
import '../Models/AnswerQuestionModel.dart';

class AnswerComponents extends StatefulWidget {
  final List <String?> value;
  final int id;
  const AnswerComponents({Key? key,required this.value,required this.id}) : super(key: key);

  @override
  State<AnswerComponents> createState() => _AnswerComponentsState();
}

class _AnswerComponentsState extends State<AnswerComponents> {
  late String answer="";
  var plannerController=Get.put(PlannerController());
  @override

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: ListView.builder(
               physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              reverse: true,
              itemCount:   widget.value.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      answer=widget.value[index]!;
                    });
                    plannerController.getAnswer(Answer(questionId: widget.id, answer: answer));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                    margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color:  ColorsApp.colorTextT1.withOpacity(0.5)),
                        color: answer==widget.value[index] ?ColorsApp.primary: ColorsApp.white

                    ),
                    child: Text(
                      widget.value[index]!,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color:answer==widget.value[index] ?ColorsApp.white: ColorsApp.colorTextT1.withOpacity(0.5),
                          fontFamily: "yekan"),
                    ),
                  ),
                );

              }),
        ),

      ],
    );
  }
}



