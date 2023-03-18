import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../Network/service_url.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Model/my_courses_model.dart';
import '../controller/courses.dart';

class ItemTest extends StatelessWidget {
final  Course course;
  const ItemTest({Key? key,required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var coursesController=Get.put(CoursesController());
    print(ServiceURL.baseUrl +  course.photo);
    return GestureDetector(
      onTap: (){

        if(course.type==2){
          coursesController.getMyCoursesDetailM(course.id,course.pId,course.type,course.photo,context,course.isBuy);
        }else if(course.type==6||course.type==7){
          coursesController.getMyCoursesDetailBookAndPdf(course.id,course.pId,course.type,course.photo,context,course.isBuy);
        }else{
          coursesController.getMyCoursesDetailV(course.id,course.pId,course.type,context,course.isBuy);
        }

      },
      child: Card(
        color:   ColorsApp.white,
        margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 8),

        surfaceTintColor: Colors.grey,
        shadowColor:Colors.grey ,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: ColorsApp.textColorSub, width: 1.5),
          borderRadius: BorderRadius.circular(20),

        ),
        semanticContainer: true,
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            ClipRect(
                child: Image.network(ServiceURL.baseUrl +  course.photo,fit: BoxFit.fill,)),
             Padding(
               padding: const EdgeInsets.only(right: 20,left: 20,top: 10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Directionality(
                     textDirection: TextDirection.rtl,
                     child: Text(course.title,
                      style:const TextStyle(color:  ColorsApp.primaryLight2,fontSize: 16,fontFamily: "IranSANS",fontWeight: FontWeight.bold),maxLines: 2,),
                   ),
                 ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   GestureDetector(
                     child: Padding(
                       padding: const EdgeInsets.only(right: 0,left: 10,top: 0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           Container(
                             padding: const EdgeInsets.all(8),
                             height: 40,
                             width: 40,
                             decoration: BoxDecoration(
                                 color:course.isBuy==false? ColorsApp.primaryLight2:ColorsApp.white,
                                 borderRadius:const BorderRadius.all(Radius.circular(20)),
                                 border: Border.all(width: 1,color:  ColorsApp.primaryLight.withOpacity(0.5))

                             ),
                             child:course.isBuy==false?
                             SizedBox(
                               child: SvgPicture.asset(
                                 "${ConstAddress.icon}Buy.svg",color: ColorsApp.white,
                               )):
                             course.type==1? SizedBox(
                               child: SvgPicture.asset(
                                 "${ConstAddress.icon}video2.svg",color: ColorsApp.primaryLight2,
                               ),
                             ):course.type==2? SizedBox(
                               child: SvgPicture.asset(
                                 "${ConstAddress.icon}voice2.svg",color: ColorsApp.primaryLight2,
                               ),
                             )
                           :course.type==4?SizedBox(
                               child: SvgPicture.asset(
                                 "${ConstAddress.icon}animation.svg",color: ColorsApp.primaryLight2,
                               ),
                             ):course.type==6?SizedBox(
                               child: SvgPicture.asset(
                                 "${ConstAddress.icon}book.svg",color: ColorsApp.primaryLight2,
                               ),
                             ):course.type==7?SizedBox(
                               child: SvgPicture.asset(
                                 "${ConstAddress.icon}pdf.svg",color: ColorsApp.primaryLight2,
                               ),
                             ):SizedBox(),)

                         ],
                       ),
                     ),
                   ),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.end,
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(right: 10,left: 20,top: 3),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             Text("ساعت",
                               style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 12,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                             const SizedBox(width: 5,),
                             Text("${Duration(seconds: course.secounds).inMinutes.remainder(60).toString()}:${(Duration(seconds: course.secounds).inSeconds.remainder(60) % 60).toString().padLeft(2, '0')}"
                               ,
                               style: TextStyle(color:ColorsApp.black.withOpacity(0.5),fontSize: 12,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                             Text(": مدت دوره",
                               style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 12,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),


                           ],
                         ),
                       ),
                       Padding(
                         padding:  const EdgeInsets.only(right: 10),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 Text("درس",
                                   style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 12,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                                 const SizedBox(width: 5,),
                                 Text("${course.countSession}",
                                   style: TextStyle(color: ColorsApp.black.withOpacity(0.5),fontSize: 12,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),

                               ],
                             ),

                           ],
                         ),
                       ),
                     ],
                   ),
                 ],
               ),
             ),


            const SizedBox(height: 20,)


          ],
        ),
      ),
    );
  }
}
