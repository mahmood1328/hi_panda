import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../View/Chat/Model/support_check_user_model.dart';
import '../utils/const.dart';
import '../utils/res/colors.dart';
import '../utils/size_config.dart';

class ModalInfoMessage extends StatefulWidget {
 final SupportCheckUserModel supportCheckUserModel;
   const ModalInfoMessage({Key? key,required this.supportCheckUserModel}) : super(key: key);


  @override
  _ModalInfoMessageState createState() => _ModalInfoMessageState();

}

class _ModalInfoMessageState extends State<ModalInfoMessage> {
var box=GetStorage();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorsApp.white,
        child: SafeArea(
      top: false,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[

            Container(
              margin: const EdgeInsets.only(bottom: 4,top: 8),
              width: 80,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(16)
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                GestureDetector(
                  onTap: () {
                    launch(
                        "whatsapp://send?text=سلام وقت بخیر &phone=${ widget.supportCheckUserModel.phoneNumberWp}");
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,top: 20),
                    child: Image.asset(
                      "${ConstAddress.image}wats.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                const  SizedBox(
                  child:  Padding(
                    padding: EdgeInsets.only(right: 20,top: 16),
                    child: Text(
                      "اطلاعات مربوط به کاربر",
                      textAlign: TextAlign.end,  style: TextStyle(
                      fontFamily: 'IranSANS',
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                      color:ColorsApp.primary,
                    ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8,top: 8,left: 20,right: 20),
              width: SizeConfig.screenWidth,
              height: 2,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16)
              ),
            ),

            const Divider(height: 10.0,color: Colors.transparent,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.topRight,
              width:SizeConfig.screenWidth,
              decoration: const BoxDecoration(
                  color: ColorsApp.colorItemChatGuest,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              padding: const EdgeInsets.only(top: 10,bottom: 10,right: 10,left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.supportCheckUserModel.userName,
                        style: const TextStyle(
                          fontFamily: 'IranSANS',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: ColorsApp.colorTextTitle,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const Text(
                        " : نام کاربری ",
                        style: TextStyle(
                          fontFamily: 'IranSANS',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color:ColorsApp.colorTextNormal,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.supportCheckUserModel.fullName,
                        style: const TextStyle(
                          fontFamily: 'IranSANS',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: ColorsApp.colorTextTitle,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const Text(
                        " : نام ",
                        style: TextStyle(
                          fontFamily: 'IranSANS',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color:ColorsApp.colorTextNormal,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.supportCheckUserModel.phoneNumber,
                        style: const TextStyle(
                          fontFamily: 'IranSANS',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: ColorsApp.colorTextTitle,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const Text(
                        " : شماره تماس ",
                        style: TextStyle(
                          fontFamily: 'IranSANS',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color:ColorsApp.colorTextNormal,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.supportCheckUserModel.hasCourse?"دارد" : "ندارد",
                            style: const TextStyle(
                              fontFamily: 'IranSANS',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: ColorsApp.colorTextTitle,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const Text(
                            " : دوره ",
                            style: TextStyle(
                              fontFamily: 'IranSANS',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color:ColorsApp.colorTextNormal,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.supportCheckUserModel.hasSupport?"دارد" : "ندارد",
                            style: const TextStyle(
                              fontFamily: 'IranSANS',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: ColorsApp.colorTextTitle,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const Text(
                            " : پشتیبانی ",
                            style: TextStyle(
                              fontFamily: 'IranSANS',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color:ColorsApp.colorTextNormal,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.supportCheckUserModel.hasSupport?  widget.supportCheckUserModel.supportEndDate : "گذشته",
                        style: const TextStyle(
                          fontFamily: 'IranSANS',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: ColorsApp.colorTextTitle,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const Text(
                        " : تاریخ اتمام پشتیبانی کلی ",
                        style: TextStyle(
                          fontFamily: 'IranSANS',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color:ColorsApp.colorTextNormal,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: 24.0,color: Colors.transparent,),

            Column(
              children: widget.supportCheckUserModel.courses.map((e) =>
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),

                      border: Border.all(width: 2,color: ColorsApp.backTextField,)
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 3),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          e.course,
                          style: const TextStyle(
                            fontFamily: 'IranSANS',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: ColorsApp.colorTextTitle,
                          ),
                          textAlign: TextAlign.left,textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              e.percent.toString(),
                              style: const TextStyle(
                                fontFamily: 'IranSANS',
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: ColorsApp.colorTextNormal,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const Text(
                              " : درصد ",
                              style: TextStyle(
                                fontFamily: 'IranSANS',
                                fontSize: 11.0,
                                fontWeight: FontWeight.w500,
                                color: ColorsApp.primaryTextColor,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              e.startDate,
                              style: const TextStyle(
                                fontFamily: 'IranSANS',
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: ColorsApp.colorTextNormal,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const Text(
                             "  : تاریخ خرید دوره ",
                              style: TextStyle(
                                fontFamily: 'IranSANS',
                                fontSize: 11.0,
                                fontWeight: FontWeight.w500,
                                color: ColorsApp.primaryTextColor,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              e.status,
                              style: const TextStyle(
                                fontFamily: 'IranSANS',
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: ColorsApp.colorTextNormal,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const Text(
                             " : وضعیت پشتیبانی",
                              style: TextStyle(
                                fontFamily: 'IranSANS',
                                fontSize: 11.0,
                                fontWeight: FontWeight.w500,
                                color: ColorsApp.primaryTextColor,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              e.date,
                              style: const TextStyle(
                                fontFamily: 'IranSANS',
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: ColorsApp.colorTextNormal,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const Text(
                              " : تاریخ اتمام پشتیبانی ",
                              style: TextStyle(
                                fontFamily: 'IranSANS',
                                fontSize: 11.0,
                                fontWeight: FontWeight.w500,
                                color: ColorsApp.primaryTextColor,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 5,),
                  ],
                ),
              )).toList(),
            )

          ],
        ),
      ),
    ));
  }

}
//public bool HasCourse { get; set; }
//         public bool HasSupport { get; set; }
//         public string SupportEndDate { get; set; }