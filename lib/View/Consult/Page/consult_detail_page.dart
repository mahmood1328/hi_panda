import 'dart:convert';
import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart'as url;
import '../../../Widget/modal_equests.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/res/dimensions.dart';
import '../../../utils/size_config.dart';
import '../Components/item_register_show.dart';
import '../Controller/consult_controller.dart';

class ConsultDetailPage extends StatefulWidget {
  final int id;
  const ConsultDetailPage({Key? key,required this.id}) : super(key: key);

  @override
  State<ConsultDetailPage> createState() => _ConsultDetailPageState();
}

class _ConsultDetailPageState extends State<ConsultDetailPage> {
  File? file1;
  File? file2;
  File? file3;
  @override
  Widget build(BuildContext context) {
    return GetX<ConsultController>(
        init: Get.put(ConsultController()),

        builder: (consultController) {
          return Scaffold(
            backgroundColor: ColorsApp.white,
            body: SizedBox(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height:40,
                      width:SizeConfig.screenWidth,
                      decoration: const BoxDecoration(
                        color: ColorsApp.primary,
                        borderRadius:BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                        //border: Border.all(width: 1,color: ColorsApp.primaryLight.withOpacity(0.3))

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 10),
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
                                "${ConstAddress.icon}arrowLeft.svg",color: ColorsApp.black,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(consultController.consultInfoModel!.ticketNumber,
                                style:const TextStyle(color: ColorsApp.black,fontSize:18,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),
                              const  Text(": مشاوره",
                                style: TextStyle(color: ColorsApp.black,fontSize:18,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.only(right: 20,top: 20),
                      height: SizeConfig.screenHeight/5,
                      width: SizeConfig.screenWidth,
                      decoration: const BoxDecoration(
                          color: ColorsApp.backTextField,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 20,width: 20,
                                decoration: const BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                child:  Text(consultController.consultInfoModel!.countRequest.toString(),
                                  style: const TextStyle(color: ColorsApp.white,fontSize:13,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                              ),
                              const SizedBox(width: 5,),
                              Text(consultController.consultInfoModel!.phoneNumber,
                                style:const TextStyle(color: ColorsApp.colorTextT1,fontSize:14,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),
                              const SizedBox(width: 5,),
                              Text(consultController.consultInfoModel!.name,
                                style:const TextStyle(color: ColorsApp.colorTextT1,fontSize:16,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),

                            ],
                          ),
                          const SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,

                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(consultController.consultInfoModel!.isView==false?"خیر" : "بله",
                                          style:const TextStyle(color: ColorsApp.colorTextT1,fontSize:12,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                                        const SizedBox(width: 5,),
                                        const Text(": مشاهده ",
                                          style:TextStyle(color: ColorsApp.primaryTextColor,fontSize:10,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(consultController.consultInfoModel!.isBuy==false?"خیر" : "بله",
                                          style:const TextStyle(color: ColorsApp.colorTextT1,fontSize:12,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                                        const SizedBox(width: 5,),
                                        const Text(": خرید",
                                          style:TextStyle(color: ColorsApp.primaryTextColor,fontSize:10,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(consultController.consultInfoModel!.isChat==false?"خیر" : "بله",
                                          style:const TextStyle(color: ColorsApp.colorTextT1,fontSize:12,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                                        const SizedBox(width: 5,),
                                        const  Text(" : چت",
                                          style: TextStyle(color: ColorsApp.primaryTextColor,fontSize:10,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(consultController.consultInfoModel!.isCall==false?"خیر" : "بله",
                                          style:const TextStyle(color: ColorsApp.colorTextT1,fontSize:12,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                                        const SizedBox(width: 5,),
                                        const Text(" : تماس",
                                          style: TextStyle(color: ColorsApp.primaryTextColor,fontSize:10,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(consultController.consultInfoModel!.showDate,
                                          style:const TextStyle(color: ColorsApp.colorTextT1,fontSize:12,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                                        const SizedBox(width: 5,),
                                        const Text(": تاریخ ",
                                          style:TextStyle(color: ColorsApp.primaryTextColor,fontSize:10,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(consultController.consultInfoModel!.whatsAppNumber,
                                          style:const TextStyle(color: ColorsApp.colorTextT1,fontSize:12,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                                        const SizedBox(width: 5,),
                                        const Text(": واتس آپ",
                                          style:TextStyle(color: ColorsApp.primaryTextColor,fontSize:10,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(consultController.consultInfoModel!.linkName??"",
                                          style:const TextStyle(color: ColorsApp.colorTextT1,fontSize:12,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                                        const SizedBox(width: 5,),
                                        const  Text(" : کمپین",
                                          style: TextStyle(color: ColorsApp.primaryTextColor,fontSize:10,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(consultController.consultInfoModel!.ticketNumber,
                                          style:const TextStyle(color: ColorsApp.colorTextT1,fontSize:12,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                                        const SizedBox(width: 5,),
                                        const Text(" : شماره",
                                          style: TextStyle(color: ColorsApp.primaryTextColor,fontSize:10,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                                      ],
                                    ),
                                  ],
                                ),





                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:  const EdgeInsets.only(top: 20,left: 0,right: 0),
                            child: Center(
                              child: ElevatedButton(

                                
                                style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenWidth/5, 45)),
                                    foregroundColor: MaterialStateProperty.all<Color>( ColorsApp.iconTextField),
                                    backgroundColor: MaterialStateProperty.all<Color>( ColorsApp.iconTextField),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(Dimensions.borderRadiusComponents),
                                            side: const BorderSide(color:ColorsApp.iconTextField)
                                        )
                                    )
                                ),

                                onPressed: () {
                                  showCupertinoModalBottomSheet(
                                      expand: false,
                                      context: context,
                                      useRootNavigator: true,
                                      backgroundColor: ColorsApp.white,
                                      builder: (BuildContext context) =>

                                          ModalRequests(detailShow: consultController.consultInfoModel!.detailShow,));
                                },
                                child: const Text(
                                  "فعالیت ها",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,fontFamily: "IranSANS",
                                      color: ColorsApp.white),
                                  textAlign: TextAlign.center,
                                ),),
                            ),
                          ),
                          Padding(
                            padding:  const EdgeInsets.only(top: 20,left: 0,right: 0),
                            child: Center(
                              child: ElevatedButton(

                                style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenWidth/5, 45)),
                                    foregroundColor: MaterialStateProperty.all<Color>( ColorsApp.primaryLight),
                                    backgroundColor: MaterialStateProperty.all<Color>( ColorsApp.primaryLight),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(Dimensions.borderRadiusComponents),
                                            side: const BorderSide(color:ColorsApp.primaryLight)
                                        )
                                    )
                                ),

                                onPressed: () {
                                  url.launch('tel: ${consultController.consultInfoModel!.phoneNumber}');
                                },
                                child: const Text(
                                  "تماس تلفنی",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,fontFamily: "IranSANS",
                                      color: ColorsApp.white),
                                  textAlign: TextAlign.center,
                                ),),
                            ),
                          ),
                          Padding(
                            padding:  const EdgeInsets.only(top: 20,left: 0,right: 0),
                            child: Center(
                              child: ElevatedButton(

                                style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenWidth/5, 45)),
                                    foregroundColor: MaterialStateProperty.all<Color>( ColorsApp.green),
                                    backgroundColor: MaterialStateProperty.all<Color>( ColorsApp.green),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(Dimensions.borderRadiusComponents),
                                            side: const BorderSide(color:ColorsApp.green)
                                        )
                                    )
                                ),

                                onPressed: () {
                                  url.launch("whatsapp://send?text=پشتیبان عزیز من در خصوص دوره های شما نیاز به مشاوره دارم&phone=${consultController.consultInfoModel!.whatsAppNumber}");
                                },
                                child: const Text(
                                  "Whatsapp",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,fontFamily: "IranSANS",
                                      color: ColorsApp.white),
                                  textAlign: TextAlign.center,
                                ),),
                            ),
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        width: SizeConfig.screenWidth,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){

                                consultController.getIndexPageDetail(1);
                              },
                              child: Column(
                                children: [
                                  Text("فروش دوره",
                                    style: TextStyle(color: consultController.indexValuePageDetail.value==1?ColorsApp.primaryLight:ColorsApp.primaryLight.withOpacity(0.3),fontSize:14,fontFamily: "IranSANS",fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 8,),
                                  Container(
                                    height: 2,
                                    width: SizeConfig.screenWidth/3.6,
                                    color: consultController.indexValuePageDetail.value==1? ColorsApp.primaryLight:ColorsApp.primaryLight.withOpacity(0.3),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                consultController.getIndexPageDetail(2);
                              },
                              child: Column(
                                children: [
                                  Text("ثبت نتیجه",
                                    style: TextStyle(color:consultController.indexValuePageDetail.value==2? ColorsApp.primaryLight:ColorsApp.primaryLight.withOpacity(0.3),fontSize: 14,fontFamily: "IranSANS",fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 8,),
                                  Container(
                                    height: 2,
                                    width: SizeConfig.screenWidth/3.6,
                                    color:consultController.indexValuePageDetail.value==2? ColorsApp.primaryLight:ColorsApp.primaryLight.withOpacity(0.3),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                consultController.getIndexPageDetail(3);
                              },
                              child: Column(
                                children: [
                                  Text("تاریخچه",
                                    style: TextStyle(color:consultController.indexValuePageDetail.value==3? ColorsApp.primaryLight:ColorsApp.primaryLight.withOpacity(0.3),fontSize: 14,fontFamily: "IranSANS",fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 8,),
                                  Container(
                                    height: 2,
                                    width: SizeConfig.screenWidth/3.6,
                                    color:consultController.indexValuePageDetail.value==3? ColorsApp.primaryLight:ColorsApp.primaryLight.withOpacity(0.3),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    consultController.indexValuePageDetail.value==1?
                    Column(
                      children: [
                        Directionality(textDirection: TextDirection.rtl,
                          child: Container(
                            height: 50,
                            width: SizeConfig.screenWidth,
                            decoration: const BoxDecoration(
                              borderRadius:BorderRadius.all(Radius.circular(10)),
                              color: ColorsApp.backTextField,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            margin: const EdgeInsets.only(top: 10,right: 30,left: 30),
                            child: DropdownButtonFormField2(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color:  ColorsApp.backTextField,
                                    width: 0.7,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color:  ColorsApp.backTextField,
                                    width: 0.7,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color:  ColorsApp.backTextField,
                                    width: 0.7,
                                  ),
                                  borderRadius: BorderRadius.circular(10),

                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.zero,

                              ),
                              isExpanded: true,
                              hint:  const Text(
                                'دوره',
                                style: TextStyle(fontSize: 15,fontFamily: "IranSANS",
                                  color: ColorsApp.colorTextNormal,fontWeight: FontWeight.w500,
                                ),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color:  ColorsApp.colorTextNormal,
                              ),
                              iconSize: 30,
                              buttonHeight: 60,
                              buttonPadding: const EdgeInsets.only(left: 20, right: 30),
                              dropdownDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ColorsApp.white
                              ),
                              items: consultController.consultInfoModel!.consultCourses
                                  .map((item) =>
                                  DropdownMenuItem<String>(
                                    value: item.name,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        item.name,
                                        style: const TextStyle(color: ColorsApp.colorTextNormal,fontWeight: FontWeight.normal,
                                            fontSize: 14,fontFamily: "IranSANS"
                                        ),textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                  ))
                                  .toList(),
                              validator: (value) {
                                print(value);
                                if (value == null) {
                                  return 'Please select gender.';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                //Do something when changing the item if you want.
                                consultController. getIdList(value.toString());
                                print(value);
                              },
                              onSaved: (value) {
                                //consultController. selectedValue.value = value.toString();
                                print(value);
                              },
                            ),
                          ),),
                        Directionality(textDirection: TextDirection.rtl,
                          child: Container(

                            height: 50,
                            width: SizeConfig.screenWidth,
                            decoration: const BoxDecoration(
                              borderRadius:BorderRadius.all(Radius.circular(10)),
                              color: ColorsApp.backTextField,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            margin: const EdgeInsets.only(top: 10,right: 30,left: 30),
                            child: DropdownButtonFormField2(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color:  ColorsApp.backTextField,
                                    width: 0.7,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:const BorderSide(
                                    color:  ColorsApp.backTextField,
                                    width: 0.7,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:const BorderSide(
                                    color:  ColorsApp.backTextField,
                                    width: 0.7,
                                  ),
                                  borderRadius: BorderRadius.circular(10),

                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.zero,

                              ),
                              isExpanded: true,
                              hint:  const Text(
                                'کمپین',
                                style: TextStyle(fontSize: 15,fontFamily: "IranSANS",
                                  color: ColorsApp.colorTextNormal,fontWeight: FontWeight.w500,
                                ),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color:  ColorsApp.colorTextNormal,
                              ),
                              iconSize: 30,
                              buttonHeight: 60,
                              buttonPadding: const EdgeInsets.only(left: 20, right: 30),
                              dropdownDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ColorsApp.white
                              ),
                              items: consultController.consultInfoModel!.siteLinks
                                  .map((item) =>
                                  DropdownMenuItem<String>(
                                    value: item.name,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        item.name,
                                        style: const TextStyle(color: ColorsApp.colorTextNormal,fontWeight: FontWeight.normal,
                                            fontSize: 14,fontFamily: "IranSANS"
                                        ),textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                  ))
                                  .toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select gender.';
                                }
                              },
                              onChanged: (value) {
                                //Do something when changing the item if you want.
                                consultController. getLink(value.toString());
                              },
                              onSaved: (value) {
                                consultController. getLink(value.toString());
                              },
                            ),
                          ),),
                        Directionality(textDirection: TextDirection.rtl,
                          child: Container(

                            height: 50,
                            width: SizeConfig.screenWidth,
                            decoration: const BoxDecoration(
                              borderRadius:BorderRadius.all(Radius.circular(10)),
                              color: ColorsApp.backTextField,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            margin: const EdgeInsets.only(top: 10,right: 30,left: 30),
                            child: DropdownButtonFormField2(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color:  ColorsApp.backTextField,
                                    width: 0.7,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color:  ColorsApp.backTextField,
                                    width: 0.7,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color:  ColorsApp.backTextField,
                                    width: 0.7,
                                  ),
                                  borderRadius: BorderRadius.circular(10),

                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.zero,

                              ),
                              isExpanded: true,
                              hint:  const Text(
                                'شرایط فروش',
                                style: TextStyle(fontSize: 15,fontFamily: "IranSANS",
                                  color: ColorsApp.colorTextNormal,fontWeight: FontWeight.w500,
                                ),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color:  ColorsApp.colorTextNormal,
                              ),
                              iconSize: 30,
                              buttonHeight: 60,
                              buttonPadding: const EdgeInsets.only(left: 20, right: 30),
                              dropdownDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ColorsApp.white
                              ),
                              items: consultController.listSplits
                                  .map((item) =>
                                  DropdownMenuItem<String>(
                                    value: item,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        item,
                                        style: const TextStyle(color: ColorsApp.colorTextNormal,fontWeight: FontWeight.normal,
                                            fontSize: 14,fontFamily: "IranSANS"
                                        ),textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                  ))
                                  .toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select gender.';
                                }
                              },
                              onChanged: (value) {
                                //Do something when changing the item if you want.
                                consultController. getInsta( value.toString());
                              },
                              onSaved: (value) {
                                consultController. getInsta( value.toString());
                              },
                            ),
                          ),),
                        const SizedBox(height: 10,),
                        Padding(
                          padding:const EdgeInsets.symmetric(horizontal: 30,vertical: 0),
                          child: TextField(
                            controller: consultController.controllerPrice,

                            cursorColor: ColorsApp.black,
                            onChanged: (value) {
                            },
                            onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                            //controller: controllerPhone,
                            textAlign: TextAlign.right,
                            style:const TextStyle(
                              fontSize: 17.0,
                              color: ColorsApp.colorTextNormal,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                              fillColor: ColorsApp.backTextField,
                              filled: true,
                              counterText: "",
                              contentPadding:
                              const EdgeInsets.only(left: 16, right: 30),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:const BorderSide(
                                  color:ColorsApp.backTextField,
                                  width: 0.7,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "قیمت ",
                              hintStyle:const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: ColorsApp.colorTextNormal,
                                  fontFamily: 'IranSANS'),
                            ),
                            maxLines: 1,
                            keyboardType: TextInputType.emailAddress,
                            // maxLength: 11,
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Padding(
                          padding:const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                          child: TextField(
                            controller: consultController.controllerText,

                            cursorColor: ColorsApp.black,
                            onChanged: (value) {
                            },
                            onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                            //controller: controllerPhone,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 17.0,
                              color: ColorsApp.colorTextNormal,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                              fillColor: ColorsApp.backTextField,
                              filled: true,
                              counterText: "",
                              contentPadding:
                              const EdgeInsets.only(left: 16, right: 30),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:const BorderSide(
                                  color:ColorsApp.backTextField,
                                  width: 0.7,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "توضیحات ",
                              hintStyle:const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: ColorsApp.colorTextNormal,
                                  fontFamily: 'IranSANS'),
                            ),
                            maxLines: 1,
                            keyboardType: TextInputType.emailAddress,
                            // maxLength: 11,
                          ),
                        ),

                        Directionality(textDirection: TextDirection.rtl,
                          child: Container(

                            height: 50,
                            width: SizeConfig.screenWidth,
                            padding: const EdgeInsets.only(left: 20),
                            margin: const EdgeInsets.only(top: 10,right: 5,left: 30),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Padding(
                                  padding:  EdgeInsets.only(right: 30),
                                  child: Text("تصویر رسید پرداخت",
                                      style: TextStyle(fontSize: 16,fontFamily: "IranSANS",
                                        color: ColorsApp.iconTextField,fontWeight: FontWeight.bold,
                                      ),),
                                ),
                              ],
                            ) ,
                          ),),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: ()async{
                                final result =
                                await ImagePicker()
                                    .pickImage(
                                    source:
                                    ImageSource
                                        .gallery);
                                if (result != null) {
                                  CroppedFile? ff =
                                  await ImageCropper()
                                      .cropImage(
                                    sourcePath: result.path,
                                    aspectRatioPresets: [
                                      CropAspectRatioPreset
                                          .square,
                                    ],
                                  );
                                  if (ff != null) {
                                    setState(() {
                                      file2 =
                                          File(ff.path);
                                    });

                                    if (ff != null) {
                                      setState(() {
                                        file2 =
                                            File(ff.path);
                                      });
                                      if (
                                      file2 !=
                                          null) {
                                        List<int> imageBytes =
                                        file2!
                                            .readAsBytesSync();
                                        consultController.base64Image1.value =
                                            base64Encode(
                                                imageBytes);
                                      }
                                    }
                                  }
                                }
                              },
                              child: Container(
                                height: SizeConfig.screenHeight/8,
                                width: SizeConfig.screenWidth/4,
                                decoration:const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: ColorsApp.backTextField
                                ),
                                child: Container(
                                    padding:file2!=null?const EdgeInsets.all(5):const EdgeInsets.all(25),
                                    child:file2!=null?Image.file(file2!): Image.asset("${ConstAddress.image}camera3.png",)),
                              ),
                            ),
                            GestureDetector(
                              onTap: ()async{
                                final result =
                                await ImagePicker()
                                    .pickImage(
                                    source:
                                    ImageSource
                                        .gallery);
                                if (result != null) {
                                  CroppedFile? ff =
                                  await ImageCropper()
                                      .cropImage(
                                    sourcePath: result.path,
                                    aspectRatioPresets: [
                                      CropAspectRatioPreset
                                          .square,
                                    ],
                                  );
                                  if (ff != null) {
                                   setState(() {
                                     file1 =
                                         File(ff.path);
                                   });
                                   if (ff != null) {
                                     setState(() {
                                       file1 =
                                           File(ff.path);
                                     });
                                     if (file1 !=
                                         null) {
                                       List<int> imageBytes =
                                       file1!
                                           .readAsBytesSync();
                                       consultController.base64Image2.value =
                                           base64Encode(
                                               imageBytes);

                                     }
                                   }
                                  }
                                }
                              },
                              child: Container(
                                height: SizeConfig.screenHeight/8,
                                width: SizeConfig.screenWidth/4,
                                decoration:const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: ColorsApp.backTextField
                                ),
                                child: Container(
                                    padding:file1!=null?const EdgeInsets.all(5):const EdgeInsets.all(25),
                                    child:file1!=null?Image.file(file1!): Image.asset("${ConstAddress.image}camera3.png",)),
                              ),
                            ),
                            GestureDetector(
                              onTap: ()async{
                                final result =
                                await ImagePicker()
                                    .pickImage(
                                    source:
                                    ImageSource
                                        .gallery);
                                if (result != null) {
                                  CroppedFile? ff =
                                  await ImageCropper()
                                      .cropImage(
                                    sourcePath: result.path,
                                    aspectRatioPresets: [
                                      CropAspectRatioPreset
                                          .square,
                                    ],
                                  );
                                  if (ff != null) {

                                   setState(() {
                                     file3 =
                                         File(ff.path);
                                   });

                                   if (ff != null) {
                                     setState(() {
                                       file3 =
                                           File(ff.path);
                                     });
                                     if (file3 !=
                                         null) {
                                       List<int> imageBytes =
                                       file3!
                                           .readAsBytesSync();
                                       consultController.base64Image3.value =
                                           base64Encode(
                                               imageBytes);

                                     }
                                   }
                                  }
                                }
                              },
                              child: Container(
                                height: SizeConfig.screenHeight/8,
                                width: SizeConfig.screenWidth/4,
                                decoration:const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: ColorsApp.backTextField
                                ),
                                child: Container(
                                    padding:file3!=null?const EdgeInsets.all(5):const EdgeInsets.all(25),
                                    child:file3!=null?Image.file(file3!): Image.asset("${ConstAddress.image}camera3.png",)),
                              ),
                            ),


                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30,left: 30,top: 10),
                          child: Column(
                            children: consultController.listImage.map((e) => Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text(
                                  "فایل ",
                                  style: TextStyle(fontSize: 16,fontFamily: "IranSANS",
                                    color: ColorsApp.iconTextField,fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Icon(Icons.image,color: ColorsApp.primary,),
                              ],
                            )).toList(),
                          ),
                        ),
                        Padding(
                          padding:  const EdgeInsets.only(top: 10,left: 30,right: 30),
                          child: Center(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenHeight/1.5, 50)),
                                  foregroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                                  backgroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(Dimensions.borderRadiusComponents),
                                          side: const BorderSide(color:ColorsApp.primary)
                                      )
                                  )
                              ),
                              onPressed: () {
                                consultController.addCourseConsult(widget.id,context);
                              },
                              child: const Text(
                                "تایید و ثبت",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                    color: ColorsApp.white),
                                textAlign: TextAlign.center,
                              ),),
                          ),
                        ),
                      ],
                    ):
                    consultController.indexValuePageDetail.value==2?
                    Column(
                      children: [
                        Container(
                          margin:const EdgeInsets.only(right: 30,left: 30,top: 10),
                          decoration: BoxDecoration(
                              borderRadius:const BorderRadius.all( Radius.circular(20)),
                              border: Border.all(color: ColorsApp.backTextField,width: 1)
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 15,),
                              Padding(
                                padding: const EdgeInsets.only(right: 30,bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Text(
                                      'تغییر اطلاعات',
                                      style: TextStyle(fontSize: 16,fontFamily: "IranSANS",
                                        color: ColorsApp.iconTextField,fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                child: TextField(
                                  controller: consultController.controllerUsername,
                                  cursorColor: ColorsApp.black,
                                  onChanged: (value) {
                                  },
                                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                                  //controller: controllerPhone,
                                  textAlign: TextAlign.right,
                                  style:const TextStyle(
                                    fontSize: 17.0,
                                    color: ColorsApp.colorTextNormal,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  decoration: InputDecoration(
                                    fillColor: ColorsApp.backTextField,
                                    filled: true,
                                    counterText: "",
                                    contentPadding:
                                    const EdgeInsets.only(left: 16, right: 30),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
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
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:const BorderSide(
                                        color:ColorsApp.backTextField,
                                        width: 0.7,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: "نام کاربری ",
                                    hintStyle:const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        color: ColorsApp.colorTextNormal,
                                        fontFamily: 'IranSANS'),
                                  ),
                                  maxLines: 1,
                                  keyboardType: TextInputType.emailAddress,
                                  // maxLength: 11,
                                ),
                              ),
                              Padding(
                                padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                child: TextField(
                                  controller: consultController.controllerMobile,

                                  cursorColor: ColorsApp.black,
                                  onChanged: (value) {
                                  },
                                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                                  //controller: controllerPhone,
                                  textAlign: TextAlign.right,
                                  style:const TextStyle(
                                    fontSize: 17.0,
                                    color: ColorsApp.colorTextNormal,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  decoration: InputDecoration(
                                    fillColor: ColorsApp.backTextField,
                                    filled: true,
                                    counterText: "",
                                    contentPadding:
                                    const EdgeInsets.only(left: 16, right: 30),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
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
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:const BorderSide(
                                        color:ColorsApp.backTextField,
                                        width: 0.7,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: "تلفن همراه ",
                                    hintStyle:const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        color: ColorsApp.colorTextNormal,
                                        fontFamily: 'IranSANS'),
                                  ),
                                  maxLines: 1,
                                  keyboardType: TextInputType.phone,
                                  maxLength: 11,
                                ),
                              ),
                              Padding(
                                padding:  const EdgeInsets.only(top: 5,left: 20,right: 20,bottom: 10),
                                child: Center(
                                  child: ElevatedButton(

                                    style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenHeight/1.5, 40)),
                                        foregroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                                        backgroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(Dimensions.borderRadiusComponents),
                                                side: const BorderSide(color:ColorsApp.primary)
                                            )
                                        )
                                    ),

                                    onPressed: () {
                                      consultController.changeDetailConsult(
                                          widget.id,
                                          consultController.controllerMobile.text,  consultController.controllerUsername.text, context);
                                    },
                                    child: const Text(
                                      "ثبت مشخصات",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                          color: ColorsApp.white),
                                      textAlign: TextAlign.center,
                                    ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:const EdgeInsets.only(right: 30,left: 30,top: 10),
                          decoration: BoxDecoration(
                              borderRadius:const BorderRadius.all( Radius.circular(20)),
                              border: Border.all(color: ColorsApp.backTextField,width: 1)
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 15,),
                              Directionality(textDirection: TextDirection.rtl,
                                child: Container(

                                  height: 50,
                                  width: SizeConfig.screenWidth,
                                  decoration: const BoxDecoration(
                                    borderRadius:BorderRadius.all(Radius.circular(10)),
                                    color: ColorsApp.backTextField,
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 0),
                                  margin: const EdgeInsets.only(top: 10,right: 20,left: 20),
                                  child: DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color:  ColorsApp.backTextField,
                                          width: 0.7,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color:  ColorsApp.backTextField,
                                          width: 0.7,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color:  ColorsApp.backTextField,
                                          width: 0.7,
                                        ),
                                        borderRadius: BorderRadius.circular(10),

                                      ),
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,

                                    ),
                                    isExpanded: true,
                                    hint:const  Text(
                                      'انتخاب کنید',
                                      style: TextStyle(fontSize: 15,fontFamily: "IranSANS",
                                        color: ColorsApp.colorTextNormal,fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color:  ColorsApp.colorTextNormal,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(left: 20, right: 30),
                                    dropdownDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: ColorsApp.white
                                    ),
                                    items: consultController.operation
                                        .map((item) =>
                                        DropdownMenuItem<String>(
                                          value: item.name,
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              item.name,
                                              style: const TextStyle(color: ColorsApp.colorTextNormal,fontWeight: FontWeight.normal,
                                                  fontSize: 14,fontFamily: "IranSANS"
                                              ),textDirection: TextDirection.rtl,
                                            ),
                                          ),
                                        ))
                                        .toList(),
                                    validator: (value) {
                                      print(value);
                                      if (value == null) {
                                        return 'Please select gender.';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      //Do something when changing the item if you want.
                                      consultController. getNameOperation(value.toString());
                                      print(value);
                                    },
                                    onSaved: (value) {
                                      //consultController. selectedValue.value = value.toString();
                                      print(value);
                                    },
                                  ),
                                ),),
                              consultController.valueOperation.value=="درصد خرید" ? RatingBar(
                                  initialRating: 1,
                                  direction:
                                  Axis.horizontal,
                                  itemCount: 5,
                                  itemSize: 40,
                                  ratingWidget:
                                  RatingWidget(
                                    full: const Icon(
                                      Icons.star,
                                      color:
                                      ColorsApp.yellow,
                                    ),
                                    half: Icon(
                                      Icons.star,
                                      color: ColorsApp.black
                                          .withOpacity(0.3),
                                    ),
                                    empty: Icon(
                                      Icons.star,
                                      color: ColorsApp.black
                                          .withOpacity(0.3),
                                    ),
                                  ),
                                  onRatingUpdate: (value) {
                                    consultController
                                        .getRate(value);
                                  }):const SizedBox(),
                              consultController.valueOperation.value=="نتیجه مذاکره" ? Directionality(textDirection: TextDirection.rtl,
                                child: Container(

                                  height: 50,
                                  width: SizeConfig.screenWidth,
                                  decoration: const BoxDecoration(
                                    borderRadius:BorderRadius.all(Radius.circular(10)),
                                    color: ColorsApp.backTextField,
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 0),
                                  margin: const EdgeInsets.only(top: 10,right: 20,left: 20),
                                  child: DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color:  ColorsApp.backTextField,
                                          width: 0.7,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color:  ColorsApp.backTextField,
                                          width: 0.7,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color:  ColorsApp.backTextField,
                                          width: 0.7,
                                        ),
                                        borderRadius: BorderRadius.circular(10),

                                      ),
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,

                                    ),
                                    isExpanded: true,
                                    hint: const Text(
                                      'انتخاب نتیجه',
                                      style: TextStyle(fontSize: 15,fontFamily: "IranSANS",
                                        color: ColorsApp.colorTextNormal,fontWeight: FontWeight.w500,
                                      ),
                                    ),

                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color:  ColorsApp.colorTextNormal,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(left: 20, right: 30),
                                    dropdownDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: ColorsApp.white
                                    ),
                                    items: consultController.consultInfoModel!.results
                                        .map((item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              item,
                                              style: const TextStyle(color: ColorsApp.colorTextNormal,fontWeight: FontWeight.normal,
                                                  fontSize: 14,fontFamily: "IranSANS"
                                              ),textDirection: TextDirection.rtl,
                                            ),
                                          ),
                                        ))
                                        .toList(),
                                    validator: (value) {
                                      print(value);
                                      if (value == null) {
                                        return 'Please select gender.';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      //Do something when changing the item if you want.
                                      consultController.getResult(value.toString());
                                      print(value);
                                    },
                                    onSaved: (value) {
                                      //consultController. selectedValue.value = value.toString();
                                      print(value);
                                    },
                                  ),
                                ),):const SizedBox(),
                              Padding(
                                padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                child: TextField(
                                  controller: consultController.controllerInfo,

                                  cursorColor: ColorsApp.black,
                                  onChanged: (value) {
                                  },
                                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                                  //controller: controllerPhone,
                                  textAlign: TextAlign.right,
                                  style:const TextStyle(
                                    fontSize: 17.0,
                                    color: ColorsApp.colorTextNormal,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  decoration: InputDecoration(
                                    fillColor: ColorsApp.backTextField,
                                    filled: true,
                                    counterText: "",
                                    contentPadding:
                                    const EdgeInsets.only(left: 16, right: 30,top: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
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
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:const BorderSide(
                                        color:ColorsApp.backTextField,
                                        width: 0.7,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: "... اینجا بنویسید  ",
                                    hintStyle:const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        color: ColorsApp.colorTextNormal,
                                        fontFamily: 'IranSANS'),
                                  ),
                                  maxLines: 5,
                                  keyboardType: TextInputType.emailAddress,
                                  // maxLength: 11,
                                ),
                              ),
                              Padding(
                                padding:  const EdgeInsets.only(top: 5,left: 20,right: 20,bottom: 20),
                                child: Center(
                                  child: ElevatedButton(

                                    style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenHeight/1.5, 40)),
                                        foregroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                                        backgroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(Dimensions.borderRadiusComponents),
                                                side: const BorderSide(color:ColorsApp.primary)
                                            )
                                        )
                                    ),

                                    onPressed: () {
                                      consultController.consultOperation(widget.id, consultController.selectOperation.value,
                                          consultController.rate.value.toInt(), consultController. valueResult.value, consultController.controllerInfo.text, context);

                                    },
                                    child: const Text(
                                      "ثبت نتیجه چت",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                          color: ColorsApp.white),
                                      textAlign: TextAlign.center,
                                    ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                      ],
                    ):consultController.indexValuePageDetail.value==3?
                    Container(
                      padding:const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Column(
                            children:consultController.consultInfoModel!.detailRegisterShow.map((e) => ItemRegisterShowComponents(detailRegisterShow: e,)).toList() ,
                          ),
                          consultController.consultInfoModel!.detailRegisterShow.isEmpty?  const Text(
                           " تاریخچه ای یافت نشد",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,fontFamily: "IranSANS",
                                color: ColorsApp.colorTextNormal),
                            textAlign: TextAlign.center,
                          ):const SizedBox(),
                        ],
                      ),
                    ):Column(
                      children:consultController.consultInfoModel!.detailRegisterShow.map((e) => ItemRegisterShowComponents(detailRegisterShow: e,)).toList() ),
                  ],
                ),
              ),
            ),
          );

        });

  }
}
