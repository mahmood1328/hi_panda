
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../Repository/login.dart';
import '../../../Widget/snackbar.dart';
import '../../../utils/dialog.dart';
import '../../Verify/Page/verify_screen.dart';

class LoginController extends GetxController{
  late final LoginRepository _repository;
  var isLoading = true.obs;
  var isCheck = true.obs;

  getChecking(){if(isCheck.value){isCheck.value=false;}else{isCheck.value=true;}}


  String? validatePhone(String value) {
    if (!(value.length >= 10) && value.isNotEmpty) {
      return " phone should not be less than 6 characters  ";
    }
    return null;
  }
  @override
  void onInit() {
    _repository = LoginRepository();
    super.onInit();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
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

  login(mobile,smsCode,BuildContext context) async {

    showProgress(context);
    await _repository.login(mobile, smsCode).then((value) {

      try {
        if(isLoading.value){
          //Get.to(()=>MainPage());
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) =>  VerifyScreen(phone: mobile,)),
                  (Route<dynamic> route) => true);
          removeProgress();
        }else{
          ShowSnackBar().showSnackBar(
            context,
            "error Connection",duration: const Duration(seconds: 5),
          );
          removeProgress();
        }

      } catch (e) {
        removeProgress();
        print(e);
      }
    }).catchError((value) {
      removeProgress();
      //print(value);
      ShowSnackBar().showSnackBar(
        context,
        value.toString(),duration: const Duration(seconds: 5),
      );
    });
  }

}