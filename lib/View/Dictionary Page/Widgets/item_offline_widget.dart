import 'package:flutter/material.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';

class ItemOfflineWidget extends StatelessWidget {
  const ItemOfflineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20,right: 20),
      child: Card(
        color:   ColorsApp.white,
        surfaceTintColor: Colors.grey,
        shadowColor:Colors.grey ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        semanticContainer: true,
        clipBehavior: Clip.hardEdge,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:  [
                  // Container(
                  //   height: 30,width: 30,
                  //   padding: const EdgeInsets.all(7),
                  //   child: Image.asset("${ConstAddress.image}audio.png",color: ColorsApp.iconTextField.withOpacity(0.4),),
                  // ),
                  Text(
                    "کلمه معنی شده",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                        color: ColorsApp.black.withOpacity(0.5)),
                    textAlign: TextAlign.center,
                  ),

                ],
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "کلمه معنی شده صفت است",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                        color: ColorsApp.black.withOpacity(0.5)),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    " : توضیحات",
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                        color: ColorsApp.black.withOpacity(0.8)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
