import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/res/dimensions.dart';
import '../../../utils/size_config.dart';
import '../Controller/verify_controller.dart';

class VerifyScreen extends StatefulWidget {
  final String phone;

  const VerifyScreen( {Key? key,required this.phone}) : super(key: key);

  @override
  VerifyScreenState createState() => VerifyScreenState();
}

class VerifyScreenState extends State<VerifyScreen> {
  final int _otpCodeLength = 4;
  bool _isLoadingButton = false;
  bool _enableButton = false;
  String _otpCode = "";
  String code = "";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final intRegex = RegExp(r'\4+', multiLine: true);
  TextEditingController textEditingController = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    // _getSignatureCode();
    // _startListeningSms();
  }
  var verifyController=Get.put(VerifyController());
  @override
  void dispose() {
    super.dispose();
  }

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      color:  Color(0xffF9F9F9),
      borderRadius: BorderRadius.circular(15.0),
    );
  }
  //
  // /// get signature code
  // _getSignatureCode() async {
  //   String? signature = await SmsVerification.getAppSignature();
  //   print("signature $signature");
  // }
  //
  // /// listen sms
  // _startListeningSms()  {
  //   SmsVerification.startListeningSms().then((message) {
  //     setState(() {
  //       _otpCode = SmsVerification.getCode(message, intRegex);
  //       //textEditingController.text = _otpCode;
  //       print(textEditingController.text);
  //       _onOtpCallBack(_otpCode, true);
  //     });
  //   });
  // }

  _onSubmitOtp() {
    setState(() {
      _isLoadingButton = !_isLoadingButton;
      _verifyOtpCode();
    });
  }

  // _onClickRetry() {
  //   _startListeningSms();
  // }

  // _onOtpCallBack(String otpCode, bool isAutofill) {
  //   setState(() {
  //     _otpCode = otpCode;
  //     if (otpCode.length == _otpCodeLength && isAutofill) {
  //       _enableButton = false;
  //       _isLoadingButton = true;
  //       _verifyOtpCode();
  //     } else if (otpCode.length == _otpCodeLength && !isAutofill) {
  //       _enableButton = true;
  //       _isLoadingButton = false;
  //     } else {
  //       _enableButton = false;
  //     }
  //   });
  // }

  _verifyOtpCode() {
    FocusScope.of(context).requestFocus( FocusNode());
    Timer(const Duration(milliseconds: 4000), () {
      setState(() {
        _isLoadingButton = false;
        _enableButton = false;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:ColorsApp.white ,
        body: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);

                    }, icon: const Icon(Icons.arrow_back,color: ColorsApp.black,)),
                    const Padding(
                      padding: EdgeInsets.only(right: 0),
                      child: Text("احراز شماره همراه",
                        style: TextStyle(color: ColorsApp.colorTextTitle,fontSize: 18,fontFamily: "IranSANS",fontWeight: FontWeight.w600),),
                    ),
                    const SizedBox(width: 50,)
                  ],
                ),
                const SizedBox(height: 50,),
                Image.asset("${ConstAddress.image}logoPanda.png",height:SizeConfig.screenHeight/4,width:SizeConfig.screenWidth/1.5  ,),
                Padding(
                  padding: EdgeInsets.only(right: 0,top: SizeConfig.screenHeight/8),
                  child: const Text("کد دریافتی از طریق پیامک را وارد کنید",
                    style: TextStyle(color: ColorsApp.black,fontSize: 16,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 50,
                        child: TextFormField(
                          onChanged: (value) {
                            FocusScope.of(context).nextFocus();
                          },
                          onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                          controller:verifyController.controller1,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,fontFamily: "IranSANS"
                          ),
                          decoration: InputDecoration(
                            fillColor: Color(0xffF9F9F9),
                            filled: true,
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
                          ),
                          maxLines: 1,
                          keyboardType: TextInputType.phone,maxLength: 1,
                        ),
                      ),
                      const SizedBox(width: 8,),
                      SizedBox(
                        height: 60,
                        width: 50,
                        child: TextFormField(
                          onChanged: (value) {
                            FocusScope.of(context).nextFocus();
                          },
                          onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                          controller:verifyController.controller2,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,fontFamily: "IranSANS"
                          ),
                          decoration: InputDecoration(
                            fillColor: Color(0xffF9F9F9),
                            filled: true,
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
                          ),
                          maxLines: 1,
                          keyboardType: TextInputType.phone,maxLength: 1,
                        ),
                      ),
                      const SizedBox(width: 8,),
                      SizedBox(
                        height: 60,
                        width: 50,
                        child: TextFormField(
                          onChanged: (value) {
                            FocusScope.of(context).nextFocus();
                          },
                          onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                          controller:verifyController.controller3,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,fontFamily: "IranSANS"
                          ),
                          decoration: InputDecoration(
                            fillColor: Color(0xffF9F9F9),
                            filled: true,
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
                          ),
                          maxLines: 1,
                          keyboardType: TextInputType.phone,maxLength: 1,
                        ),
                      ),
                      const SizedBox(width: 8,),
                      SizedBox(
                        height: 60,
                        width: 50,
                        child: TextFormField(
                          onChanged: (value) {
                            FocusScope.of(context).nextFocus();
                          },
                          onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                          controller:verifyController.controller4,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,fontFamily: "IranSANS"
                          ),
                          decoration: InputDecoration(
                            fillColor: const Color(0xffF9F9F9),
                            filled: true,
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
                          ),
                          maxLines: 1,
                          keyboardType: TextInputType.phone,maxLength: 1,
                        ),
                      ),
                    ],
                  ),
                ),
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
                        code=verifyController.controller1.text+verifyController.controller2.text+verifyController.controller3.text+verifyController.controller4.text;
                        print(code);
                        FocusManager.instance.primaryFocus?.unfocus();
                        verifyController.verify(widget.phone, code, context, false);

                      },
                      child: const Text(
                        "تایید کد دریافتی",
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
        )
    );
  }

}