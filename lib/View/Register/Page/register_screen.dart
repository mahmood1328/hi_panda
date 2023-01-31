import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Widget/snackbar.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/res/dimensions.dart';
import '../../../utils/size_config.dart';
import '../controller/register_controller.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var registerController=Get.put(RegisterController());
    return Scaffold(
      backgroundColor: ColorsApp.white,
        body: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);

                    }, icon:const Icon(Icons.arrow_back)),
                  ],
                ),
                const  SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const [
                    Text("ثبت نام تکمیلی",
                      style: TextStyle(color: ColorsApp.black,fontSize: 20,fontFamily: "robot",fontWeight: FontWeight.bold),),
                  ],
                ),
                const  SizedBox(height: 120,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const [
                     Text("لطفااطلاعات خود را کامل کنید",
                      style: TextStyle(color: ColorsApp.black,fontSize: 16,fontFamily: "robot",fontWeight: FontWeight.normal),),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                  child: TextField(

                    // onChanged: (value) {
                    //   if(value.length>=10){
                    //     setState(() {
                    //       name=true;
                    //     });
                    //   }else{
                    //     setState(() {
                    //       name=false;
                    //     });
                    //   }
                    // },

                    cursorColor: Colors.grey,
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                    controller: registerController.controllerName,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black45, fontFamily: 'robot',
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: InputDecoration(
                      fillColor: Color(0xffF9F9F9),
                      filled: true,

                      suffixIcon: const Icon(Icons.perm_identity,color: Colors.grey,),
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
                          color:Color(0xffF9F9F9),
                          width: 0.7,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      hintText: "نام کاربری",
                      hintStyle: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black45,
                          fontFamily: 'robot'),
                    ),
                    maxLines: 1,
                    keyboardType: TextInputType.name,
                    // maxLength: 11,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                  child: TextField(

                    // onChanged: (value) {
                    //   if(value.length>=10){
                    //     setState(() {
                    //       name=true;
                    //     });
                    //   }else{
                    //     setState(() {
                    //       name=false;
                    //     });
                    //   }
                    // },

                    cursorColor: Colors.grey,
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                    controller: registerController.controllerSex,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black45, fontFamily: 'robot',
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: InputDecoration(
                      fillColor: Color(0xffF9F9F9),
                      filled: true,
                      suffixIcon: const Icon(Icons.perm_identity,color: Colors.grey,),
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
                          color:Color(0xffF9F9F9),
                          width: 0.7,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      hintText: "جنسیت",
                      hintStyle: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black45,
                          fontFamily: 'robot'),
                    ),
                    maxLines: 1,
                    keyboardType: TextInputType.name,
                    // maxLength: 11,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: SizeConfig.screenHeight/9,right: 50,left: 50),
                  child: Center(
                    child: ElevatedButton(

                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenHeight, 50)),
                          foregroundColor: MaterialStateProperty.all<Color>(ColorsApp.white),
                          backgroundColor: MaterialStateProperty.all<Color>(ColorsApp.primary),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(color:ColorsApp.primary)
                              )
                          )
                      ),

                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if(registerController.controllerName.text==""&&registerController.controllerSex.text==""){
                          ShowSnackBar().showSnackBar(
                            context,
                            "فیلد ها را کامل کنید",duration: const Duration(seconds: 5),
                          );
                        }else{
                          registerController.register(registerController.controllerName.text,registerController.controllerSex.text,context);

                        }
                       // Get.to(MainPage());
                      },
                      child: const Text(
                        "تایید",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,fontFamily: "robot",
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
