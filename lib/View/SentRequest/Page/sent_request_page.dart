import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../Network/service_url.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Components/loading_sent_request.dart';
import '../Controller/sent_request_controller.dart';
import 'respons_page.dart';

class SentRequestPage extends StatelessWidget {
  const SentRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetX<SentRequestController>(
        init: Get.put(SentRequestController()),
        builder: (sentRequestController) {
          return sentRequestController.isLoading.value
              ? Scaffold(
            backgroundColor: ColorsApp.white,
            body: SizedBox(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      height: SizeConfig.screenHeight/6,
                      width: SizeConfig.screenWidth,
                      decoration: const BoxDecoration(
                          color: ColorsApp.primary,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
                      ),
                      child: Padding(
                        padding:  EdgeInsets.only(top: SizeConfig.screenHeight/6/2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            GestureDetector(
                              onTap: (){
                                Get.back();
                              },
                              child: SizedBox(
                                height: 25,
                                width: 25,
                                child: SvgPicture.asset(
                                  "${ConstAddress.icon}arrowLeft.svg",color: ColorsApp.white,
                                ),
                              ),
                            ),
                            const Text("درخواست مشاوره آنلاین " , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: ColorsApp.white,fontFamily: "IranSANS"),),

                          ],
                        ),
                      ),
                    ),
                    sentRequestController.registerNew.value? const ResponsesPage():  Column(
                    children: [
                      Container(
                        margin:const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
                        height: SizeConfig.screenHeight/4,
                        width: SizeConfig.screenWidth,
                        decoration:   BoxDecoration(
                            borderRadius:const BorderRadius.all(Radius.circular(30),
                            ),
                            image: DecorationImage(fit: BoxFit.fill,image:
                            NetworkImage( ServiceURL.baseUrl + sentRequestController.consultPageModel!.photo))
                        ),

                      ),
                      Text(sentRequestController.consultPageModel!.title , style:const TextStyle(fontSize: 18 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextTitle,fontFamily: "IranSANS"),textDirection: TextDirection.rtl),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                        child:  Text( sentRequestController.consultPageModel!.descript,
                          textScaleFactor:1.08 , textDirection: TextDirection.rtl , textAlign: TextAlign.justify,style: TextStyle(fontSize: 13 , fontWeight: FontWeight.normal , color: ColorsApp.colorTextNormal,fontFamily: "IranSANS"),),
                      ),
                      const SizedBox(height: 20,),
                      Padding(
                        padding:const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                        child: TextField(
                          //controller: controllerEmail,
                          cursorColor: Colors.grey,
                          onChanged: (value) {
                          },
                          onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                          controller: sentRequestController.controllerName,
                          textAlign: TextAlign.right,
                          style:const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black45,
                            fontWeight: FontWeight.normal,fontFamily: 'IranSANS'
                          ),
                          decoration: InputDecoration(
                            fillColor: ColorsApp.backTextField,
                            filled: true,
                            suffixIcon:  Container(
                              padding:const EdgeInsets.all(8),
                              margin:const EdgeInsets.only(right: 10),
                              child: SvgPicture.asset(
                                "${ConstAddress.icon}userR.svg",color: ColorsApp.iconTextField,height: 15,width: 15,
                              ),
                            ),
                            counterText: "",
                            contentPadding:
                            const EdgeInsets.only(left: 16, right: 5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32),
                              borderSide:const BorderSide(
                                color: ColorsApp.backTextField,
                                width: 0.7,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:const BorderSide(
                                color: ColorsApp.backTextField,
                                width: 0.7,
                              ),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:const BorderSide(
                                color:ColorsApp.backTextField,
                                width: 0.7,
                              ),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            hintText: sentRequestController.controllerName.text,
                            hintStyle:const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                color: ColorsApp.iconTextField,
                                fontFamily: 'IranSANS'),
                          ),
                          maxLines: 1,
                          keyboardType: TextInputType.emailAddress,
                          // maxLength: 11,
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                        child: TextField(
                          //controller: controllerEmail,
                          cursorColor: Colors.grey,
                          onChanged: (value) {
                          },
                          onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                          controller: sentRequestController.controllerPhone,
                          textAlign: TextAlign.right,
                          style:const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black45,
                            fontWeight: FontWeight.normal,fontFamily: 'IranSANS'
                          ),
                          decoration: InputDecoration(
                            fillColor: ColorsApp.backTextField,
                            filled: true,
                            suffixIcon:  Container(
                              padding:const EdgeInsets.all(7),
                              margin:const EdgeInsets.only(right: 10),
                              child: SvgPicture.asset(
                                "${ConstAddress.icon}mobileR.svg",color: ColorsApp.iconTextField,
                              ),
                            ),
                            counterText: "",
                            contentPadding:
                            const EdgeInsets.only(left: 16, right: 5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32),
                              borderSide:const BorderSide(
                                color: ColorsApp.backTextField,
                                width: 0.7,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:const BorderSide(
                                color: ColorsApp.backTextField,
                                width: 0.7,
                              ),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:const BorderSide(
                                color:ColorsApp.backTextField,
                                width: 0.7,
                              ),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            hintText: sentRequestController.controllerPhone.text,
                            hintStyle:const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                color: ColorsApp.iconTextField,
                                fontFamily: 'IranSANS'),
                          ),
                          maxLines: 1,
                          keyboardType: TextInputType.phone,
                           maxLength: 11,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          sentRequestController.registerNewConsult(sentRequestController.controllerName.text,
                              sentRequestController.controllerPhone.text,context);
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
                            children: const [
                              Text(" ثبت درخواست" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.normal , color: ColorsApp.white,fontFamily: "IranSANS"),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                  ],
                ),
              ),
            ),
          )
              : const LoadingSentRequest();
        });

  }
}
