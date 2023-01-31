import 'package:flutter/cupertino.dart';

import '../../../Models/Responses/consult_info_model.dart';
import '../../../utils/res/colors.dart';

class ItemRequestComponents extends StatelessWidget {
  final DetailShow detailShow;
  const ItemRequestComponents({Key? key,required this.detailShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      margin:const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: ColorsApp.iconTextField,width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                detailShow.date,
                style:const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,fontFamily: "IranSANS",
                    color: ColorsApp.primaryTextColor),
                textAlign: TextAlign.center,
              ),
              Text(
                detailShow.user??"",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,fontFamily: "IranSANS",
                    color: ColorsApp.black.withOpacity(0.7)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Wrap(
            children: [
              Text(
                detailShow.descript,
                style:const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,fontFamily: "IranSANS",
                    color: ColorsApp.primaryTextColor),
                textAlign: TextAlign.justify,maxLines: 3,textDirection: TextDirection.rtl,
              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding:const EdgeInsets.symmetric(horizontal: 5,vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: ColorsApp.primary,width: 1.5),
                ),
                child: Text(
                  detailShow.status,
                  style:const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,fontFamily: "IranSANS",
                      color: ColorsApp.primary),
                  textAlign: TextAlign.center,
                ),
              ),

            ],
          ),

        ],
      ),

    );
  }
}
