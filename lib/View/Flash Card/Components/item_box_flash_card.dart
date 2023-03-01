import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Models/get_box_model.dart';

class ItemBoxFlashCardComponents extends StatelessWidget {
  final Box box;
  final String color;
  const ItemBoxFlashCardComponents({Key? key,required this.box,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height:SizeConfig.screenHeight/6,
          width:SizeConfig.screenWidth/2,
          child: Card(
            color:   Color(int.parse(color)),
            elevation: 0,
            surfaceTintColor: Colors.grey,
            shadowColor:Colors.grey ,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
               // side: const BorderSide(color: ColorsApp.primary)
            ),
            semanticContainer: true,
            clipBehavior: Clip.hardEdge,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:const EdgeInsets.all(0),
                    margin:const EdgeInsets.only(left: 3),
                    height: 75,
                    width: 75,
                    child: SvgPicture.asset(
                      "${ConstAddress.icon}box4.svg",color: Colors.white,
                    ),
                  ),
                  Text(
                    box.title,
                    style:const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,fontFamily: "IranSANS",
                        color: ColorsApp.white),
                    textAlign: TextAlign.center,
                  ),
                  const  SizedBox(width: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text(
                        box.keywrods.toString(),
                        style:const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                            color: ColorsApp.white),
                        textAlign: TextAlign.center,textDirection: TextDirection.ltr,
                      ),
                      const  SizedBox(width: 5,),
                      const Text(
                        "کلمه",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                            color: ColorsApp.white),
                        textAlign: TextAlign.center,textDirection: TextDirection.ltr,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
