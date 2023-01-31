
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../Repository/login.dart';
import '../../../Widget/snackbar.dart';
import '../../../utils/dialog.dart';
import '../../Main_page/Page/main_page.dart';
import '../../Planer/Components/answer_components.dart';

class RegisterController extends GetxController{
  final box = GetStorage();
   var sexValue="".obs;
  late final LoginRepository _repository;
  var isLoading = false.obs;
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerSex = TextEditingController();

  getSex(String sex){
    sexValue.value=sex;
  }

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

  register(name,sex,BuildContext context) async {
    showProgress(context);
    await _repository.register(name, sex).then((value) {

      try {
        if(value!=""){
          //Get.to(()=>MainPage());
          box.write("name", "$sex $name");
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) =>  MainPage()),
                  (Route<dynamic> route) => false);
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
        ShowSnackBar().showSnackBar(
          context,
          e.toString(),duration: const Duration(seconds: 5),
        );
      }
    }).catchError((value) {
      removeProgress();
      print(value);
      ShowSnackBar().showSnackBar(
        context,
        value.toString(),duration: const Duration(seconds: 5),
      );
    });
  }

}