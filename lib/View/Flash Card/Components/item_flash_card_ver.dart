import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Network/service_url.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Models/get_flash_card_list_model.dart';

class ItemFlashCardVer extends StatelessWidget {
  final FlashCard flashCard;
  const ItemFlashCardVer({Key? key,required this.flashCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          height:SizeConfig.screenHeight/6,
          width:SizeConfig.screenWidth/4,
           margin:const EdgeInsets.only(right: 3,left: 3),
          child: Card(
            color:   ColorsApp.white,
            elevation: 3,
            surfaceTintColor: Colors.grey,
            shadowColor:Colors.grey ,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
             // side: BorderSide(color: ColorsApp.primary)
            ),
            semanticContainer: true,
            clipBehavior: Clip.hardEdge,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 10,
                  width:SizeConfig.screenWidth/4,
                  color:flashCard.level==1?ColorsApp.yellow:flashCard.level==2?ColorsApp.primary:ColorsApp.red,
                ),
                SizedBox(
                  child: Image.network(ServiceURL.baseUrl2+flashCard.photo),
                ),
                Column(
                  children: [
                     Text(flashCard.title , style: const TextStyle(fontSize: 12 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("  عدد " , style: TextStyle(fontSize: 10 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),
                         Text(flashCard.keywordsCount.toString() , style: const TextStyle(fontSize: 11 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),
                      ],
                    ),
                  ],
                ),




              ],
            ),
          ),
        ),
        Container(
          height:30,
          width:SizeConfig.screenWidth/4.5,
           margin:const EdgeInsets.only(right: 3,left: 3,top: 0),
          child: Card(
            color:   ColorsApp.white,
            elevation: 3,
            surfaceTintColor: Colors.grey,
            shadowColor:Colors.grey ,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
             // side: BorderSide(color: ColorsApp.primary)
            ),
            semanticContainer: true,
            clipBehavior: Clip.hardEdge,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                SvgPicture.asset(ConstAddress.icon+"add3.svg",height: 20,color: flashCard.level==1?ColorsApp.yellow:flashCard.level==2?ColorsApp.primary:ColorsApp.red)


              ],
            ),
          ),
        ),
      ],
    );
  }
}
