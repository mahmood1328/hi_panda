import 'package:flutter/cupertino.dart';

import '../../../Models/Responses/consult_info_model.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';

class ItemRegisterShowComponents extends StatelessWidget {
  final DetailRegisterShow detailRegisterShow;
  const ItemRegisterShowComponents({Key? key,required this.detailRegisterShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      padding: const EdgeInsets.only(right: 20,top: 10,left: 20,bottom: 10),
      decoration: const BoxDecoration(
          color: ColorsApp.backTextField,
          borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [


          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(detailRegisterShow.date,
                    style:const TextStyle(color: ColorsApp.colorTextT1,fontSize:10,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),
                  const Text(" : تاریخ ",
                    style: TextStyle(color: ColorsApp.colorTextT1,fontSize:10,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),

                ],
              ),
              Row(
                children: [
                  Text(detailRegisterShow.requestType??"",
                    style:const TextStyle(color: ColorsApp.colorTextT1,fontSize:11,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),
                  const  Text(" : نوع درخواست",
                    style: TextStyle(color: ColorsApp.colorTextT1,fontSize:11,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),

                ],
              ),
              Row(
                children: [
                  Text(detailRegisterShow.courseName??"",
                    style:const TextStyle(color: ColorsApp.colorTextT1,fontSize:11,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),
                  const  Text(" : دوره",
                    style: TextStyle(color: ColorsApp.colorTextT1,fontSize:11,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),

                ],
              ),
            ],
          ),
         const SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(detailRegisterShow.name,
                    style:const TextStyle(color: ColorsApp.colorTextT1,fontSize:16,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(detailRegisterShow.enterType??"",
                    style:const TextStyle(color: ColorsApp.colorTextT1,fontSize:11,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),
                  const Text(" : کمپین",
                    style: TextStyle(color: ColorsApp.colorTextT1,fontSize:11,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),

                ],
              ),
              Row(
                children: [
                  Text(detailRegisterShow.link??"",
                    style:const TextStyle(color: ColorsApp.colorTextT1,fontSize:11,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),
                  const Text(" : سایت کمپین",
                    style: TextStyle(color: ColorsApp.colorTextT1,fontSize:11,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),

                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
