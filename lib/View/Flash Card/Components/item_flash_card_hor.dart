import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Network/service_url.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Models/get_flash_card_list_model.dart';

class ItemFlashCardHor extends StatelessWidget {
  final FlashCard flashCard;
  const ItemFlashCardHor({Key? key,required this.flashCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height:60,
      width:SizeConfig.screenWidth,
      child: Stack(
        children: [
          Container(
            height:80,
            width:SizeConfig.screenWidth,
            margin: const EdgeInsets.only(right: 20,left: 40),
            child: Card(
              color:   Colors.white,
              elevation: 4,
              surfaceTintColor: Colors.grey,
              shadowColor:Colors.grey.withOpacity(0.5) ,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                // side:  BorderSide(color: flashCard.level==1?ColorsApp.yellow:flashCard.level==2?ColorsApp.primary:ColorsApp.red,)
              ),
              semanticContainer: true,
              clipBehavior: Clip.hardEdge,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Column(
                    children: [
                      Text(flashCard.title , style: const TextStyle(fontSize: 15 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),
                      Row(
                        children: [

                          const Text("  عدد " , style: TextStyle(fontSize: 12 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),
                           Text(flashCard.keywordsCount.toString() , style: const TextStyle(fontSize: 14 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 20,),
                  Container(
                    margin: EdgeInsets.only(right: 10,left: 10),
                    padding: EdgeInsets.all(7),
                      child: Image.network(ServiceURL.baseUrl2+flashCard.photo)),


                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 25),
                padding: EdgeInsets.all(11),
                height: 42,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  //border: Border.all(color: flashCard.level==1?ColorsApp.yellow:flashCard.level==2?ColorsApp.primary:ColorsApp.red,width: 2),
                    color: flashCard.level==1?ColorsApp.yellow:flashCard.level==2?ColorsApp.primary:ColorsApp.red
                ),
                child: SvgPicture.asset("${ConstAddress.icon}delete1.svg",height: 20,width: 20,color: ColorsApp.white,),
              ),
            ],
          )
        ],
      ),
    );
  }
}
