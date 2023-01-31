import 'package:flutter/material.dart';

import '../../utils/const.dart';
import '../../utils/res/colors.dart';
import '../../utils/size_config.dart';


class ComingSoonPage extends StatelessWidget {
  final String name;
  const ComingSoonPage({Key? key , required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          children: [
            Container(
              height:40,
              width:SizeConfig.screenWidth,
              decoration: BoxDecoration(
                color: ColorsApp.primary,
                borderRadius:const BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                //border: Border.all(width: 1,color: ColorsApp.primaryLight.withOpacity(0.3))

              ),
            ),
            SizedBox(height: SizeConfig.screenHeight/3,),
            Image.asset(ConstAddress.image + "locked.png",color: ColorsApp.iconTextField,),
            const SizedBox(height: 10,),
            Text(name , style: const TextStyle(fontSize: 18 , fontWeight: FontWeight.w500 , color: ColorsApp.colorTextNormal,fontFamily: "home"),),
          ],
        ),
      ),
    );
  }
}
