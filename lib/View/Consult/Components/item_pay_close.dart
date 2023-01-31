import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../Models/Responses/factory_info_model.dart';
import '../../../Widget/modal_pay_factory.dart';
import '../../../Widget/snackbar.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/res/dimensions.dart';
import '../../../utils/size_config.dart';
import '../Controller/consult_controller.dart';

class ItemPayClose extends StatefulWidget {
  final  PaFactory pay;
  final  int id;
  const ItemPayClose({Key? key,required this.pay,required this.id}) : super(key: key);

  @override
  State<ItemPayClose> createState() => _ItemPayCloseState();
}

class _ItemPayCloseState extends State<ItemPayClose> {

  @override
  Widget build(BuildContext context) {
    var consultController  = Get.put(ConsultController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: ColorsApp.backTextField,width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(5))
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              widget. pay.isPay? Image.asset("${ConstAddress.image}checkbox.png",color: ColorsApp.textColorSub,height: 40,width: 40,):
              Image.asset("${ConstAddress.image}checkboxF.png",color: ColorsApp.textColorSub,height: 40,width: 40,),
              Row(
                children: [
                  Text(widget.pay.number.toString(),
                    style:const TextStyle(color: ColorsApp.colorTextT1,fontSize:15,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),
                  const Text(" قسط شماره ",
                    style:TextStyle(color: ColorsApp.colorTextT1,fontSize:14,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget. pay.isPay? Row(
                children: [
                  Text(widget.pay.trackingCode.toString(),
                    style:const TextStyle(color: ColorsApp.colorTextT1,fontSize:13,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),
                  const SizedBox(width: 5,),
                  const Text("رهگیری ",
                    style:TextStyle(color: ColorsApp.colorTextNormal,fontSize:12,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),
                ],
              ):const SizedBox(),
              widget. pay.isPay?  Row(
                children: [
                  Text(widget.pay.date.toString(),
                    style:const TextStyle(color: ColorsApp.colorTextT1,fontSize:13,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),
                  const SizedBox(width: 5,),
                  const Text("تاریخ ",
                    style:TextStyle(color: ColorsApp.colorTextNormal,fontSize:12,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),
                ],
              ):const SizedBox(),
              widget. pay.isPay?  Row(
                children: [
                  Text(widget.pay.priceValue.toString(),
                    style:const TextStyle(color: ColorsApp.colorTextT1,fontSize:13,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),
                  const SizedBox(width: 5,),
                  const Text("مبلغ ",
                    style:TextStyle(color: ColorsApp.colorTextNormal,fontSize:12,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),
                ],
              ):const SizedBox(),
            ],
          ),
          widget.pay.isData? const SizedBox():
          Padding(
            padding:  const EdgeInsets.only(top: 10,left: 0,right: 0),
            child: ElevatedButton(

              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenHeight/8, 40)),
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
                // if(consultController. controllerPricePay.text!=""){
                //   consultController.pays.add(Pay(image1: consultController.base64Image1.value,
                //       image2: consultController.base64Image1.value, image3: consultController.base64Image1.value
                //       , date: consultController.controllerDatePay.text, trackingCode:consultController. controllerTrackingCodePay.text, price: int.parse(consultController. controllerPricePay.text)
                //       , priceValue: consultController. controllerPricePay.text, isData: true, isPay: true, number: widget.pay.number));
                // }else{
                //   ShowSnackBar().showSnackBar(
                //     context,
                //     "فیلد قیمت را تکمیل کنید",duration: const Duration(seconds: 5),
                //   );
                // }

                showCupertinoModalBottomSheet(
                    expand: false,
                    context: context,
                    useRootNavigator: true,
                    backgroundColor: ColorsApp.white,
                    builder: (BuildContext context) =>

                        ModalPayFactory(number: widget.pay.number, id: widget.id,));
              },
              child: const Text(
                "پرداخت",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),),
          ),

        ],
      ),
    );
  }
}
