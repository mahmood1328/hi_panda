import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Network/service_url.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../../Main_page/Controller/controller_main_page.dart';
import '../Controller/sent_request_controller.dart';

class ResponsesPage extends StatelessWidget {
  const ResponsesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
var sentRequestController=Get.put(SentRequestController());
// final controller = Get.put(MainPageController());
    return SizedBox(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 50,),
            Container(
              margin:const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              height: 130,
              width:130,
              decoration:   BoxDecoration(
                  borderRadius:const BorderRadius.all(Radius.circular(70),

                  ),
                  color: ColorsApp.textColorSub,
                  image: DecorationImage(fit: BoxFit.fill,image:
                  NetworkImage( ServiceURL.baseUrl + sentRequestController.registerConsultModel!.photo))
              ),

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(sentRequestController.registerConsultModel!.name , style:const TextStyle(fontSize: 18 , fontWeight: FontWeight.w500 , color: ColorsApp.colorTextTitle,fontFamily: "IranSANS"),textDirection: TextDirection.rtl),
                const Text("پشتیبان شما : " , style:TextStyle(fontSize: 16 , fontWeight: FontWeight.normal , color: ColorsApp.iconTextField,fontFamily: "IranSANS"),textDirection: TextDirection.rtl),
              ],
            ),
            const SizedBox(height: 80,),
            const Text("ثبت موفقیت درخواست" , style:TextStyle(fontSize: 18 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextTitle,fontFamily: "IranSANS"),textDirection: TextDirection.rtl),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
              child:  Text( "درخواست شما با شماره پیگیری ${sentRequestController.registerConsultModel!.number} ثبت گردید، مشاورین ما پس از بررسی درخواست شما، با شما تماس حاصل خواهند نمود.",
                textScaleFactor:1.08 , textDirection: TextDirection.rtl , textAlign: TextAlign.center,style: const TextStyle(fontSize: 13 , fontWeight: FontWeight.normal , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                launch("whatsapp://send?text=پشتیبان عزیز من در خصوص دوره های شما نیاز به مشاوره دارم&phone=${sentRequestController.registerConsultModel!.whatsappPhone}");
              },
              child: Container(
                width: SizeConfig.screenWidth,
                margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                padding:const EdgeInsets.only(top: 10,bottom: 10),
                decoration:const BoxDecoration(
                  color: ColorsApp.primaryLight2,
                  borderRadius:  BorderRadius.all(Radius.circular(30),
                  ),
                ),

                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    SizedBox(
                        height: 25,width: 25,
                        child: Image.asset("${ConstAddress.image}whatsapp.png",color: ColorsApp.white,)),
                    const  SizedBox(width: 20,),
                    const Text("همین الان با مشاوره گفتگو کنید" , style:  TextStyle(fontSize: 17 , fontWeight: FontWeight.normal , color: ColorsApp.white,fontFamily: "IranSANS"),),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
