import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../View/Verify/Controller/verify_controller.dart';
import '../utils/res/colors.dart';

class ModalLogout extends StatefulWidget {
  const ModalLogout({Key? key}) : super(key: key);


  @override
  _ModalLogoutState createState() => _ModalLogoutState();

}

class _ModalLogoutState extends State<ModalLogout> {
  var box=GetStorage();
  var verifyController=Get.put(VerifyController());
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
                child: const Padding(
                  padding: EdgeInsets.only(right: 16,top: 16),
                  child: Text(
                    "آیا می خواهید از برنامه خارج شوید ؟",
                    textAlign: TextAlign.right,  style: TextStyle(
                    fontFamily: 'IranSANS',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color:ColorsApp.colorTextTitle,
                  ),
                  ),
                ),
              ),

              //  const Divider(height: 15.0,color: Colors.transparent,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 16,right: 16),
                      child:Text(
                        "خیر",
                        style: TextStyle(
                          fontFamily: 'IranSANS',
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color:ColorsApp.colorTextTitle,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      verifyController.deletePushToken(context);


                    },
                    child: const Padding(

                      padding: EdgeInsets.only(left: 16,right: 16),
                      child: Text(
                        "بله",
                        style: TextStyle(
                          fontFamily: 'IranSANS',
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: ColorsApp.colorTextTitle,
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
