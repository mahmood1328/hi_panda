import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../Widget/snackbar.dart';
import '../../Chat/Controller/chat_controller.dart';

class MainPageController extends GetxController{
var box=GetStorage();
  final navMenuIndex = 4.obs;
  var role="".obs;
  PageController pageController = PageController(initialPage: 4);
var appController = Get.put(ChatController());
  void onItemTapped(int index) {
    navMenuIndex.value = index;
    if( navMenuIndex.value==3){
      box.read("isConsult")? appController.setConnectionId(0, 4):  appController.setConnectionId(0, 1);
    }else{
      appController.setConnectionId(0, 4);
    }
    pageController.jumpToPage(
      index,
    );update();
  }



  DateTime? backButtonPressTime;
  Future<bool> handleWillPop(BuildContext context) async {
    final now = DateTime.now();
    final backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
        backButtonPressTime == null ||
            now.difference(backButtonPressTime!) > const Duration(seconds: 3);

    if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
      backButtonPressTime = now;
      ShowSnackBar().showSnackBar(
        context,
        "دوباره کلیک گنید",
        duration: const Duration(seconds: 2),
        noAction: true,
      );
      return false;
    }
    return true;
  }

}