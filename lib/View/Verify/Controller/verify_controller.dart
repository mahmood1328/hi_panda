
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../Repository/authorize.dart';
import '../../../Repository/login.dart';
import '../../../Widget/snackbar.dart';
import '../../../utils/dialog.dart';
import '../../Login/page/login_screen.dart';
import '../../Main_page/Controller/controller_main_page.dart';
import '../../Main_page/Page/main_page.dart';
import '../../Register/Page/register_screen.dart';
import '../../test_farahi/page/home_test.dart';

class VerifyController extends GetxController{
  final box = GetStorage();
  late final LoginRepository _repository;
  late final AuthorizeRepository _authorizeRepository;
  String codeIndex="0";
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  final TextEditingController controller5 = TextEditingController();

  @override
  void onInit() {
    _repository = LoginRepository();
     _authorizeRepository=AuthorizeRepository();
    super.onInit();
  }


  initCode(String code){
    codeIndex=code;
  }
  late OverlayEntry overlayEntry;
  showProgress(BuildContext context){
    overlayEntry = OverlayEntry(builder: (c) {
      return const FunkyOverlay();
    });
    Overlay.of(context)!.insert(overlayEntry);
  }

  removeProgress(){
    overlayEntry.remove();
  }


  verify(phone,code,BuildContext context,bool forgetPass) async {

    if(code == null || code.length < 4){
      ShowSnackBar().showSnackBar(
        context,
       "کد وارد شده صحیح نیست",
      );
      return;
    }
    await _repository.verify(phone, code).then((value) {
      showProgress(context);
      try {
        if(value.token!=""){
          box.write("tokenn", value.token);
          print(value.token);
          box.write("name", value.name);
          box.write("phone", phone);
          box.write("role", value.role);
          box.write("userId", value.userId);
          box.write("isSupport", value.isSupport);
          box.write("isConsult", value.isConsult);
          box.write("loginCode", value.loginCode);
          


          if(forgetPass){
            //Get.to(()=>UpdatePasswordPage());
          }else{

          value.newUser? Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) =>  RegisterScreen()),
                  (Route<dynamic> route) => false):   Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) =>  MainPage()),
                  (Route<dynamic> route) => false);
          }
          removeProgress();

        }else{
          ShowSnackBar().showSnackBar(
            context,
            "error Connection",duration: const Duration(seconds: 5),
          );
          removeProgress();
        }

      } catch (e) {
        ShowSnackBar().showSnackBar(
          context,
          e.toString(),duration: const Duration(seconds: 5),
        ); removeProgress();
      }
    }).catchError((value) {
      //print(value);
      ShowSnackBar().showSnackBar(
        context,
        value.toString(),duration: const Duration(seconds: 5),
      );
    });
  }

  final controller = Get.put(MainPageController());
  pushToken(String pushToken) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print('Running on ${androidInfo.model}  moooodeeeeel');
    if(box.read("loginCode")!=null){
      await _authorizeRepository.savePushTokenMobileInfo( pushToken, androidInfo.device!, androidInfo.version.release!, "-", androidInfo.model!
          , "V1.0",box.read("loginCode")).then((value) {
        try {
          if(value.message!=""){
          }else{
          }

        } catch (e) {
        }
      }).catchError((value) {
        //print(value);
      });
    }


  }

  deletePushToken(BuildContext context) async {
    showProgress(context);
      await _authorizeRepository.deletePushToken(box.read("loginCode")).then((value) {
        try {
          if(value.message!=""){
            removeProgress();
            controller.onItemTapped(3);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) =>  LoginScreen()),
                    (Route<dynamic> route) => false);

            box.remove("loginCode");
            box.remove("tokenn");
            box.remove("name");
            box.remove("phone");
          }else{
            removeProgress();
          }

        } catch (e) {
          removeProgress();
        }
      }).catchError((value) {
        removeProgress();
        //print(value);
      });



  }
}


//eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiMTEyMDUiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJTdXBwb3J0IiwiZXhwIjoxNjYzMTM3MjY1fQ.ZawgYQvOl7p3k2JqBDq7M1nisW3ols7QUKcDQ1Gq66M