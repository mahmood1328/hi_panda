
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Components/item_pay_close.dart';
import '../Controller/consult_controller.dart';

class FactoryDetailPage extends StatelessWidget {
  const FactoryDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var consultController = Get.put(ConsultController());
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
              const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: SvgPicture.asset(
                          "${ConstAddress.icon}arrowLeft.svg",
                          color: ColorsApp.black,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          consultController.factoryInfoModel!.factorUser,
                          style: const TextStyle(
                              color: ColorsApp.colorTextT1,
                              fontSize: 14,
                              fontFamily: "IranSANS",
                              fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          ": فاکتور",
                          style: TextStyle(
                              color: ColorsApp.colorTextT1,
                              fontSize: 14,
                              fontFamily: "IranSANS",
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.only(right: 20, top: 20),
                height: SizeConfig.screenHeight / 4.5,
                width: SizeConfig.screenWidth,
                decoration: const BoxDecoration(
                    color: ColorsApp.backTextField,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            launch(
                                "whatsapp://send?text=سلام وقت بخیر &phone=${consultController.factoryInfoModel!.whatsappNumber}");
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Image.asset(
                              "${ConstAddress.image}wats.png",
                              height: 40,
                              width: 40,
                            ),
                          ),
                        ),
                        Text(
                          consultController.factoryInfoModel!.factorUser,
                          style: const TextStyle(
                              color: ColorsApp.colorTextT1,
                              fontSize: 14,
                              fontFamily: "IranSANS",
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    consultController
                                        .factoryInfoModel!.installmentTotalPrice,
                                    style: const TextStyle(
                                        color: ColorsApp.colorTextT1,
                                        fontSize: 12,
                                        fontFamily: "IranSANS",
                                        fontWeight: FontWeight.normal),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    ": مبلغ کل ",
                                    style: TextStyle(
                                        color: ColorsApp.primaryTextColor,
                                        fontSize: 10,
                                        fontFamily: "IranSANS",
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    consultController
                                        .factoryInfoModel!.installmentPay
                                        .toString(),
                                    style: const TextStyle(
                                        color: ColorsApp.colorTextT1,
                                        fontSize: 12,
                                        fontFamily: "IranSANS",
                                        fontWeight: FontWeight.normal),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    ": پرداخت ",
                                    style: TextStyle(
                                        color: ColorsApp.primaryTextColor,
                                        fontSize: 10,
                                        fontFamily: "IranSANS",
                                        fontWeight: FontWeight.normal),
                                  ),
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
                                  Text(
                                    consultController
                                        .factoryInfoModel!.factorCourse,
                                    style: const TextStyle(
                                        color: ColorsApp.colorTextT1,
                                        fontSize: 12,
                                        fontFamily: "IranSANS",
                                        fontWeight: FontWeight.normal),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    ": دوره ",
                                    style: TextStyle(
                                        color: ColorsApp.primaryTextColor,
                                        fontSize: 10,
                                        fontFamily: "IranSANS",
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    consultController
                                        .factoryInfoModel!.installmentCount
                                        .toString(),
                                    style: const TextStyle(
                                        color: ColorsApp.colorTextT1,
                                        fontSize: 12,
                                        fontFamily: "IranSANS",
                                        fontWeight: FontWeight.normal),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    ": اقساط ",
                                    style: TextStyle(
                                        color: ColorsApp.primaryTextColor,
                                        fontSize: 10,
                                        fontFamily: "IranSANS",
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          width: SizeConfig.screenWidth / 1.3,
                          height: 60,
                          child: Text(
                            "توضیحات :  ${consultController.factoryInfoModel!.descript} ",
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                                color: ColorsApp.colorTextT1,
                                fontSize: 11,
                                fontFamily: "IranSANS",
                                fontWeight: FontWeight.normal),
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              // Row(
              //   children: [
              //     const SizedBox(width: 5,),
              //     GestureDetector(
              //       onTap: (){
              //         Get.back();
              //       },
              //       child: Container(
              //         width: SizeConfig.screenWidth/5.5,
              //         margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 5),
              //         padding:const EdgeInsets.only(top: 5,bottom: 5),
              //         decoration:const BoxDecoration(
              //           color: ColorsApp.white,
              //           borderRadius:  BorderRadius.all(Radius.circular(30),
              //           ),
              //         ),
              //
              //         child:  Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: const [
              //             Text("بستن" , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.normal , color: ColorsApp.red,fontFamily: "IranSANS"),),
              //           ],
              //         ),
              //       ),
              //     ),
              //     const SizedBox(width: 5,),
              //     GestureDetector(
              //       onTap: (){
              //
              //       },
              //       child: Container(
              //         width: SizeConfig.screenWidth/5.5,
              //         margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 5),
              //         padding:const EdgeInsets.only(top: 5,bottom: 5),
              //         decoration:const BoxDecoration(
              //           color: ColorsApp.white,
              //           borderRadius:  BorderRadius.all(Radius.circular(30),
              //           ),
              //         ),
              //
              //         child:  Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: const [
              //             Text("ذخیره" , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.normal , color: ColorsApp.black,fontFamily: "IranSANS"),),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              Column(
                children: consultController.factoryInfoModel!.pays
                    .map((e) => ItemPayClose(pay: e, id: consultController.factoryInfoModel!.id,))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
