
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Repository/login.dart';
import '../../../Widget/snackbar.dart';
import '../../../utils/dialog.dart';
import '../../../utils/res/colors.dart';
import '../../Main_page/Page/main_page.dart';

class SplashController extends GetxController{
  final box = GetStorage();
  late final LoginRepository _repository;
  var loading=false.obs;
  @override
  void onInit() {
    _repository = LoginRepository();
    super.onInit();
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


  // getAppInfo(BuildContext context) async {
  //   await _repository.getAppInfo().then((value) {
  //     showProgress(context);
  //     try {
  //       if(value.appInfo.name!=""){
  //         box.write("logo", value.appInfo.logo);
  //         box.write("primary", value.appInfo.primary);
  //         box.write("primaryLight", value.appInfo.primaryLight);
  //         box.write("primaryDark", value.appInfo.primaryDark);
  //         box.write("bgColor", value.appInfo.bgColor);
  //         box.write("name", value.appInfo.name);
  //         removeProgress();
  //       }else{
  //         ShowSnackBar().showSnackBar(
  //           context,
  //           "error Connection",duration: const Duration(seconds: 5),
  //         );
  //         removeProgress();
  //       }
  //
  //     } catch (e) {
  //       ShowSnackBar().showSnackBar(
  //         context,
  //         e.toString(),duration: const Duration(seconds: 5),
  //       ); removeProgress();
  //     }
  //   }).catchError((value) {
  //     //print(value);
  //     ShowSnackBar().showSnackBar(
  //       context,
  //       value.toString(),duration: const Duration(seconds: 5),
  //     );
  //   });
  // }


  updateApp(BuildContext context) async {
    // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    // AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    print('Running on ${packageInfo.version}  moooodeeeeel');
      await _repository.getAppInfo().then((value) {
        try {
            print(value.appVersion.androidVersion);
            loading.value=true;
            if(packageInfo.version!=value.appVersion.androidVersion){
              showCupertinoModalBottomSheet(
                  context: context,
                  enableDrag: false,
                  isDismissible: false,
                  useRootNavigator: true,
                  duration: const Duration(milliseconds: 1000),
                  backgroundColor: Colors.white,
                  builder: (BuildContext context) =>
                      Material(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height/1.7,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                const SizedBox(height: 50,),
                                const  Text(
                                  "برنامه نیاز به بروزرسانی دارد",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  textAlign: TextAlign.end,
                                ),
                                const  SizedBox(height: 50,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: value.appVersion.androidDownloadList.map((e) =>
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 5),
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                  maximumSize: MaterialStateProperty.all( Size(MediaQuery.of(context).size.width/1.2, 50)),
                                                  minimumSize: MaterialStateProperty.all( Size(MediaQuery.of(context).size.width/1.2, 50)),
                                                  shadowColor: MaterialStateProperty.all<Color>(ColorsApp.primary),
                                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                  elevation:MaterialStateProperty.all(10) ,
                                                  backgroundColor: MaterialStateProperty.all<Color>(ColorsApp.primary),
                                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                                                      RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(8),
                                                          side: const BorderSide(color:ColorsApp.primary)
                                                      )
                                                  )
                                              ),

                                              onPressed: () {
                                                launch(e.url);
                                              },
                                              child:  Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  const Icon(Icons.download),
                                                  Text(
                                                    e.title??"",
                                                    style: const TextStyle(
                                                        fontSize: 17,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white),
                                                    textAlign: TextAlign.end,
                                                  ),
                                                ],
                                              ),),
                                          ),

                                      ).toList(),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height/2/3,),
                                    value.appVersion.androidRequierdUpdate==true?const SizedBox():
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "بعدا انجام می دهم",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w700,decoration: TextDecoration.underline,
                                                    color: Colors.black.withOpacity(0.5)),
                                                textAlign: TextAlign.end,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ));
            }
            print('Running on ${value.appVersion.androidVersion}  androidVersion');

        } catch (e) {
        }
      }).catchError((value) {
        //print(value);
      });

  }
}