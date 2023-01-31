import 'package:flutter/cupertino.dart';

import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Model/chat_messages_model.dart';

class DateTimeComponent extends StatelessWidget {
  final Message message;
  const DateTimeComponent({Key? key,required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin:  EdgeInsets.only(right: SizeConfig.screenWidth/3.2,left: SizeConfig.screenWidth/3.2,bottom: 5,top: 20,),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: ColorsApp.backTextField,

      ),
      child: Text(message.message , style:
      const TextStyle(fontSize: 10 , fontWeight: FontWeight.normal ,
          color: ColorsApp.colorTextNormal
          ,fontFamily: "IranSANS"),textDirection: TextDirection.rtl),
    );
  }
}
