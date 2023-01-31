import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Models/Responses/consult_model.dart';
import '../../../Models/Responses/factory_model.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../Controller/consult_controller.dart';
import '../Page/consult_detail_page.dart';

class ItemFactoryComponent extends StatelessWidget {
 final Factor factor;
  const ItemFactoryComponent({Key? key,required this.factor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var consultController = Get.put(ConsultController());
    return GestureDetector(
      onTap: (){
           consultController.factoryInfo(factor.id,context);
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
               const SizedBox(width: 10,),
                Text(factor.name,
                  style:const TextStyle(color: ColorsApp.black,fontSize:15,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(factor.courseName,
                  style:const TextStyle(color: ColorsApp.black,fontSize:12,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                const SizedBox(width: 5,),
                const  Text(" : نام دوره",
                  style: TextStyle(color: ColorsApp.iconTextField,fontSize:10,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    consultController.factoryInfo(factor.id,context);
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
                        Text(factor.date,
                          style:const TextStyle(color: ColorsApp.black,fontSize:12,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                        const SizedBox(width: 5,),
                        const Text(": تاریخ ",
                          style:TextStyle(color: ColorsApp.iconTextField,fontSize:10,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(factor.whatsappNumber,
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
                        Text(factor.countPay.toString(),
                          style:const TextStyle(color: ColorsApp.black,fontSize:12,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                        const SizedBox(width: 5,),
                        const Text(" : تعداد پرداخت",
                          style: TextStyle(color: ColorsApp.iconTextField,fontSize:10,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(factor.phoneNumber.toString(),
                          style:const TextStyle(color: ColorsApp.black,fontSize:12,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                        const SizedBox(width: 5,),
                        const Text(" : شماره موبایل",
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
