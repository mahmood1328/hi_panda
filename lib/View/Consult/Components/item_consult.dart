import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Models/Responses/consult_model.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../Controller/consult_controller.dart';
import '../Page/consult_detail_page.dart';

class ItemConsultComponent extends StatelessWidget {
 final Request request;
  const ItemConsultComponent({Key? key,required this.request}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var consultController = Get.put(ConsultController());
    return GestureDetector(
      onTap: (){
           consultController.consultInfo(request.id,context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 2,color: ColorsApp.backTextField)
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 20,width: 20,
                  decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child:  Text(request.countRequest.toString(),
                    style: const TextStyle(color: ColorsApp.white,fontSize:12,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                ),
                const SizedBox(width: 5,),
                Text(request.phoneNumber,
                  style:const TextStyle(color: ColorsApp.black,fontSize:14,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),
               const SizedBox(width: 10,),
                Text(request.name,
                  style:const TextStyle(color: ColorsApp.black,fontSize:15,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    consultController.consultInfo(request.id,context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 0,left: 0),
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: ColorsApp.white,
                        borderRadius:const BorderRadius.all(Radius.circular(25)),
                        border: Border.all(width: 1,color: ColorsApp.primaryLight.withOpacity(0.3))

                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(3),
                      child: Image.asset("${ConstAddress.image}arrow.png",color: ColorsApp.primaryLight,height: 25,width: 25,),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(request.date,
                          style:const TextStyle(color: ColorsApp.black,fontSize:12,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                        const SizedBox(width: 5,),
                        const Text(": تاریخ ",
                          style:TextStyle(color: ColorsApp.iconTextField,fontSize:10,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(request.whatsappNumber,
                          style:const TextStyle(color: ColorsApp.black,fontSize:12,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                        const SizedBox(width: 5,),
                        const Text(": واتس آپ",
                          style:TextStyle(color: ColorsApp.iconTextField,fontSize:10,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(request.linkName??"",
                          style:const TextStyle(color: ColorsApp.black,fontSize:12,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                        const SizedBox(width: 5,),
                        const  Text(" : کمپین",
                          style: TextStyle(color: ColorsApp.iconTextField,fontSize:10,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(request.number,
                          style:const TextStyle(color: ColorsApp.black,fontSize:12,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                        const SizedBox(width: 5,),
                        const Text(" : شماره",
                          style: TextStyle(color: ColorsApp.iconTextField,fontSize:10,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                      ],
                    ),
                  ],
                ),



              ],
            )
          ],
        ),
      ),
    );
  }
}
