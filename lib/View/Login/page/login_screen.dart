import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hi_panda/View/Login/page/privacy_page.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../Network/service_url.dart';
import '../../../Widget/snackbar.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/res/dimensions.dart';
import '../../../utils/size_config.dart';
import '../Controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
 final TextEditingController controllerPhone = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var loginController=Get.put(LoginController());
    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[
                   Text("ورود | ثبت نام",
                    style: TextStyle(color: ColorsApp.colorTextTitle,fontSize: 18,fontFamily: "IranSANS",fontWeight: FontWeight.w600),),
                ],
              ),
              const SizedBox(height: 50,),
              Image.asset("${ConstAddress.image}logoPanda.png",height:SizeConfig.screenHeight/4,width:SizeConfig.screenWidth/1.5  ,),
               Padding(
                padding:const EdgeInsets.only(right: 0,top: 50),
                child: Text(" شماره موبایل خود را وارد کنید ",
                  style: TextStyle(color: ColorsApp.black.withOpacity(0.7),fontSize: 15,fontFamily: "IranSANS",fontWeight: FontWeight.normal,),maxLines: 2,),

              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
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
                  controller: controllerPhone,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,fontFamily: "IranSANS"
                  ),
                  decoration: InputDecoration(
                    errorText:loginController.validatePhone(controllerPhone.text),
                    fillColor: const Color(0xffF9F9F9),
                    filled: true,
                    suffixIcon:const Icon(Icons.phone_android,color: ColorsApp.iconTextField,),
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
                    hintText: "09",
                    hintStyle: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                        color: ColorsApp.colorTextNormal,
                        fontFamily: 'IRANSans'),
                  ),
                  maxLines: 1,
                  keyboardType: TextInputType.phone,maxLength: 11,
                ),
              ),

              Obx(() => Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("را می پذیرم",style: TextStyle(color: ColorsApp.black,fontSize: 13,fontFamily: "IranSANS",fontWeight: FontWeight.w500)),

                    TextButton(onPressed: (){ Get.to(()=>PrivacyPage());}, child: Text("شرایط و مقررات",style: TextStyle(color: ColorsApp.primaryLight2,fontSize: 14,fontFamily: "IranSANS",fontWeight: FontWeight.bold,decoration: TextDecoration.underline),)),
                    IconButton(onPressed: (){loginController.getChecking();}, icon:  Icon( loginController.isCheck.value?Icons.check_box: Icons.check_box_outline_blank,color: ColorsApp.primaryLight2,)),
                  ],
                ),
              ),),


              Padding(
                padding:  const EdgeInsets.only(top: 20,left: 40,right: 40),
                child: Center(
                  child: ElevatedButton(

                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenHeight/1.5, 50)),
                        foregroundColor: MaterialStateProperty.all<Color>(ColorsApp.primary),
                        backgroundColor: MaterialStateProperty.all<Color>(ColorsApp.primary),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(Dimensions.borderRadiusComponents),
                                side: const BorderSide(color:ColorsApp.primary)
                            )
                        )
                    ),

                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if(loginController.isCheck.value){loginController.login(controllerPhone.text,"r64Iw/6mD1D",context);}else{ ShowSnackBar().showSnackBar(
                        context,
                        "گزینه شرایط و مقررات را کلیلک کنید",duration: const Duration(seconds: 5),
                      );}

                    },
                    child: const Text(
                      "تایید و ادامه",
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
      ),
    );
  }
}
