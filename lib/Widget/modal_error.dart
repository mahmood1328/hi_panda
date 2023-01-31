import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../View/Verify/Controller/verify_controller.dart';
import '../View/test_farahi/controller/courses.dart';
import '../utils/res/colors.dart';
import '../utils/size_config.dart';

class ModalError extends StatefulWidget {
  const ModalError({Key? key}) : super(key: key);


  @override
  _ModalErrorState createState() => _ModalErrorState();

}

class _ModalErrorState extends State<ModalError> {
  var box=GetStorage();
  var verifyController=Get.put(VerifyController());
  var coursesController=Get.put(CoursesController());
  @override
  Widget build(BuildContext context) {
    return Material(
        color: ColorsApp.white,
        child: SafeArea(
          top: false,
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

              SizedBox(
                width: MediaQuery.of(context).size.width,
                child:  Padding(
                  padding: const EdgeInsets.only(right: 16,top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [

                      Icon(Icons.warning_amber,color: ColorsApp.red,size: 40,),
                      Text(
                        "خطا در ارتباط با سرور",
                        textAlign: TextAlign.right,  style: TextStyle(
                        fontFamily: 'IranSANS',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color:ColorsApp.colorTextTitle,
                      ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),

              //  const Divider(height: 15.0,color: Colors.transparent,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      verifyController.deletePushToken(context);


                    },
                    child:  Container(
                      alignment: Alignment.center,
                      width:SizeConfig.screenWidth/2.5,

                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: ColorsApp.red
                      ),
                      padding: const EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
                      child: const Text(
                        "خروج از حساب کاربری",
                        style: TextStyle(
                          fontFamily: 'IranSANS',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: ColorsApp.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                      coursesController.getMyCourses(context);
                    },
                    child:  Container(
                      alignment: Alignment.center,
                      width:SizeConfig.screenWidth/2.5,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: ColorsApp.red
                      ),
                      padding: const EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
                      child:const Text(
                        "بارگزاری دوباره اطلاعات",
                        style: TextStyle(
                          fontFamily: 'IranSANS',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color:ColorsApp.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),

                ],
              ),

              const Divider(height: 24.0,color: Colors.transparent,),

            ],
          ),
        ));
  }

}
