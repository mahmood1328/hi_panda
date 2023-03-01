import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/res/dimensions.dart';
import '../../../utils/size_config.dart';
import '../Components/item_box_flash_card.dart';
import '../Controller/flash_card_controller.dart';
import 'detail_box_flash_card_page.dart';

class DetailsFlashCardPage extends StatelessWidget {
  final String? title;
  final int id;
  const DetailsFlashCardPage({Key? key,required this.title,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index=0;
    var flashCardController=Get.put(FlashCardController());
    return Scaffold(
      backgroundColor: ColorsApp.white,
      appBar: AppBar(
        backgroundColor: ColorsApp.primary,
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Container(
            padding:const EdgeInsets.all(15),
            margin:const EdgeInsets.only(left: 3),
            height: 20,
            width: 20,
            child: SvgPicture.asset(
              "${ConstAddress.icon}arrowLeft.svg",color: ColorsApp.white,
            ),
          ),
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:  [
            Text(title??"" , style: const TextStyle(fontSize: 18 , fontWeight: FontWeight.bold , color: ColorsApp.white,fontFamily: "IranSANS"),),
          ],
        ),
      ),
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 3),
                decoration: BoxDecoration(
                    color: ColorsApp.primary,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10))
                ) ,

                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:   [
                    const Text(" عدد " , style: TextStyle(fontSize: 10 , fontWeight: FontWeight.bold , color: ColorsApp.white,fontFamily: "IranSANS"),),
                    Text(flashCardController.getBoxModel!.countBox.toString(), style: TextStyle(fontSize: 11 , fontWeight: FontWeight.bold , color: ColorsApp.white,fontFamily: "IranSANS"),),
                    const  Text(": تعداد" , style: TextStyle(fontSize: 13 , fontWeight: FontWeight.bold , color: ColorsApp.white,fontFamily: "IranSANS"),),
                  ],
                ),
              ),

            ],
          ),

          SizedBox(
            height:SizeConfig.screenHeight,
            width:SizeConfig.screenWidth,
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right:20,top: 50),
                      child: GridView.count(
                        crossAxisSpacing:  0.5,
                        // controller: _listScrollController,
                        shrinkWrap : true,
                        mainAxisSpacing:5 ,
                        childAspectRatio: 1.3,
                        crossAxisCount: 2,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        children: List.generate(flashCardController.getBoxModel!.boxes.length, (index) {
                          return  InkWell(
                            onTap: (){
                              flashCardController.getKeyWord(id, context, flashCardController.getBoxModel!.boxes[index].box, 0,
                                  flashCardController.getBoxModel!.boxes[index].title,flashCardController.getBoxModel!.boxes[index].nextBox,
                                  flashCardController.getBoxModel!.boxes[index].prevBox
                              );
                            },
                            child: ItemBoxFlashCardComponents(box: flashCardController.getBoxModel!.boxes[index], color: flashCardController.listColors[index],),
                          );
                        }),
                      ),
                    ),
                  ),



                ],
              ),
            ),

          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenHeight/4.5, 40)),
                        foregroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                        backgroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(color:ColorsApp.primary)
                            )
                        )
                    ),

                    onPressed: () {
                      flashCardController.listPhone.clear();
                      showCupertinoModalBottomSheet(
                          expand: false,
                          context: context,
                          useRootNavigator: true,
                          backgroundColor: ColorsApp.white,
                          builder: (BuildContext context) =>

                              Obx(() => Material(
                                  color: ColorsApp.white,
                                  child: SafeArea(
                                    top: false,
                                    child: SizedBox(
                                      height:SizeConfig.screenHeight,
                                      width:SizeConfig.screenWidth,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[

                                          Container(
                                            margin: const EdgeInsets.only(bottom: 4,top: 8),
                                            width: 80,
                                            height: 4,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.withOpacity(0.8),
                                                borderRadius: BorderRadius.circular(16)
                                            ),
                                          ),
                                          Obx(() => Padding(
                                            padding: const EdgeInsets.only(right: 40),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [

                                                TextButton(onPressed: (){ }, child: Text("ارسال به صورت گروهی برای همه",style: TextStyle(color: ColorsApp.primaryLight2,fontSize: 14,fontFamily: "IranSANS",fontWeight: FontWeight.bold,decoration: TextDecoration.underline),)),
                                                IconButton(onPressed: (){flashCardController.getChecking();}, icon:  Icon( flashCardController.isCheck.value?Icons.check_box: Icons.check_box_outline_blank,color: ColorsApp.primaryLight2,)),
                                              ],
                                            ),
                                          ),),

                                          Row(
                                            children: [

                                              GestureDetector(

                                                child: Container(
                                                  margin: const EdgeInsets.only(left: 40),
                                                  padding: const EdgeInsets.all(8),

                                                  height: 50,width: 50,
                                                  decoration: BoxDecoration(
                                                      color:flashCardController.isCheck.value?  ColorsApp.onColor: ColorsApp.primary,
                                                    borderRadius: const BorderRadius.all(Radius.circular(10))
                                                  ),
                                                  child: SvgPicture.asset(ConstAddress.icon+"addPersone.svg",color: Colors.white,),
                                                ),
                                                onTap: (){
                                                  flashCardController.addPhoneNumber();
                                                },
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 20,right: 40,top: 20,bottom: 20),
                                                  child: TextFormField(
                                                    readOnly: flashCardController.isCheck.value?true:false,
                                                    onChanged: (value) {
                                                      // if(value.length==11){
                                                      //   setState(() {
                                                      //     phone=true;
                                                      //   });
                                                      // }else{
                                                      //   setState(() {
                                                      //     phone=false;
                                                      //   });
                                                      // }
                                                    },
                                                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                                                    controller: flashCardController.phoneController,
                                                    textAlign: TextAlign.right,
                                                    style: const TextStyle(
                                                        fontSize: 18.0,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.normal,fontFamily: "IranSANS"
                                                    ),
                                                    decoration: InputDecoration(
                                                      fillColor:flashCardController.isCheck.value?  ColorsApp.onColor: ColorsApp.offColor,
                                                      filled: true,
                                                      // suffixIcon:const Icon(Icons.phone_android,color: ColorsApp.iconTextField,),
                                                      counterText: "",
                                                      contentPadding:
                                                      const EdgeInsets.only(left: 16, right: 16),
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(8.0),
                                                        borderSide: const BorderSide(
                                                          color: Color(0xffF9F9F9),
                                                          width: 0.7,
                                                        ),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color: Color(0xffF9F9F9),
                                                          width: 0.7,
                                                        ),
                                                        borderRadius: BorderRadius.circular(8.0),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color: Color(0xffF9F9F9),
                                                          width: 0.7,
                                                        ),
                                                        borderRadius: BorderRadius.circular(8.0),
                                                      ),
                                                      hintText: "شماره همراه",
                                                      hintStyle: const TextStyle(
                                                          fontSize: 14.0,
                                                          fontWeight: FontWeight.normal,
                                                          color: ColorsApp.colorTextNormal,
                                                          fontFamily: 'IRANSans'),
                                                    ),
                                                    keyboardType: TextInputType.phone,maxLength: 11,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),


                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 40),
                                            child: Card(
                                              color:flashCardController.isCheck.value?   ColorsApp.onColor: ColorsApp.offColor,
                                              elevation: 4,
                                              surfaceTintColor: Colors.grey,
                                              shadowColor:Colors.grey ,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                // side:  BorderSide(color: flashCard.level==1?ColorsApp.yellow:flashCard.level==2?ColorsApp.primary:ColorsApp.red,)
                                              ),
                                              semanticContainer: true,
                                              clipBehavior: Clip.hardEdge,
                                              child: Container(
                                                height:SizeConfig.screenHeight/4,
                                                width:SizeConfig.screenWidth,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: flashCardController.listPhone.map((element) {
                                                      return Padding(
                                                        padding: const EdgeInsets.only(right: 20,top: 10),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          children: [
                                                            Text(
                                                              "$element -",
                                                              style: const TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                                                  color: ColorsApp.black),
                                                              textAlign: TextAlign.end,
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },).toList()
                                                  ),
                                                ),

                                              ),
                                            ),
                                          )
                                          ,
                                          const Spacer(),
                                          flashCardController.listPhone.isEmpty&&flashCardController.isCheck==false?  Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                "فیلدها را تکمیل کنید",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                                    color: ColorsApp.red),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ):const SizedBox(),
                                          Padding(
                                            padding:  const EdgeInsets.only(top: 20,left: 40,right: 40),
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
                                                  if(flashCardController.listPhone.isNotEmpty&&flashCardController.isCheck.value==false){
                                                    flashCardController.sendToMyFried(id, flashCardController.isCheck.value, flashCardController.listPhone, context);
                                                  }else  if(flashCardController.isCheck.value){
                                                    flashCardController.sendToMyFried(id, flashCardController.isCheck.value, flashCardController.listPhone, context);
                                                  }
                                                },
                                                child: const Text(
                                                  "ارسال",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                                      color: ColorsApp.white),
                                                  textAlign: TextAlign.center,
                                                ),),
                                            ),
                                          ),
                                          const Divider(height: 24.0,color: Colors.transparent,),

                                        ],
                                      ),
                                    ),
                                  ))));
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.arrow_back_rounded,color: ColorsApp.white),
                        SizedBox(width: 10,),
                        Text(
                          "ارسال به دوستان",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                              color: ColorsApp.white),
                          textAlign: TextAlign.center,
                        ),

                      ],
                    ),),
                  ElevatedButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenHeight/4.5, 40)),
                        foregroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                        backgroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(color:ColorsApp.primary)
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

                              Obx(() => Material(
                                  color: ColorsApp.white,
                                  child: SafeArea(
                                    top: false,
                                    child: SizedBox(
                                      height:SizeConfig.screenHeight,
                                      width:SizeConfig.screenWidth,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[

                                          Container(
                                            margin: const EdgeInsets.only(bottom: 4,top: 8),
                                            width: 80,
                                            height: 4,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.withOpacity(0.8),
                                                borderRadius: BorderRadius.circular(16)
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                                            child: TextFormField(
                                              onChanged: (value) {
                                                // if(value.length==11){
                                                //   setState(() {
                                                //     phone=true;
                                                //   });
                                                // }else{
                                                //   setState(() {
                                                //     phone=false;
                                                //   });
                                                // }
                                              },
                                              onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                                              controller: flashCardController.title2Controller,
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,fontFamily: "IranSANS"
                                              ),
                                              decoration: InputDecoration(
                                                fillColor:  ColorsApp.textColorSub,
                                                filled: true,
                                                // suffixIcon:const Icon(Icons.phone_android,color: ColorsApp.iconTextField,),
                                                counterText: "",
                                                contentPadding:
                                                const EdgeInsets.only(left: 16, right: 16),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  borderSide: const BorderSide(
                                                    color: Color(0xffF9F9F9),
                                                    width: 0.7,
                                                  ),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xffF9F9F9),
                                                    width: 0.7,
                                                  ),
                                                  borderRadius: BorderRadius.circular(8.0),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xffF9F9F9),
                                                    width: 0.7,
                                                  ),
                                                  borderRadius: BorderRadius.circular(8.0),
                                                ),
                                                hintText: "عنوان کلمه",
                                                hintStyle: const TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.normal,
                                                    color: ColorsApp.colorTextNormal,
                                                    fontFamily: 'IRANSans'),
                                              ),
                                              keyboardType: TextInputType.text,
                                            ),
                                          ),

                                          SizedBox(
                                            width:SizeConfig.screenWidth,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width:SizeConfig.screenWidth,
                                                  padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                                                  child: TextFormField(
                                                    onChanged: (value) {
                                                      // if(value.length==11){
                                                      //   setState(() {
                                                      //     phone=true;
                                                      //   });
                                                      // }else{
                                                      //   setState(() {
                                                      //     phone=false;
                                                      //   });
                                                      // }
                                                    },
                                                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                                                    controller: flashCardController.textController,
                                                    textAlign: TextAlign.right,
                                                    style: const TextStyle(
                                                        fontSize: 18.0,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.normal,fontFamily: "IranSANS"
                                                    ),
                                                    decoration: InputDecoration(
                                                      fillColor:  ColorsApp.textColorSub,
                                                      filled: true,
                                                      // suffixIcon:const Icon(Icons.phone_android,color: ColorsApp.iconTextField,),
                                                      counterText: "",
                                                      contentPadding:
                                                      const EdgeInsets.only(left: 16, right: 16),
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(8.0),
                                                        borderSide: const BorderSide(
                                                          color: Color(0xffF9F9F9),
                                                          width: 0.7,
                                                        ),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color: Color(0xffF9F9F9),
                                                          width: 0.7,
                                                        ),
                                                        borderRadius: BorderRadius.circular(8.0),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color: Color(0xffF9F9F9),
                                                          width: 0.7,
                                                        ),
                                                        borderRadius: BorderRadius.circular(8.0),
                                                      ),
                                                      hintText: "معنی کلمه",
                                                      hintStyle: const TextStyle(
                                                          fontSize: 14.0,
                                                          fontWeight: FontWeight.normal,
                                                          color: ColorsApp.colorTextNormal,
                                                          fontFamily: 'IRANSans'),
                                                    ),
                                                    keyboardType: TextInputType.text,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          SizedBox(
                                            width:SizeConfig.screenWidth,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width:SizeConfig.screenWidth,
                                                  padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                                                  child: TextFormField(
                                                    onChanged: (value) {
                                                      // if(value.length==11){
                                                      //   setState(() {
                                                      //     phone=true;
                                                      //   });
                                                      // }else{
                                                      //   setState(() {
                                                      //     phone=false;
                                                      //   });
                                                      // }
                                                    },
                                                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                                                    controller: flashCardController.senseController,
                                                    textAlign: TextAlign.right,
                                                    style: const TextStyle(
                                                        fontSize: 18.0,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.normal,fontFamily: "IranSANS"
                                                    ),
                                                    decoration: InputDecoration(
                                                      fillColor:  ColorsApp.textColorSub,
                                                      filled: true,
                                                      // suffixIcon:const Icon(Icons.phone_android,color: ColorsApp.iconTextField,),
                                                      counterText: "",
                                                      contentPadding:
                                                      const EdgeInsets.only(left: 16, right: 16),
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(8.0),
                                                        borderSide: const BorderSide(
                                                          color: Color(0xffF9F9F9),
                                                          width: 0.7,
                                                        ),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color: Color(0xffF9F9F9),
                                                          width: 0.7,
                                                        ),
                                                        borderRadius: BorderRadius.circular(8.0),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color: Color(0xffF9F9F9),
                                                          width: 0.7,
                                                        ),
                                                        borderRadius: BorderRadius.circular(8.0),
                                                      ),
                                                      hintText: "جمله",
                                                      hintStyle: const TextStyle(
                                                          fontSize: 14.0,
                                                          fontWeight: FontWeight.normal,
                                                          color: ColorsApp.colorTextNormal,
                                                          fontFamily: 'IRANSans'),
                                                    ),
                                                    keyboardType: TextInputType.text,maxLines: 3,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 50),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                GestureDetector(

                                                  child: SvgPicture.asset(ConstAddress.icon+"image2.svg",height: 40,width: 40,),
                                                  onTap: ()async{
                                                    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);
                                                    if (result != null) {
                                                      flashCardController.file =
                                                          File(result.files.single.path!);
                                                      flashCardController
                                                          .getLoadingFile(
                                                          true);
                                                      if (flashCardController
                                                          .file !=
                                                          null) {
                                                        flashCardController.uploadFile(flashCardController.box.read("userId").toString(), context,flashCardController.file,2);
                                                        flashCardController
                                                            .getLoadingFile(

                                                            false);
                                                      }

                                                    }
                                                  },
                                                ),
                                                const Text(
                                                  "بارگزاری عکس",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                                      color: ColorsApp.colorTextNormal),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          flashCardController.empty.value?  Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                "فیلدها را تکمیل کنید",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                                    color: ColorsApp.red),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ):const SizedBox(),
                                          Padding(
                                            padding:  const EdgeInsets.only(top: 20,left: 40,right: 40),
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
                                                  flashCardController.getEmpty(false);
                                                  if(flashCardController.title2Controller.text!=""&&flashCardController.textController.text!=""){
                                                    flashCardController.addItemToFlashCard(id, flashCardController.title2Controller.text,
                                                        flashCardController.textController.text, flashCardController.fileId.value.toString(), flashCardController.senseController.text, context);
                                                  }
                                                  flashCardController.getEmpty(true);
                                                },
                                                child: const Text(
                                                  "ثبت کلمه جدید",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                                      color: ColorsApp.white),
                                                  textAlign: TextAlign.center,
                                                ),),
                                            ),
                                          ),
                                          const Divider(height: 24.0,color: Colors.transparent,),

                                        ],
                                      ),
                                    ),
                                  ))));
                    },
                    child: Row(
                      children: const [

                        Text(
                          "کلمه جدید",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                              color: ColorsApp.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 10,),
                        Icon(Icons.add,color: ColorsApp.white),
                      ],
                    ),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
