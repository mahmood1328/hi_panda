import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/res/colors.dart';
import '../Models/Request/pay_factory_req_model.dart';
import '../View/Consult/Controller/consult_controller.dart';
import '../utils/const.dart';
import '../utils/res/dimensions.dart';
import '../utils/size_config.dart';
import 'snackbar.dart';

class ModalPayFactory extends StatefulWidget {
 final int number;
 final int id;
  const ModalPayFactory({Key? key,required this.number,required this.id}) : super(key: key);


  @override
  _ModalPayFactoryState createState() => _ModalPayFactoryState();

}

class _ModalPayFactoryState extends State<ModalPayFactory> {
  File? file1;
  File? file2;
  File? file3;
 var consultController =Get.put(ConsultController());
  @override
  Widget build(BuildContext context) {
//     return GetX<ConsultController>(
//         init: Get.put(ConsultController()),
//         builder: (consultController) {
//           return Material(
//               color: ColorsApp.white,
//               child: SafeArea(
//                 top: false,
//                 child: Container(
//                   margin: const EdgeInsets.only(top: 40,right: 30,left: 30),
//                   width: SizeConfig.screenWidth,
//                   height: SizeConfig.screenHeight/2.7,
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 10,),
//           SizedBox(
//             height: 60,
//             width: SizeConfig.screenWidth/1.2,
//             child: TextField(
//               controller:consultController. controllerDatePay,
//               cursorColor: Colors.grey,
//               onChanged: (value) {
//               },
//               onEditingComplete: () => FocusScope.of(context).nextFocus(),
// //                  autofocus: true,
//               //controller: controllerPhone,
//               textAlign: TextAlign.right,
//               style:const TextStyle(
//                 fontSize: 17.0,
//                 color: Colors.black45,
//                 fontWeight: FontWeight.normal,
//               ),
//               decoration: InputDecoration(
//                 fillColor: ColorsApp.backTextField,
//                 filled: true,
//                 counterText: "",
//                 contentPadding:
//                 const EdgeInsets.only(left: 16, right: 15),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                   borderSide:const BorderSide(
//                     color: ColorsApp.backTextField,
//                     width: 0.7,
//                   ),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide:const BorderSide(
//                     color: ColorsApp.backTextField,
//                     width: 0.7,
//                   ),
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide:const BorderSide(
//                     color:ColorsApp.backTextField,
//                     width: 0.7,
//                   ),
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 hintText: ". . . تاریخ ",
//                 hintStyle:const TextStyle(
//                     fontSize: 14.0,
//                     fontWeight: FontWeight.normal,
//                     color: ColorsApp.iconTextField,
//                     fontFamily: 'IranSANS'),
//               ),
//               maxLines: 1,
//               keyboardType: TextInputType.emailAddress,
//               // maxLength: 11,
//             ),
//           ),
//            SizedBox(
//             height: 60,
//             width: SizeConfig.screenWidth/1.2,
//             child: TextField(
//               controller:consultController. controllerTrackingCodePay,
//               cursorColor: Colors.grey,
//               onChanged: (value) {
//               },
//               onEditingComplete: () => FocusScope.of(context).nextFocus(),
// //                  autofocus: true,
//               //controller: controllerPhone,
//               textAlign: TextAlign.right,
//               style:const TextStyle(
//                 fontSize: 17.0,
//                 color: Colors.black45,
//                 fontWeight: FontWeight.normal,
//               ),
//               decoration: InputDecoration(
//                 fillColor: ColorsApp.backTextField,
//                 filled: true,
//                 counterText: "",
//                 contentPadding:
//                 const EdgeInsets.only(left: 16, right: 15),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                   borderSide:const BorderSide(
//                     color: ColorsApp.backTextField,
//                     width: 0.7,
//                   ),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide:const BorderSide(
//                     color: ColorsApp.backTextField,
//                     width: 0.7,
//                   ),
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide:const BorderSide(
//                     color:ColorsApp.backTextField,
//                     width: 0.7,
//                   ),
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 hintText: ". . . کد رهگیری ",
//                 hintStyle:const TextStyle(
//                     fontSize: 14.0,
//                     fontWeight: FontWeight.normal,
//                     color: ColorsApp.iconTextField,
//                     fontFamily: 'IranSANS'),
//               ),
//               maxLines: 1,
//               keyboardType: TextInputType.emailAddress,
//               // maxLength: 11,
//             ),
//           ),
//            SizedBox(
//             height: 60,
//             width: SizeConfig.screenWidth/1.2,
//             child: TextField(
//               controller:consultController. controllerPricePay,
//               cursorColor: Colors.grey,
//               onChanged: (value) {
//               },
//               onEditingComplete: () => FocusScope.of(context).nextFocus(),
// //                  autofocus: true,
//               //controller: controllerPhone,
//               textAlign: TextAlign.right,
//               style:const TextStyle(
//                 fontSize: 17.0,
//                 color: Colors.black45,
//                 fontWeight: FontWeight.normal,
//               ),
//               decoration: InputDecoration(
//                 fillColor: ColorsApp.backTextField,
//                 filled: true,
//                 counterText: "",
//                 contentPadding:
//                 const EdgeInsets.only(left: 16, right: 15),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                   borderSide:const BorderSide(
//                     color: ColorsApp.backTextField,
//                     width: 0.7,
//                   ),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide:const BorderSide(
//                     color: ColorsApp.backTextField,
//                     width: 0.7,
//                   ),
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide:const BorderSide(
//                     color:ColorsApp.backTextField,
//                     width: 0.7,
//                   ),
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 hintText: ". . . مبلغ ",
//                 hintStyle:const TextStyle(
//                     fontSize: 14.0,
//                     fontWeight: FontWeight.normal,
//                     color: ColorsApp.iconTextField,
//                     fontFamily: 'IranSANS'),
//               ),
//               maxLines: 1,
//               keyboardType: TextInputType.emailAddress,
//               // maxLength: 11,
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: const [
//               Text("تصویر پیوست ",
//                 style:TextStyle(color: ColorsApp.colorTextNormal,fontSize:14,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),
//             ],
//
//           ),
//           const SizedBox(height: 5,),
//          Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               GestureDetector(
//                 onTap: ()async{
//                   final result =
//                   await ImagePicker()
//                       .pickImage(
//                       source:
//                       ImageSource
//                           .gallery);
//                   if (result != null) {
//                     CroppedFile? ff =
//                     await ImageCropper()
//                         .cropImage(
//                       sourcePath: result.path,
//                       aspectRatioPresets: [
//                         CropAspectRatioPreset
//                             .square,
//                       ],
//                     );
//                     if (ff != null) {
//                      setState(() {
//                        file2 =
//                            File(ff.path);
//                      });
//                       if (
//                           file2 !=
//                           null) {
//                         List<int> imageBytes =
//                             file2!
//                             .readAsBytesSync();
//                         consultController.base64Image1.value =
//                         base64Encode(
//                             imageBytes);
//                       }
//                     }
//                   }
//                 },
//                 child: Container(
//                   height: SizeConfig.screenHeight/8,
//                   width: SizeConfig.screenWidth/4,
//                   decoration:const BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                       color: ColorsApp.backTextField
//                   ),
//                   child: Container(
//                       padding:file2!=null?const EdgeInsets.all(5):const EdgeInsets.all(25),
//                       child:file2!=null?Image.file(file2!): Image.asset("${ConstAddress.image}camera3.png",)),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: ()async{
//                   final result =
//                   await ImagePicker()
//                       .pickImage(
//                       source:
//                       ImageSource
//                           .gallery);
//                   if (result != null) {
//                     CroppedFile? ff =
//                     await ImageCropper()
//                         .cropImage(
//                       sourcePath: result.path,
//                       aspectRatioPresets: [
//                         CropAspectRatioPreset
//                             .square,
//                       ],
//                     );
//                     if (ff != null) {
//                       setState(() {
//                         file1 =
//                             File(ff.path);
//                       });
//                       if (file1 !=
//                           null) {
//                         List<int> imageBytes =
//                         file1!
//                             .readAsBytesSync();
//                         consultController.base64Image2.value =
//                         base64Encode(
//                             imageBytes);
//
//                       }
//                     }
//                   }
//                 },
//                 child: Container(
//                   height: SizeConfig.screenHeight/8,
//                   width: SizeConfig.screenWidth/4,
//                   decoration:const BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                       color: ColorsApp.backTextField
//                   ),
//                   child: Container(
//                       padding:file1!=null?const EdgeInsets.all(5):const EdgeInsets.all(25),
//                       child:file1!=null?Image.file(file1!): Image.asset("${ConstAddress.image}camera3.png",)),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: ()async{
//                   final result =
//                   await ImagePicker()
//                       .pickImage(
//                       source:
//                       ImageSource
//                           .gallery);
//                   if (result != null) {
//                     CroppedFile? ff =
//                     await ImageCropper()
//                         .cropImage(
//                       sourcePath: result.path,
//                       aspectRatioPresets: [
//                         CropAspectRatioPreset
//                             .square,
//                       ],
//                     );
//                     if (ff != null) {
//                       setState(() {
//                         file3 =
//                             File(ff.path);
//                       });
//                       if (file3 !=
//                           null) {
//                         List<int> imageBytes =
//                         file3!
//                             .readAsBytesSync();
//                         consultController.base64Image3.value =
//                         base64Encode(
//                             imageBytes);
//
//                       }
//                     }
//                   }
//                 },
//                 child: Container(
//                   height: SizeConfig.screenHeight/8,
//                   width: SizeConfig.screenWidth/4,
//                   decoration:const BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                       color: ColorsApp.backTextField
//                   ),
//                   child: Container(
//                       padding:file3!=null?const EdgeInsets.all(5):const EdgeInsets.all(25),
//                       child:file3!=null?Image.file(file3!): Image.asset("${ConstAddress.image}camera3.png",)),
//                 ),
//               ),
//
//
//             ],
//           ),
//           Padding(
//             padding:  const EdgeInsets.only(top: 10,left: 0,right: 0),
//             child: Center(
//               child: ElevatedButton(
//
//                 style: ButtonStyle(
//                     minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenHeight/1.5, 50)),
//                     foregroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
//                     backgroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(Dimensions.borderRadiusComponents),
//                             side: const BorderSide(color:ColorsApp.primary)
//                         )
//                     )
//                 ),
//
//                 onPressed: () {
//                   if(consultController. controllerPricePay.text!=""){
//                     consultController.pays.add(Pay(image1: consultController.base64Image1.value,
//                         image2: consultController.base64Image1.value, image3: consultController.base64Image1.value
//                         , date: consultController.controllerDatePay.text, trackingCode:consultController. controllerTrackingCodePay.text, price: int.parse(consultController. controllerPricePay.text)
//                         , priceValue: consultController. controllerPricePay.text, isData: true, isPay: true, number: widget.number));
//                   }else{
//                     ShowSnackBar().showSnackBar(
//                       context,
//                       "فیلد قیمت را تکمیل کنید",duration: const Duration(seconds: 5),
//                     );
//                   }
//
//                 },
//                 child: const Text(
//                   "ثبت",
//                   style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.normal,fontFamily: "IranSANS",
//                       color: Colors.white),
//                   textAlign: TextAlign.center,
//                 ),),
//             ),
//           ),
//
//                     ],
//                   ),
//                 ),
//               ));
//         });
    return Material(
        color: ColorsApp.white,
        child: SafeArea(
          top: false,
          child: Container(
            margin: const EdgeInsets.only(top: 40,right: 30,left: 30),
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight/1.7,
            child: Column(
              children: [
                const SizedBox(height: 10,),
                SizedBox(
                  height: 60,
                  width: SizeConfig.screenWidth/1.2,
                  child: TextField(
                    controller:consultController.controllerDatePay,
                    cursorColor: Colors.grey,
                    onChanged: (value) {
                    },
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                    //controller: controllerPhone,
                    textAlign: TextAlign.right,
                    style:const TextStyle(
                      fontSize: 17.0,
                      color: Colors.black45,fontFamily: "IranSANS",
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: InputDecoration(
                      fillColor: ColorsApp.backTextField,
                      filled: true,
                      counterText: "",
                      contentPadding:
                      const EdgeInsets.only(left: 16, right: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
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
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                          color:ColorsApp.backTextField,
                          width: 0.7,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: ". . . تاریخ ",
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
                SizedBox(
                  height: 60,
                  width: SizeConfig.screenWidth/1.2,
                  child: TextField(
                    controller:consultController. controllerTrackingCodePay,
                    cursorColor: Colors.grey,
                    onChanged: (value) {
                    },
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                    //controller: controllerPhone,
                    textAlign: TextAlign.right,
                    style:const TextStyle(
                      fontSize: 17.0,
                      color: Colors.black45,fontFamily: "IranSANS",
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: InputDecoration(
                      fillColor: ColorsApp.backTextField,
                      filled: true,
                      counterText: "",
                      contentPadding:
                      const EdgeInsets.only(left: 16, right: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
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
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                          color:ColorsApp.backTextField,
                          width: 0.7,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: ". . . کد رهگیری ",
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
                SizedBox(
                  height: 60,
                  width: SizeConfig.screenWidth/1.2,
                  child: TextField(
                    controller:consultController. controllerPricePay,
                    cursorColor: Colors.grey,
                    onChanged: (value) {
                    },
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                    //controller: controllerPhone,
                    textAlign: TextAlign.right,
                    style:const TextStyle(
                      fontSize: 17.0,
                      color: Colors.black45,fontFamily: "IranSANS",
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: InputDecoration(
                      fillColor: ColorsApp.backTextField,
                      filled: true,
                      counterText: "",
                      contentPadding:
                      const EdgeInsets.only(left: 16, right: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
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
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                          color:ColorsApp.backTextField,
                          width: 0.7,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: ". . . مبلغ ",
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
                const SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text("تصویر پیوست ",
                      style:TextStyle(color: ColorsApp.colorTextNormal,fontSize:14,fontFamily: "IranSANS",fontWeight: FontWeight.w500),),
                  ],

                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                const SizedBox(height: 20,),
                Padding(
                  padding:  const EdgeInsets.only(top: 10,left: 0,right: 0),
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
                        if(consultController. controllerPricePay.text!=""){
                          consultController.pays.add(Pay(image1: consultController.base64Image1.value,
                              image2: consultController.base64Image2.value, image3: consultController.base64Image3.value
                              , date: consultController.controllerDatePay.text, trackingCode:consultController. controllerTrackingCodePay.text, price: int.parse(consultController.controllerPricePay.text)
                              , priceValue:consultController.controllerPricePay.text, isData: true, isPay: false, number: widget.number));
                          if(consultController.pays.isNotEmpty){
                            consultController.payFactory(context, widget.id);
                          }
                        }else{
                          ShowSnackBar().showSnackBar(
                            context,
                            "فیلد قیمت را تکمیل کنید",duration: const Duration(seconds: 5),
                          );
                        }

                      },
                      child: const Text(
                        " ثبت پرداخت",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),),
                  ),
                ),

              ],
            ),
          ),
        ));
  }

}